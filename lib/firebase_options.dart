// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:defat/api_key.dart';
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: androidAPIkey,
    appId: '1:865969018102:android:5716e5df0baca058a988d7',
    messagingSenderId: '865969018102',
    projectId: 'defat-e1a2d',
    storageBucket: 'defat-e1a2d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: iosAPIkey,
    appId: '1:865969018102:ios:cb66fd470932a750a988d7',
    messagingSenderId: '865969018102',
    projectId: 'defat-e1a2d',
    storageBucket: 'defat-e1a2d.appspot.com',
    iosBundleId: 'com.example.defat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: iosAPIkey,
    appId: '1:865969018102:ios:4e358c90e1835439a988d7',
    messagingSenderId: '865969018102',
    projectId: 'defat-e1a2d',
    storageBucket: 'defat-e1a2d.appspot.com',
    iosBundleId: 'com.example.defat.RunnerTests',
  );
}
