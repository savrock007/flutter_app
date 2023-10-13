// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailsScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    AuthGateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthGateScreen(),
      );
    },
    SavedMoviesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SavedMoviesScreen(),
      );
    },
    MovieListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieListScreen(),
      );
    },
    MovieSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieSearchScreen(),
      );
    },
  };
}

/// generated route for
/// [MovieDetailsScreen]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required Movie movie,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static const PageInfo<MovieDetailsRouteArgs> page =
      PageInfo<MovieDetailsRouteArgs>(name);
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movie,
  });

  final Key? key;

  final Movie movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [AuthGateScreen]
class AuthGateRoute extends PageRouteInfo<void> {
  const AuthGateRoute({List<PageRouteInfo>? children})
      : super(
          AuthGateRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthGateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SavedMoviesScreen]
class SavedMoviesRoute extends PageRouteInfo<void> {
  const SavedMoviesRoute({List<PageRouteInfo>? children})
      : super(
          SavedMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedMoviesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieListScreen]
class MovieListRoute extends PageRouteInfo<void> {
  const MovieListRoute({List<PageRouteInfo>? children})
      : super(
          MovieListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieSearchScreen]
class MovieSearchRoute extends PageRouteInfo<void> {
  const MovieSearchRoute({List<PageRouteInfo>? children})
      : super(
          MovieSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
