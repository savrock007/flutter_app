part of 'movie_details_bloc.dart';

class MovieDetailsEvent {}

class LoadMovieDetails extends MovieDetailsEvent {
  Movie movie;

  LoadMovieDetails({required this.movie});
}
