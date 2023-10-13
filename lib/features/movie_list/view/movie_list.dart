import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/services/auth_service.dart';
import 'package:flutter_application_1/features/movie_details/widgets/widget.dart';
import 'package:flutter_application_1/features/movie_list/bloc/movie_list_bloc.dart';

import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final _movieBloc = MovieListBloc(GetIt.I<AbstractMovieRepository>());
  AuthService authService = AuthService();
  @override
  void initState() {
    _movieBloc.add(LoadMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<MovieListBloc, MovieListState>(
        bloc: _movieBloc,
        builder: (context, state) {
          if (state is MovieListLoaded) {
            return Column(
              children: [
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

                        return MovieListTile(
                          movie: movie,
                        );
                      }),
                ),
                const FooterButtons(),
              ],
            );
          }

          if (state is MovieListLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Icon(Icons.pending));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          authService.signOut();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
