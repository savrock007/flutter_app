part of 'movie_list_bloc.dart';

class MovieListEvent {}

class LoadMovieList extends MovieListEvent {}

class CheckIfMovieSaved extends MovieListEvent {
  Movie movie;

  CheckIfMovieSaved(this.movie);
}
