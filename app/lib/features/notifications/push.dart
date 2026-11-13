import 'dart:async';
import 'dart:io';
import 'dart:ui' show Locale;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../l10n/l10n.dart';

/// A tapped notification: its custom payload keys (type, groupId, reportId ...).
class PushOpen {
  const PushOpen(this.data);

  /// Accepts what the native side sends: the payload as a map, or (older
  /// builds) just the group id as a string.
  factory PushOpen.from(Object? args) {
    if (args is Map) {
      return PushOpen({
        for (final e in args.entries)
          if (e.key is String && e.value != null) e.key as String: '${e.value}',
      });
    }
    if (args is String && args.isNotEmpty) return PushOpen({'groupId': args});
    return const PushOpen({});
  }

  final Map<String, String> data;

  String? get type => data['type'];

  /// The screen to open, or null for nothing (e.g. a reset code).
  /// Report alerts open Beheer > Meldingen, but only for app admins.
  String? route({required bool isAdmin}) {
    if (type == 'report') return isAdmin ? '/admin?tab=reports' : null;
    if (type == 'reset_code') return null;
    final groupId = data['groupId'];
    if (groupId != null && groupId.isNotEmpty) return '/group/$groupId';
    return null;
  }
}

/// Taps on notifications, for main.dart to route.
final pushOpenProvider = Provider((ref) => StreamController<PushOpen>.broadcast());

final pushProvider = Provider((ref) => PushService(ref));

/// The app language as the server wants it for push texts ("nl", "pt_BR" ...).
String pushLocaleTag(Locale l) => l.countryCode == null || l.countryCode!.isEmpty ? l.languageCode : '${l.languageCode}_${l.countryCode}';

/// Push notifications straight through Apple (APNs) - see AppDelegate.swift.
/// The server sends to the device token stored here, in the app's language.
/// Android has no push yet.
class PushService {
  PushService(this.ref) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'token':
          final t = call.arguments as String?;
          if (t != null && t != _token) await _upload(t);
        case 'open':
          _emit(PushOpen.from(call.arguments));
      }
      return null;
    });
  }

  final Ref ref;
  static const _channel = MethodChannel('camtrip/push');
  String? _token;

  void _emit(PushOpen open) {
    if (open.data.isNotEmpty) ref.read(pushOpenProvider).add(open);
  }

  Future<void> _upload(String token) async {
    _token = token;
    await ref.read(apiProvider).post('/me/push-token', {'token': token, 'platform': 'ios', 'locale': pushLocaleTag(L10n.locale)});
  }

  /// Asks permission (once) and registers this device with the server.
  Future<void> register() async {
    if (!Platform.isIOS) return;
    final token = await _channel.invokeMethod<String>('register');
    if (token != null) await _upload(token);
    _emit(PushOpen.from(await _channel.invokeMethod<Object?>('initialOpen')));
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
