// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAoKfaLtVOxQt_w0olPJRyMFv2G0h3n9BE',
    appId: '1:485698947637:web:abff1a6017e653c4c03f7c',
    messagingSenderId: '485698947637',
    projectId: 'flutter-final-exam-cb50a',
    authDomain: 'flutter-final-exam-cb50a.firebaseapp.com',
    storageBucket: 'flutter-final-exam-cb50a.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrPklxJ_fhDQc2faGLSxUhJnpZtUAHE1Q',
    appId: '1:485698947637:android:494c17583fb40b5fc03f7c',
    messagingSenderId: '485698947637',
    projectId: 'flutter-final-exam-cb50a',
    storageBucket: 'flutter-final-exam-cb50a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJoYXjbAUFL4TNOFdS4wcjgvQBeYZbAD4',
    appId: '1:485698947637:ios:b4609c9139a7bfa3c03f7c',
    messagingSenderId: '485698947637',
    projectId: 'flutter-final-exam-cb50a',
    storageBucket: 'flutter-final-exam-cb50a.firebasestorage.app',
    iosBundleId: 'com.example.futterFinalExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJoYXjbAUFL4TNOFdS4wcjgvQBeYZbAD4',
    appId: '1:485698947637:ios:b4609c9139a7bfa3c03f7c',
    messagingSenderId: '485698947637',
    projectId: 'flutter-final-exam-cb50a',
    storageBucket: 'flutter-final-exam-cb50a.firebasestorage.app',
    iosBundleId: 'com.example.futterFinalExam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAoKfaLtVOxQt_w0olPJRyMFv2G0h3n9BE',
    appId: '1:485698947637:web:084a3a2474777593c03f7c',
    messagingSenderId: '485698947637',
    projectId: 'flutter-final-exam-cb50a',
    authDomain: 'flutter-final-exam-cb50a.firebaseapp.com',
    storageBucket: 'flutter-final-exam-cb50a.firebasestorage.app',
  );
}
