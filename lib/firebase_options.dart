// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD_Q0xc_fHfsrAYRSMURMVu8y7j8ol5sQo',
    appId: '1:15554191524:web:922f6de95e7930589fc631',
    messagingSenderId: '15554191524',
    projectId: 'fbase-app-49751',
    authDomain: 'fbase-app-49751.firebaseapp.com',
    databaseURL: 'https://fbase-app-49751-default-rtdb.firebaseio.com',
    storageBucket: 'fbase-app-49751.appspot.com',
    measurementId: 'G-0DKMLM14DP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtbAQ2fZP3pZP_PL23EvGGldPEhMmQSI8',
    appId: '1:15554191524:android:d6f06d81159eb2649fc631',
    messagingSenderId: '15554191524',
    projectId: 'fbase-app-49751',
    databaseURL: 'https://fbase-app-49751-default-rtdb.firebaseio.com',
    storageBucket: 'fbase-app-49751.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArOqvqW__Oupcid45GUg6gV6sSq-KByc4',
    appId: '1:15554191524:ios:688874e8a3e8f8a79fc631',
    messagingSenderId: '15554191524',
    projectId: 'fbase-app-49751',
    databaseURL: 'https://fbase-app-49751-default-rtdb.firebaseio.com',
    storageBucket: 'fbase-app-49751.appspot.com',
    iosClientId: '15554191524-3meqvvkga0mkn45d60ruluudn83dh2kb.apps.googleusercontent.com',
    iosBundleId: 'com.flutterApplication.savrock',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArOqvqW__Oupcid45GUg6gV6sSq-KByc4',
    appId: '1:15554191524:ios:4c058ea52a5cf7c69fc631',
    messagingSenderId: '15554191524',
    projectId: 'fbase-app-49751',
    databaseURL: 'https://fbase-app-49751-default-rtdb.firebaseio.com',
    storageBucket: 'fbase-app-49751.appspot.com',
    iosClientId: '15554191524-ep6j7gauo3m0gonuh70idlfcpa4hba56.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
