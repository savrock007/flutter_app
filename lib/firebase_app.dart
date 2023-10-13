import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class FireBaseApp extends StatefulWidget {
  const FireBaseApp({super.key});

  @override
  State<FireBaseApp> createState() => _FireBaseAppState();
}

class _FireBaseAppState extends State<FireBaseApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: theme,
      // initialRoute: FirebaseAuth.instance.currentUser == null
      //     ? '/sign-in'
      //     : '/movie_list',
      routerConfig: _appRouter.config(),
      //home: MainPage(),
    );
  }
}
