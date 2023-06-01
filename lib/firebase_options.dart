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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA1MYAHsg0JYn_LrAQcuXPGaqhyVbDnffg',
    appId: '1:943958726:web:d7f08d95e95b685a5585c7',
    messagingSenderId: '943958726',
    projectId: 'the-project-flutter',
    authDomain: 'the-project-flutter.firebaseapp.com',
    storageBucket: 'the-project-flutter.appspot.com',
    measurementId: 'G-WJDDLK11YR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMCX_q3GpV9-e3StnYb5WBvbdokII4HI0',
    appId: '1:943958726:android:de441aa58a888b175585c7',
    messagingSenderId: '943958726',
    projectId: 'the-project-flutter',
    storageBucket: 'the-project-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLDrJ52KjP6Te0LJLQFu4lsIQKF37RSAE',
    appId: '1:943958726:ios:eac4ef040b02967c5585c7',
    messagingSenderId: '943958726',
    projectId: 'the-project-flutter',
    storageBucket: 'the-project-flutter.appspot.com',
    iosBundleId: 'com.example.flutterLoginAuthFirebase',
  );
}