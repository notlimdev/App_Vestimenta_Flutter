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
    apiKey: 'AIzaSyBM2-avKT77B7LiQ7uDh7BSSMlCEz-5ybA',
    appId: '1:378976952639:web:a57a2fcc5da742cf74b38a',
    messagingSenderId: '378976952639',
    projectId: 'dbfirevestimenta',
    authDomain: 'dbfirevestimenta.firebaseapp.com',
    storageBucket: 'dbfirevestimenta.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCB1w7xLIH6DZC0G808yn_fF8j869JFFrs',
    appId: '1:378976952639:android:4246c765cbe0d18d74b38a',
    messagingSenderId: '378976952639',
    projectId: 'dbfirevestimenta',
    storageBucket: 'dbfirevestimenta.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZJVNXZQmzjLPZuV0fhouweLWYiSYBWWQ',
    appId: '1:378976952639:ios:39ad37a756cac01a74b38a',
    messagingSenderId: '378976952639',
    projectId: 'dbfirevestimenta',
    storageBucket: 'dbfirevestimenta.appspot.com',
    iosClientId: '378976952639-eahv4p2btmsqbc1mh1v4nvijsg3hkn6m.apps.googleusercontent.com',
    iosBundleId: 'com.example.appVestimenta',
  );
}
