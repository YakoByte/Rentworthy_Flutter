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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDD_2bC0RZvt18leXkJd8KXPcrZnCYNATM',
    appId: '1:1073180144883:android:df91a626100e3e65d53386',
    messagingSenderId: '1073180144883',
    projectId: 'rentworthy-340fd',
    databaseURL: 'https://rentworthy-340fd-default-rtdb.firebaseio.com',
    storageBucket: 'rentworthy-340fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUnszi2vvwTlmMdSrs-WdM0dUlOA2k18s',
    appId: '1:1073180144883:ios:dd78f8ef79ac829cd53386',
    messagingSenderId: '1073180144883',
    projectId: 'rentworthy-340fd',
    databaseURL: 'https://rentworthy-340fd-default-rtdb.firebaseio.com',
    storageBucket: 'rentworthy-340fd.appspot.com',
    androidClientId: '1073180144883-34brsgrqhckc1d7llsg0d8i1nain5mug.apps.googleusercontent.com',
    iosClientId: '1073180144883-u5k9s4t7l2gqoanjgrliju9l5ped3p7r.apps.googleusercontent.com',
    iosBundleId: 'com.rentworthy.app',
  );
}
