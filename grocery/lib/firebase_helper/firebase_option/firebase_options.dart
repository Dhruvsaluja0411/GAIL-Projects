import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get PlatformOptions {
    if (Platform.isIOS) {
      return const FirebaseOptions(
        apiKey: 'AIzaSyD5KXbjICx_73RUn1-6_hxT0y0L6cSnJAk',
        appId: '1:930979386522:ios:e56dd4c7d037711eb3fb23',
        messagingSenderId: '930979386522',
        projectId: 'grocery-d98fa',
        iosBundleId: 'com.example.grocery',
      );
    } else {
      return const FirebaseOptions(
          apiKey: 'AIzaSyCfI-RqqVFoF1gaAGtAumPjOm5bb7g1Cvo',
          appId: '1:930979386522:android:05e18d8f8aa058e0b3fb23',
          messagingSenderId: '930979386522',
          projectId: 'grocery-d98fa');
    }
  }
}
