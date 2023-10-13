import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/theme/theme.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;
  const MovieListTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        movie.icon,
        width: 70,
        height: 70,
      ),
      title: Text(
        movie.title,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        movie.year.toString(),
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        //Navigator.of(context).pushNamed('/movie_details', arguments: movie);
        AutoRouter.of(context).push(MovieDetailsRoute(movie: movie));
      },
    );
  }
}
