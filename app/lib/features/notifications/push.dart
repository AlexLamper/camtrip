import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../firebase_options.dart';

/// Where a tapped notification should take the user (group id).
final pushOpenProvider = Provider((ref) => StreamController<String>.broadcast());

final pushProvider = Provider((ref) => PushService(ref));

class PushService {
  PushService(this.ref);
  final Ref ref;
  bool _ready = false;
  String? _token;

  /// Firebase is optional: without generated options the app runs without push.
  static Future<bool> init() async {
    final options = DefaultFirebaseOptions.currentPlatformOrNull;
    if (options == null) return false;
    try {
      await Firebase.initializeApp(options: options);
      return true;
    } catch (e) {
      debugPrint('Firebase init failed: $e');
      return false;
    }
  }

  Future<void> register() async {
    if (Firebase.apps.isEmpty) return;
    final fm = FirebaseMessaging.instance;
    final perm = await fm.requestPermission(alert: true, badge: true, sound: true);
    if (perm.authorizationStatus == AuthorizationStatus.denied) return;
    if (Platform.isIOS) {
      // The APNs token arrives a moment after permission; FCM needs it first.
      for (var i = 0; i < 10 && await fm.getAPNSToken() == null; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 500));
      }
    }
    final token = await fm.getToken();
    if (token == null) return;
    _token = token;
    await ref.read(apiProvider).post('/me/push-token', {'token': token, 'platform': Platform.isIOS ? 'ios' : 'android'});

    if (_ready) return;
    _ready = true;
    fm.onTokenRefresh.listen((t) {
      _token = t;
      ref.read(apiProvider).post('/me/push-token', {'token': t, 'platform': Platform.isIOS ? 'ios' : 'android'}).ignore();
    });
    FirebaseMessaging.onMessageOpenedApp.listen(_open);
    final initial = await fm.getInitialMessage();
    if (initial != null) _open(initial);
  }

  void _open(RemoteMessage m) {
    final groupId = m.data['groupId'];
    if (groupId is String && groupId.isNotEmpty) ref.read(pushOpenProvider).add(groupId);
  }

  Future<void> unregister() async {
    final t = _token;
    if (t == null) return;
    try {
      await ref.read(apiProvider).delete('/me/push-token', {'token': t});
      await FirebaseMessaging.instance.deleteToken();
    } catch (_) {}
    _token = null;
  }
}
