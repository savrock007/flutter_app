import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final AbstractMovieRepository movieRepository;
  MovieDetailsBloc(this.movieRepository) : super(MovieDetailsInitial()) {
    on<LoadMovieDetails>((event, emit) {
      emit(MovieDetailsLoaded(movie: event.movie));
    });
  }
}
