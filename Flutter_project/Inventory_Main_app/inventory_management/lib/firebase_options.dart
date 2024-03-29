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
    apiKey: 'AIzaSyA57QckZs2QX8GMEu2dyMaoo_Lo50d4Eyo',
    appId: '1:954702165994:web:25206b67e8fcb5f1692493',
    messagingSenderId: '954702165994',
    projectId: 'inventory-management-58522',
    authDomain: 'inventory-management-58522.firebaseapp.com',
    storageBucket: 'inventory-management-58522.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2awIHV3QR8-W--R8uV0tzlyhoIGPkNrI',
    appId: '1:954702165994:android:072be1bc8456ba18692493',
    messagingSenderId: '954702165994',
    projectId: 'inventory-management-58522',
    storageBucket: 'inventory-management-58522.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-NFY3Oo2B5qYwscGe3Qp9_3PtBa1Jfig',
    appId: '1:954702165994:ios:1b416a3324e25b8f692493',
    messagingSenderId: '954702165994',
    projectId: 'inventory-management-58522',
    storageBucket: 'inventory-management-58522.appspot.com',
    iosClientId: '954702165994-h507tbta7rk2vln1k2tj7u7fnhagec7m.apps.googleusercontent.com',
    iosBundleId: 'com.example.inventoryManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-NFY3Oo2B5qYwscGe3Qp9_3PtBa1Jfig',
    appId: '1:954702165994:ios:344918fabef40bc9692493',
    messagingSenderId: '954702165994',
    projectId: 'inventory-management-58522',
    storageBucket: 'inventory-management-58522.appspot.com',
    iosClientId: '954702165994-g25v9q5h2vnve5i7m02ucn5r7n0pfq48.apps.googleusercontent.com',
    iosBundleId: 'com.example.inventoryManagement.RunnerTests',
  );
}
