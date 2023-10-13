import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/saved_movies/bloc/saved_movie_bloc.dart';

import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SavedMoviesScreen extends StatefulWidget {
  const SavedMoviesScreen({super.key});

  @override
  State<SavedMoviesScreen> createState() => _SavedMoviesScreenState();
}

class _SavedMoviesScreenState extends State<SavedMoviesScreen> {
  final _savedMovieBloc = SavedMovieBloc(GetIt.I<AbstractMovieRepository>());
  @override
  void initState() {
    _savedMovieBloc.add(LoadSavedMovies());
    super.initState();
  }

  removeMovieFromSaved(movie) {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;
        DatabaseReference movieRef =
            FirebaseDatabase.instance.ref().child('savedMovies').child(uid);

        movieRef.child(movie.id.toString()).remove();
        setState(() {});
      }
    } on Exception catch (e) {
      print('Failed to remove');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Сохраненные фильмы'),
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<SavedMovieBloc, SavedMovieState>(
          bloc: _savedMovieBloc,
          builder: (context, state) {
            if (state is SavedMoviesLoaded) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Моя коллекция'),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.separated(
                        itemCount: state.movieList.length,
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.grey,
                              endIndent: 16,
                              indent: 16,
                              thickness: 1.5,
                            ),
                        itemBuilder: (context, i) {
                          final movie = state.movieList[i];

                          return ListTile(
                            leading: Image.network(
                              movie.icon,
                              width: 70,
                              height: 70,
                            ),
                            title: Text(
                              movie.title,
                              style: theme.textTheme.bodyMedium,
                            ),
                            subtitle: Text(
                              movie.year.toString(),
                              style: theme.textTheme.labelSmall,
                            ),
                            trailing:
                                const Icon(Icons.close, color: Colors.black),
                            onTap: () {
                              removeMovieFromSaved(movie);
                              state.movieList.removeAt(i);
                              setState(() {});
                            },
                          );
                        }),
                  ),
                ],
              );
            }
            if (state is SavedMoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Icon(Icons.pending));
          },
        ));
  }
}
