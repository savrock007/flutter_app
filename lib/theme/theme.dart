import 'package:flutter/material.dart';

final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    dividerColor: Colors.white54,
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
      labelSmall: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontWeight: FontWeight.w300,
        fontSize: 15,
      ),
      labelMedium: const TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
    ));
