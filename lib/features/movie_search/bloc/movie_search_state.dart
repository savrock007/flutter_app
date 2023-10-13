part of 'movie_search_bloc.dart';

class MovieSearchState {}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchLoaded extends MovieSearchState {
  MovieSearchLoaded({required this.movieList});
  final List<Movie> movieList;
}

class MovieSearchLoadingFailiure extends MovieSearchState {
  final Object? exception;

  MovieSearchLoadingFailiure({required this.exception});
}
