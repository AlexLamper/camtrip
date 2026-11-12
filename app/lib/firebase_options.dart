// Firebase settings for push notifications. Filled in at build time with
// --dart-define (see .github/workflows); without them the app runs without push.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static const _projectId = String.fromEnvironment('FIREBASE_PROJECT_ID');
  static const _senderId = String.fromEnvironment('FIREBASE_SENDER_ID');
  static const _iosApiKey = String.fromEnvironment('FIREBASE_IOS_API_KEY');
  static const _iosAppId = String.fromEnvironment('FIREBASE_IOS_APP_ID');
  static const _androidApiKey = String.fromEnvironment('FIREBASE_ANDROID_API_KEY');
  static const _androidAppId = String.fromEnvironment('FIREBASE_ANDROID_APP_ID');

  static FirebaseOptions? get currentPlatformOrNull {
    if (kIsWeb || _projectId.isEmpty) return null;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        if (_iosAppId.isEmpty) return null;
        return const FirebaseOptions(
          apiKey: _iosApiKey,
          appId: _iosAppId,
          messagingSenderId: _senderId,
          projectId: _projectId,
          iosBundleId: 'app.camtrip.camtrip',
        );
      case TargetPlatform.android:
        if (_androidAppId.isEmpty) return null;
        return const FirebaseOptions(
          apiKey: _androidApiKey,
          appId: _androidAppId,
          messagingSenderId: _senderId,
          projectId: _projectId,
        );
      default:
        return null;
    }
  }
}
