import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/movie_details/bloc/movie_details_bloc.dart';
import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final _movieDetailsBloc = MovieDetailsBloc(
    GetIt.I<AbstractMovieRepository>(),
  );
  bool saved = false;
  @override
  void initState() {
    _movieDetailsBloc.add(LoadMovieDetails(movie: widget.movie));
    checkIfMovieSaved(widget.movie).then((value) {
      setState(() {
        saved = value;
      });
    });
    super.initState();
  }

  addToDb(movie) {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;
        DatabaseReference movieRef =
            FirebaseDatabase.instance.ref().child('savedMovies').child(uid);

        movieRef.child(movie.id.toString()).set({
          "movieId": movie.id,
          "posterUrl": movie.icon,
          "rating": movie.rating,
          "title": movie.title,
          "year": movie.year,
          "countries": movie.countries,
          "genres": movie.genres,
        });
      }
      setState(() {
        saved = true;
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<bool> checkIfMovieSaved(movie) async {
    User? user = FirebaseAuth.instance.currentUser;

    String uid = user!.uid;
    DatabaseReference movieRef =
        FirebaseDatabase.instance.ref().child('savedMovies').child(uid);

    final snapshot = await movieRef.child(movie.id.toString()).get();

    if (snapshot.value == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        bloc: _movieDetailsBloc,
        builder: (context, state) {
          if (state is MovieDetailsLoaded) {
            final movie = state.movie;
            return Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            style: const TextStyle(fontSize: 28),
                            textAlign: TextAlign.left,
                            movie.title,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        movie.icon,
                        width: 200,
                        height: 200,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Год выпуска: ${movie.year}",
                              style: theme.textTheme.labelMedium,
                              softWrap: true,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Страна: ${movie.countries[0]}",
                              style: theme.textTheme.labelMedium,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Рейтинг: ${movie.rating}",
                              style: theme.textTheme.labelMedium,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Жантры: ",
                              style: theme.textTheme.labelMedium,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: movie.genres.length,
                              itemBuilder: (context, i) {
                                final genre = movie.genres[i];

                                return ListTile(
                                  dense: true,
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      genre,
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addToDb(widget.movie);
        },
        child: Icon(saved ? Icons.check : Icons.add),
      ),
    );
  }
}
