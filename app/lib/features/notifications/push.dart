import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';

/// Where a tapped notification should take the user (group id).
final pushOpenProvider = Provider((ref) => StreamController<String>.broadcast());

final pushProvider = Provider((ref) => PushService(ref));

/// Push notifications straight through Apple (APNs) - see AppDelegate.swift.
/// The server sends to the device token stored here. Android has no push yet.
class PushService {
  PushService(this.ref) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'token':
          final t = call.arguments as String?;
          if (t != null && t != _token) await _upload(t);
        case 'open':
          final groupId = call.arguments as String?;
          if (groupId != null && groupId.isNotEmpty) ref.read(pushOpenProvider).add(groupId);
      }
      return null;
    });
  }

  final Ref ref;
  static const _channel = MethodChannel('camtrip/push');
  String? _token;

  Future<void> _upload(String token) async {
    _token = token;
    await ref.read(apiProvider).post('/me/push-token', {'token': token, 'platform': 'ios'});
  }

  /// Asks permission (once) and registers this device with the server.
  Future<void> register() async {
    if (!Platform.isIOS) return;
    final token = await _channel.invokeMethod<String>('register');
    if (token != null) await _upload(token);
    final open = await _channel.invokeMethod<String>('initialOpen');
    if (open != null) ref.read(pushOpenProvider).add(open);
  }

  Future<void> unregister() async {
    final t = _token;
    if (t == null) return;
    try {
      await ref.read(apiProvider).delete('/me/push-token', {'token': t});
      await _channel.invokeMethod<void>('unregister');
    } catch (_) {}
    _token = null;
  }
}
