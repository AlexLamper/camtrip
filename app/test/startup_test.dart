import 'dart:async';
import 'dart:convert';

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/router.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/onboarding_screen.dart';
import 'package:camtrip/features/groups/albums_screen.dart';
import 'package:camtrip/features/groups/groups_controller.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/l10n/l10n.dart';
import 'package:camtrip/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';

/// A keychain that main() has already read.
class _Session extends SessionStorage {
  _Session(this._token);
  final String? _token;
  @override
  bool get loaded => true;
  @override
  String? get cachedToken => _token;
  @override
  Future<String?> token() async => _token;
}

/// The network never answers: the first screen must not depend on it.
class _HangingApi extends Api {
  _HangingApi(super.storage);
  final requested = <String>[];
  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) {
    requested.add(path);
    return Completer<Map<String, dynamic>>().future;
  }
}

class _NoQueue extends UploadQueue {
  @override
  List<UploadItem> build() => const [];
}

const _user = {'id': 'u1', 'name': 'Alex', 'email': 'alex@camtrip.app', 'avatarColor': '#d9472b', 'isPro': false};
const _group = {
  'id': 'g1',
  'name': 'Zomer in Zeeland',
  'type': 'vacation',
  'defaultStyle': 'instant',
  'code': 'ABC123',
  'status': 'active',
  'photoCount': 3,
  'videoCount': 0,
  'ownerId': 'u1',
  'members': [],
};

Future<(ProviderContainer, _HangingApi)> _launch(WidgetTester tester, {String? token, Map<String, Object> prefs = const {}}) async {
  SharedPreferences.setMockInitialValues(prefs);
  final p = await Prefs.load();
  final session = _Session(token);
  final api = _HangingApi(session);
  final container = ProviderContainer(overrides: [
    prefsProvider.overrideWithValue(p),
    sessionStorageProvider.overrideWithValue(session),
    apiProvider.overrideWithValue(api),
    uploadQueueProvider.overrideWith(_NoQueue.new),
  ]);
  addTearDown(container.dispose);
  await tester.pumpWidget(UncontrolledProviderScope(
    container: container,
    child: Consumer(
      builder: (_, ref, _) => MaterialApp.router(
        routerConfig: ref.watch(routerProvider),
        locale: dutch,
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: L10n.delegates,
      ),
    ),
  ));
  return (container, api);
}

void main() {
  setUpAll(useDutch);

  testWidgets('stored token: albums with cached data on the first frame, network only in the background', (tester) async {
    final (container, api) = await _launch(tester, token: 'tok', prefs: {
      'cache_me': jsonEncode(_user),
      'cache_groups': jsonEncode({'userId': 'u1', 'groups': [_group]}),
    });
    await tester.pump(const Duration(milliseconds: 1)); // let the background refresh start

    expect(container.read(authProvider).isLoading, isFalse);
    expect(container.read(authProvider).value?.id, _user['id']);
    expect(container.read(routerProvider).state.matchedLocation, '/');
    expect(find.byType(AlbumsScreen), findsOneWidget);
    expect(find.text('Zomer in Zeeland'), findsWidgets);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    // /me and /groups were asked for, but never answered.
    expect(api.requested, containsAll(['/me', '/groups']));
    expect(container.read(groupsProvider).value?.single.id, 'g1');
  });

  testWidgets('stored token without a cache still opens the albums at once', (tester) async {
    final (container, _) = await _launch(tester, token: 'tok');
    await tester.pump(const Duration(milliseconds: 1));
    expect(container.read(authProvider).hasValue, isTrue);
    expect(container.read(routerProvider).state.matchedLocation, '/');
    expect(find.byType(AlbumsScreen), findsOneWidget);
  });

  testWidgets('no token: onboarding on the first frame, no network', (tester) async {
    final (container, api) = await _launch(tester);
    await tester.pump(const Duration(milliseconds: 1));
    expect(container.read(authProvider).value, isNull);
    expect(container.read(routerProvider).state.matchedLocation, '/welcome');
    expect(find.byType(OnboardingScreen), findsOneWidget);
    expect(api.requested, isEmpty);
  });
}
