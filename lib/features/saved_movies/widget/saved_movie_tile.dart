import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/movie/models/movie.dart';
import 'package:flutter_application_1/theme/theme.dart';

class SavedMovieTile extends StatelessWidget {
  final Movie movie;
  const SavedMovieTile({super.key, required this.movie});

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
      trailing: const Icon(Icons.close, color: Colors.black),
      onTap: () {
        removeMovieFromSaved();
      },
    );
  }

  removeMovieFromSaved() {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;
        DatabaseReference movieRef =
            FirebaseDatabase.instance.ref().child('savedMovies').child(uid);

        movieRef.child(movie.id.toString()).remove();
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
