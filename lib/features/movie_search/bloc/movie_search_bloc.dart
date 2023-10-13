import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final AbstractMovieRepository movieRepository;
  MovieSearchBloc(this.movieRepository) : super(MovieSearchInitial()) {
    on<SearchMovie>(
      (event, emit) async {
        try {
          emit(MovieSearchLoading());
          final movieList = await movieRepository.searchMovie(event.text);
          emit(MovieSearchLoaded(movieList: movieList));
        } catch (e) {
          emit(MovieSearchLoadingFailiure(exception: e));
        }
      },
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 200))
          .distinct()
          .switchMap(mapper),
    );
  }
}
