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
    apiKey: 'AIzaSyD6S3K1rWGFiAtgSmwH3YOAaq05IrkU5Uw',
    appId: '1:445830349275:web:c44d54b606ba4310e927fe',
    messagingSenderId: '445830349275',
    projectId: 'chat-app-4b14c',
    authDomain: 'chat-app-4b14c.firebaseapp.com',
    storageBucket: 'chat-app-4b14c.appspot.com',
    measurementId: 'G-RG94063FBM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB78w4oUn3y-x_VKdJ0CU-RG8rfa6ZS1rA',
    appId: '1:445830349275:android:949a613b8b2f2b97e927fe',
    messagingSenderId: '445830349275',
    projectId: 'chat-app-4b14c',
    storageBucket: 'chat-app-4b14c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuFwGGmCUz1rRcRe0JtgafWwkilxthffo',
    appId: '1:445830349275:ios:0f7e93e033889dc6e927fe',
    messagingSenderId: '445830349275',
    projectId: 'chat-app-4b14c',
    storageBucket: 'chat-app-4b14c.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuFwGGmCUz1rRcRe0JtgafWwkilxthffo',
    appId: '1:445830349275:ios:0f7e93e033889dc6e927fe',
    messagingSenderId: '445830349275',
    projectId: 'chat-app-4b14c',
    storageBucket: 'chat-app-4b14c.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6S3K1rWGFiAtgSmwH3YOAaq05IrkU5Uw',
    appId: '1:445830349275:web:0dca07607c5f7b44e927fe',
    messagingSenderId: '445830349275',
    projectId: 'chat-app-4b14c',
    authDomain: 'chat-app-4b14c.firebaseapp.com',
    storageBucket: 'chat-app-4b14c.appspot.com',
    measurementId: 'G-QQEB0L9ES9',
  );
}
