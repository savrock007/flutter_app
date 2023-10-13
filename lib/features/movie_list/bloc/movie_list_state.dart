part of 'movie_list_bloc.dart';

class MovieListState {}

class MovieListInitial extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  MovieListLoaded({required this.movieList});
  final List<Movie> movieList;
}

class MovieListLoadingFailiure extends MovieListState {
  final Object? exception;

  MovieListLoadingFailiure({required this.exception});
}
