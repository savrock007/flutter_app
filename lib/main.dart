import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_app.dart';
import 'package:flutter_application_1/repository/movie/abstract_movie_repository.dart';
import 'package:flutter_application_1/repository/movie/movie_repository.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';

void main() async {
  GetIt.I.registerLazySingleton<AbstractMovieRepository>(
      () => MovieRepository(dio: Dio()));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FireBaseApp());
}
