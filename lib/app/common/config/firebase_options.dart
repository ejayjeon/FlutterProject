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
    apiKey: 'AIzaSyBVM_jW79Fz7bxtnL13B1HNm67VRduE2W8',
    appId: '1:231092113503:web:123d54bc8f2e3edb1e4bea',
    messagingSenderId: '231092113503',
    projectId: 'whoever-fcm',
    authDomain: 'whoever-fcm.firebaseapp.com',
    storageBucket: 'whoever-fcm.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyn34FXY0ZU2LE1eAmOIeR1jUsWQlCCfc',
    appId: '1:231092113503:android:30549cad4ab57e0f1e4bea',
    messagingSenderId: '231092113503',
    projectId: 'whoever-fcm',
    storageBucket: 'whoever-fcm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCviG3MbhNw6awkRE9plS0Ujn0c2m_u8P0',
    appId: '1:231092113503:ios:c563bdf56db801071e4bea',
    messagingSenderId: '231092113503',
    projectId: 'whoever-fcm',
    storageBucket: 'whoever-fcm.appspot.com',
    iosBundleId: 'com.example.whoever',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCviG3MbhNw6awkRE9plS0Ujn0c2m_u8P0',
    appId: '1:231092113503:ios:82299b1135c5eb291e4bea',
    messagingSenderId: '231092113503',
    projectId: 'whoever-fcm',
    storageBucket: 'whoever-fcm.appspot.com',
    iosBundleId: 'com.example.whoever.RunnerTests',
  );
}
