import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_list_state.dart';
part 'movie_list_event.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final AbstractMovieRepository movieRepository;

  MovieListBloc(this.movieRepository) : super(MovieListInitial()) {
    on<LoadMovieList>((event, emit) async {
      try {
        emit(MovieListLoading());
        final movieList = await movieRepository.getMoviesList();
        emit(MovieListLoaded(movieList: movieList));
      } catch (e) {
        emit(MovieListLoadingFailiure(exception: e));
      }
    });
  }
}
