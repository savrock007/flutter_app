part of 'saved_movie_bloc.dart';

class SavedMovieState {}

class SavedMovieInitial extends SavedMovieState {}

class SavedMoviesLoading extends SavedMovieState {}

class SavedMoviesLoaded extends SavedMovieState {
  SavedMoviesLoaded({required this.movieList});
  final List<Movie> movieList;
}

class SavedMoviesLoadingFailiure extends SavedMovieState {
  final Object? exception;

  SavedMoviesLoadingFailiure({required this.exception});
}
