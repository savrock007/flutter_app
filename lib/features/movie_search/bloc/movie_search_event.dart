part of 'movie_search_bloc.dart';

class MovieSearchEvent {}

class SearchMovie extends MovieSearchEvent {
  String text;
  SearchMovie(this.text);
}
