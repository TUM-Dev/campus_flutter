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
    apiKey: 'AIzaSyD917lW3Y2-x8UiWfUdzKDnI1iO7Qt7Z5s',
    appId: '1:944892355389:android:3fec122c5eb51ef4',
    messagingSenderId: '944892355389',
    projectId: 'tca-backend-0001',
    databaseURL: 'https://tca-backend-0001.firebaseio.com',
    storageBucket: 'tca-backend-0001.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcgSYu70ITyg2JyUc26038zhGH1Klo3cg',
    appId: '1:944892355389:ios:70b9e0e71c71af4b52db54',
    messagingSenderId: '944892355389',
    projectId: 'tca-backend-0001',
    databaseURL: 'https://tca-backend-0001.firebaseio.com',
    storageBucket: 'tca-backend-0001.appspot.com',
    androidClientId:
        '944892355389-jat7kf35dqlvc2uvlsh3vbuq8ge6s6s5.apps.googleusercontent.com',
    iosClientId:
        '944892355389-qfnnv8c4344dk8ka4904ue35rclf3ipg.apps.googleusercontent.com',
    iosBundleId: 'de.tum.tca',
  );
}
