import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';

import 'package:flutter_application_1/repository/movie/models/movie.dart';

class MovieRepository implements AbstractMovieRepository {
  MovieRepository({required this.dio});
  final Dio dio;

  @override
  Future getMoviesList() async {
    final response = await dio.get(
        "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?page=1",
        options: Options(headers: {
          "X-API-KEY": '1f2ab6bb-933a-43fc-b03e-7f6ba1ac8a5b',
          'Content-Type': 'application/json',
        }));

    final data = response.data['films'] as List<dynamic>;
    final movieList = data.sublist(0, 10).map((e) {
      final gernes = e['genres'].map((el) => el['genre']).toList();
      final countries = e['countries'].map((el) => el['country']).toList();
      return (Movie(
        id: e['filmId'],
        title: e['nameRu'],
        countries: countries,
        genres: gernes,
        icon: e['posterUrl'],
        rating: e['rating'],
        year: e['year'],
      ));
    }).toList();

    return movieList;
  }

  @override
  Future searchMovie(String title) async {
    final response = await dio.get(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films?order=RATING&keyword=$title&page=1',
        options: Options(headers: {
          "X-API-KEY": '1f2ab6bb-933a-43fc-b03e-7f6ba1ac8a5b',
          'Content-Type': 'application/json',
        }));

    try {
      final data = response.data['items'] as List<dynamic>;

      final movieList = data.map((e) {
        final gernes = e['genres'].map((el) => el['genre']).toList();
        final countries = e['countries'].map((el) => el['country']).toList();

        return (Movie(
          id: e['kinopoiskId'],
          title: e['nameRu'],
          countries: countries,
          genres: gernes,
          icon: e['posterUrl'],
          rating: e['ratingImdb'],
          year: e['year'],
        ));
      }).toList();
      return movieList;
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future getSavedMovies() async {
    User? user = FirebaseAuth.instance.currentUser;

    String uid = user!.uid;
    DatabaseReference movieRef =
        FirebaseDatabase.instance.ref().child('savedMovies').child(uid);

    final snapshot = await movieRef.get();

    final data = snapshot.value as Map;

    final movieList = data.entries.map((e) {
      return (Movie(
        id: e.value['movieId'],
        title: e.value['title'],
        countries: e.value['countries'],
        genres: e.value['genres'],
        icon: e.value['posterUrl'],
        rating: e.value['rating'],
        year: e.value['year'],
      ));
    }).toList();
    print(movieList);
    return movieList;
  }
}
