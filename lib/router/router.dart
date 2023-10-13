import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/auth_gate.dart';
import 'package:flutter_application_1/features/movie_details/view/movie_details_screen.dart';
import 'package:flutter_application_1/features/movie_list/view/movie_list.dart';
import 'package:flutter_application_1/features/movie_search/view/movie_search.dart';
import 'package:flutter_application_1/features/saved_movies/view/saved_movies.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_application_1/router/auth_guard.dart';
part 'router.gr.dart';

// final routes = {
//   '/sign-in': (context) => const AuthGate(),
//   '/movie_list': (context) => const MovieListScreen(),
//   '/movie_details': (context) => const MovieDetailsScreen(),
//   '/movie_search': (context) => const MovieSearch(),
//   '/my_collection': (context) => const SavedMovies(),
// };

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MovieListRoute.page, path: '/', guards: [AuthGuard()]),
        AutoRoute(page: AuthGateRoute.page, path: '/auth_gate'),
        AutoRoute(page: MovieDetailsRoute.page, path: '/movie_details'),
        AutoRoute(page: MovieSearchRoute.page, path: '/movie_search'),
        AutoRoute(page: SavedMoviesRoute.page, path: '/my_collection')
      ];
}
