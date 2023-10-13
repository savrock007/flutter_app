import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_movie_event.dart';
part 'saved_movie_state.dart';

class SavedMovieBloc extends Bloc<SavedMovieEvent, SavedMovieState> {
  final AbstractMovieRepository movieRepository;
  SavedMovieBloc(this.movieRepository) : super(SavedMovieInitial()) {
    on<LoadSavedMovies>((event, emit) async {
      try {
        emit(SavedMoviesLoading());
        final movieList = await movieRepository.getSavedMovies();
        emit(SavedMoviesLoaded(movieList: movieList));
      } catch (e) {
        emit(SavedMoviesLoadingFailiure(exception: e));
      }
    });
  }
}
