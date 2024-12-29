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
    apiKey: 'AIzaSyBRLKOSDx3iqzH5efpOUkIzSx7yJrpzAXA',
    appId: '1:599359446638:web:1eb7ba79b6084832a8107f',
    messagingSenderId: '599359446638',
    projectId: 'mrar-demo',
    authDomain: 'mrar-demo.firebaseapp.com',
    storageBucket: 'mrar-demo.firebasestorage.app',
    measurementId: 'G-XD6BESQH0C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-5sChZSDORmWs8jG7IAV9cYLtfhoboE4',
    appId: '1:599359446638:android:3f54162136119749a8107f',
    messagingSenderId: '599359446638',
    projectId: 'mrar-demo',
    storageBucket: 'mrar-demo.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqElAZAsmBdZYLg9wXMcK7edvuSBUoXQc',
    appId: '1:599359446638:ios:fe6bc31a0324504da8107f',
    messagingSenderId: '599359446638',
    projectId: 'mrar-demo',
    storageBucket: 'mrar-demo.firebasestorage.app',
    iosBundleId: 'com.example.hello',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqElAZAsmBdZYLg9wXMcK7edvuSBUoXQc',
    appId: '1:599359446638:ios:fe6bc31a0324504da8107f',
    messagingSenderId: '599359446638',
    projectId: 'mrar-demo',
    storageBucket: 'mrar-demo.firebasestorage.app',
    iosBundleId: 'com.example.hello',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBRLKOSDx3iqzH5efpOUkIzSx7yJrpzAXA',
    appId: '1:599359446638:web:d18ab240f88d8280a8107f',
    messagingSenderId: '599359446638',
    projectId: 'mrar-demo',
    authDomain: 'mrar-demo.firebaseapp.com',
    storageBucket: 'mrar-demo.firebasestorage.app',
    measurementId: 'G-4CBPSBHVBV',
  );

}