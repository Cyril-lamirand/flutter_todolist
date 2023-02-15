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
    apiKey: 'AIzaSyATrNaZu5Y2JnRsUL368qtB6cY2Ohnn7Gw',
    appId: '1:768526981849:web:5c401d4ecb93fc56a2bcc8',
    messagingSenderId: '768526981849',
    projectId: 'flutter-todolist-6f945',
    authDomain: 'flutter-todolist-6f945.firebaseapp.com',
    storageBucket: 'flutter-todolist-6f945.appspot.com',
    measurementId: 'G-X79HG97CCH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUeazOJ94zPvzFya2XiDtD5n-_Wj1UVpc',
    appId: '1:768526981849:android:643a52240a492093a2bcc8',
    messagingSenderId: '768526981849',
    projectId: 'flutter-todolist-6f945',
    storageBucket: 'flutter-todolist-6f945.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMOnzDcyex1Br5T1X_TMZ4MFd6KnopItM',
    appId: '1:768526981849:ios:62aa0b4a1d5394dba2bcc8',
    messagingSenderId: '768526981849',
    projectId: 'flutter-todolist-6f945',
    storageBucket: 'flutter-todolist-6f945.appspot.com',
    iosClientId: '768526981849-qnmpsv56okd0guiosuur6mscv8dko89k.apps.googleusercontent.com',
    iosBundleId: 'com.example.a5Todolist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMOnzDcyex1Br5T1X_TMZ4MFd6KnopItM',
    appId: '1:768526981849:ios:62aa0b4a1d5394dba2bcc8',
    messagingSenderId: '768526981849',
    projectId: 'flutter-todolist-6f945',
    storageBucket: 'flutter-todolist-6f945.appspot.com',
    iosClientId: '768526981849-qnmpsv56okd0guiosuur6mscv8dko89k.apps.googleusercontent.com',
    iosBundleId: 'com.example.a5Todolist',
  );
}
