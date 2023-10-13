import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/movie_list/widget/movie_list_tile.dart';
import 'package:flutter_application_1/features/movie_search/bloc/movie_search_bloc.dart';

import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final searchController = TextEditingController();
  final _movieBloc = MovieSearchBloc(GetIt.I<AbstractMovieRepository>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск фильмов'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text('Поиск фильмов'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              onChanged: (text) => _movieBloc.add(SearchMovie(text)),
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Поиск',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          BlocBuilder<MovieSearchBloc, MovieSearchState>(
            bloc: _movieBloc,
            builder: (context, state) {
              if (state is MovieSearchLoaded) {
                return Expanded(
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
                );
              }
              if (state is MovieSearchLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const Center(child: Icon(Icons.pending));
            },
          ),
        ],
      ),
    );
  }
}
