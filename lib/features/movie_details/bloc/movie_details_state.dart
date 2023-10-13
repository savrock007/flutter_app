part of 'movie_details_bloc.dart';

class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  Movie movie;
  MovieDetailsLoaded({required this.movie});
}
