import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/camera/camera_layout.dart';
import 'package:camtrip/features/camera/camera_screen.dart' show albumName;
import 'package:camtrip/features/gallery/all_photos_controller.dart';
import 'package:camtrip/features/gallery/gallery_controller.dart';
import 'package:camtrip/features/gallery/photo_actions.dart';
import 'package:camtrip/features/groups/albums_screen.dart';
import 'package:camtrip/features/groups/groups_controller.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/main.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';

// "Mijn rolletje": the personal roll for loose photos.

Map<String, dynamic> rollJson({int photos = 0, String? cover}) => {
      'id': 'aaaaaaaaaaaaaaaaaaaaaaaa',
      'isPersonal': true,
      'name': 'Mijn rolletje',
      'type': 'personal',
      'code': '',
      'status': 'active',
      'photoCount': photos,
      'coverUrl': cover,
      'myRole': 'admin',
      'ownerId': 'me',
      'members': [
        {'id': 'me', 'name': 'Ik', 'role': 'admin'},
      ],
    };

Map<String, dynamic> groupJson(String id, {String name = 'Mallorca', String status = 'active'}) => {
      'id': id,
      'name': name,
      'type': 'vacation',
      'code': 'ABC123',
      'status': status,
      'photoCount': 2,
      'myRole': 'member',
      'ownerId': 'owner',
      'members': [
        {'id': 'me', 'name': 'Ik', 'role': 'member'},
        {'id': 'other', 'name': 'Daan', 'role': 'member'},
      ],
    };

class FakeApi extends Api {
  FakeApi({this.groups = const [], Map<String, dynamic>? roll}) : roll = roll ?? rollJson(), super(SessionStorage());
  final List<Map<String, dynamic>> groups;
  final Map<String, dynamic> roll;
  final calls = <(String, Object?)>[];
  Map<String, dynamic> Function(Object? body)? onMove;

  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) async {
    calls.add(('GET $path', query));
    return switch (path) {
      '/groups' => {'groups': groups},
      '/me/roll' => {'group': roll},
      '/me/photos' => {'photos': [], 'nextCursor': null},
      _ when path.endsWith('/photos') => {
          'photos': [
            for (final id in ['p1', 'p2'])
              {'id': id, 'groupId': roll['id'], 'userId': 'me', 'kind': 'photo', 'style': 'flash', 'takenAt': DateTime.utc(2027, 7, 1).toIso8601String()},
          ],
          'nextCursor': null,
        },
      _ => {},
    };
  }

  @override
  Future<Map<String, dynamic>> post(String path, [Object? data]) async {
    calls.add(('POST $path', data));
    if (path == '/photos/move' && onMove != null) return onMove!(data);
    return {};
  }
}

class Me extends AuthController {
  @override
  Future<AppUser?> build() async =>
      AppUser(id: 'me', name: 'Ik', email: '', avatarColor: '#d9472b', isPro: false, notifyNewPhotos: true, notifyRecap: true);
}

class NoQueue extends UploadQueue {
  @override
  List<UploadItem> build() => const [];
}

Future<(ProviderContainer, FakeApi)> container({List<Map<String, dynamic>> groups = const [], String? active}) async {
  SharedPreferences.setMockInitialValues({'active_group': ?active});
  final prefs = Prefs(await SharedPreferences.getInstance());
  final api = FakeApi(groups: groups);
  final c = ProviderContainer(overrides: [
    prefsProvider.overrideWithValue(prefs),
    apiProvider.overrideWithValue(api),
    authProvider.overrideWith(Me.new),
    uploadQueueProvider.overrideWith(NoQueue.new),
  ]);
  addTearDown(c.dispose);
  await c.read(authProvider.future);
  await c.read(groupsProvider.future);
  c.read(personalRollProvider);
  await Future<void>.delayed(Duration.zero); // the roll fetches /me/roll in the background
  await Future<void>.delayed(Duration.zero);
  return (c, api);
}

Future<void> settle() async {
  for (var i = 0; i < 5; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  setUpAll(useDutch);

  group('model', () {
    test('the personal roll goes by "me" in the app and keeps its server id', () {
      final g = Group.fromJson(rollJson());
      expect(g.isPersonal, isTrue);
      expect(g.id, Group.personalRollId);
      expect(g.serverId, 'aaaaaaaaaaaaaaaaaaaaaaaa');
      expect(g.isId('me'), isTrue);
      expect(g.isId('aaaaaaaaaaaaaaaaaaaaaaaa'), isTrue);
      expect(g.name, 'Mijn rolletje'); // in the app's language
      // One stable phone album, whatever the language.
      expect(g.deviceAlbum, 'CamTrip');
      expect(albumName(g), 'CamTrip');
      final trip = Group.fromJson(groupJson('g1'));
      expect(trip.isPersonal, isFalse);
      expect(trip.id, 'g1');
      expect(albumName(trip), 'CamTrip - Mallorca');
    });
  });

  group('camera group', () {
    test('without any groups the camera shoots into the personal roll', () async {
      final (c, api) = await container();
      final active = c.read(activeGroupProvider);
      expect(active, isNotNull);
      expect(active!.isPersonal, isTrue);
      expect(active.id, Group.personalRollId);
      // The roll was fetched (and so created on the server) lazily.
      expect(api.calls.map((x) => x.$1), contains('GET /me/roll'));
      expect(c.read(personalRollProvider).serverId, 'aaaaaaaaaaaaaaaaaaaaaaaa');
    });

    test('with groups the first one stays the default; picking the roll sticks across reloads', () async {
      final (c, _) = await container(groups: [groupJson('g1'), groupJson('g2', name: 'Ibiza')]);
      expect(c.read(activeGroupProvider)!.id, 'g1');

      c.read(activeGroupIdProvider.notifier).set(Group.personalRollId);
      expect(c.read(activeGroupProvider)!.isPersonal, isTrue);
      await c.read(groupsProvider.notifier).reload();
      expect(c.read(activeGroupIdProvider), Group.personalRollId);
      expect(c.read(activeGroupProvider)!.isPersonal, isTrue);
    });

    test('a closed or vanished group falls back to the personal roll', () async {
      final (c, _) = await container(groups: [groupJson('g1', status: 'archived')], active: 'g1');
      expect(c.read(activeGroupProvider)!.isPersonal, isTrue);
      c.read(activeGroupIdProvider.notifier).set('gone');
      expect(c.read(activeGroupProvider)!.isPersonal, isTrue);
    });

    test('groupProvider finds the roll by "me" and by its server id; it is not in the albums list', () async {
      final (c, _) = await container(groups: [groupJson('g1')]);
      expect(c.read(groupProvider('me'))!.isPersonal, isTrue);
      expect(c.read(groupProvider('aaaaaaaaaaaaaaaaaaaaaaaa'))!.isPersonal, isTrue);
      expect(c.read(groupsProvider).value!.map((g) => g.id), ['g1']);
    });

    testWidgets('the camera pill shows the roll with a lock instead of the dot', (tester) async {
      await tester.pumpWidget(localizedApp(
        theme: CT.theme(),
        home: Scaffold(body: Center(child: CameraGroupPill(label: 'Mijn rolletje', personal: true, onTap: () {}))),
      ));
      expect(find.text('Mijn rolletje'), findsOneWidget);
      expect(find.byKey(const ValueKey('camera-group-pill-personal')), findsOneWidget);

      await tester.pumpWidget(localizedApp(
        theme: CT.theme(),
        home: Scaffold(body: Center(child: CameraGroupPill(label: 'Mallorca · 2', onTap: () {}))),
      ));
      expect(find.byKey(const ValueKey('camera-group-pill-personal')), findsNothing);
    });
  });

  group('move to album', () {
    test('moves own photos out of the roll into the picked album', () async {
      final (c, api) = await container(groups: [groupJson('g1')]);
      api.onMove = (body) => {'moved': 2, 'group': {...groupJson('g1'), 'photoCount': 4}};
      final gallery = c.read(galleryProvider(Group.personalRollId).notifier);
      await settle(); // the gallery loads itself
      expect(c.read(galleryProvider(Group.personalRollId)).photos.length, 2);

      final n = await gallery.moveTo(['p1', 'p2'], c.read(groupProvider('g1'))!);
      expect(n, 2);
      final move = api.calls.firstWhere((x) => x.$1 == 'POST /photos/move');
      expect(move.$2, {'photoIds': ['p1', 'p2'], 'groupId': 'g1'});
      expect(c.read(galleryProvider(Group.personalRollId)).photos, isEmpty);
      expect(c.read(groupProvider('g1'))!.photoCount, 4);
    });

    test('a refused move puts the photos back', () async {
      final (c, api) = await container(groups: [groupJson('g1')]);
      api.onMove = (_) => throw ApiException('Deze camerastijl hoort bij CamTrip Pro', code: 'pro_required', status: 402);
      final gallery = c.read(galleryProvider(Group.personalRollId).notifier);
      await settle(); // the gallery loads itself
      await expectLater(gallery.moveTo(['p1'], c.read(groupProvider('g1'))!), throwsA(isA<ApiException>()));
      expect(c.read(galleryProvider(Group.personalRollId)).photos.length, 2);
    });

    testWidgets('the selection bar offers "Naar album" only when asked (personal roll)', (tester) async {
      Widget bar({VoidCallback? onMove}) => localizedApp(
            theme: CT.theme(),
            home: Scaffold(
              body: Align(
                alignment: Alignment.bottomCenter,
                child: SelectionActionBar(count: 1, onSave: () {}, onShare: () {}, onFavorite: () {}, onHide: () {}, onDelete: () {}, onMove: onMove),
              ),
            ),
          );
      await tester.pumpWidget(bar());
      expect(find.byKey(const Key('sel-hide')), findsOneWidget);
      expect(find.byKey(const Key('sel-move')), findsNothing);

      var moved = 0;
      await tester.pumpWidget(bar(onMove: () => moved++));
      expect(find.byKey(const Key('sel-move')), findsOneWidget);
      expect(find.byKey(const Key('sel-hide')), findsNothing);
      expect(find.text('Naar album'), findsOneWidget);
      await tester.tap(find.byKey(const Key('sel-move')));
      expect(moved, 1);
    });
  });

  group('home', () {
    Future<FakeApi> pumpHome(WidgetTester tester, {List<Map<String, dynamic>> groups = const []}) async {
      tester.view.physicalSize = const Size(390, 844) * 3;
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      SharedPreferences.setMockInitialValues({});
      final prefs = Prefs(await SharedPreferences.getInstance());
      final api = FakeApi(groups: groups);
      await tester.pumpWidget(ProviderScope(
        overrides: [
          prefsProvider.overrideWithValue(prefs),
          apiProvider.overrideWithValue(api),
          authProvider.overrideWith(Me.new),
          uploadQueueProvider.overrideWith(NoQueue.new),
        ],
        child: localizedApp(theme: CT.theme(), home: const AlbumsScreen(initialTab: HomeTab.albums)),
      ));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      return api;
    }

    testWidgets('"Mijn rolletje" is the first album tile, with its own look', (tester) async {
      await pumpHome(tester, groups: [groupJson('g1')]);
      final roll = find.byKey(const ValueKey('album-personal-roll'));
      expect(roll, findsOneWidget);
      expect(find.descendant(of: roll, matching: find.text('Mijn rolletje')), findsOneWidget);
      expect(find.descendant(of: roll, matching: find.textContaining('Alleen voor jou')), findsOneWidget);
      expect(find.descendant(of: roll, matching: find.byKey(const ValueKey('personal-roll-canister'))), findsOneWidget);
      // First: left of and level with the first album.
      final album = find.byKey(const ValueKey('album-g1'));
      expect(album, findsOneWidget);
      expect(tester.getTopLeft(roll).dx, lessThan(tester.getTopLeft(album).dx));
      expect((tester.getTopLeft(roll).dy - tester.getTopLeft(album).dy).abs(), lessThan(20));
    });

    testWidgets('without albums the roll is still there, and so is the camera button', (tester) async {
      await pumpHome(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('album-personal-roll')), findsOneWidget);
      expect(find.text('Camera'), findsOneWidget);
    });
  });

  test('"Alle foto\'s" shows roll photos under "me" with the roll\'s name', () async {
    final (c, _) = await container();
    // A page with one roll photo.
    final res = {
      'photos': [
        {
          'id': 'p1',
          'groupId': 'aaaaaaaaaaaaaaaaaaaaaaaa',
          'groupName': 'Mijn rolletje',
          'groupPersonal': true,
          'userId': 'me',
          'takenAt': DateTime.utc(2027, 7, 1).toIso8601String(),
        },
      ],
      'nextCursor': null,
    };
    final c2 = ProviderContainer(overrides: [
      prefsProvider.overrideWithValue(c.read(prefsProvider)),
      apiProvider.overrideWithValue(_OnePage(res)),
      authProvider.overrideWith(Me.new),
      uploadQueueProvider.overrideWith(NoQueue.new),
    ]);
    addTearDown(c2.dispose);
    await c2.read(authProvider.future);
    c2.read(allPhotosProvider);
    await settle(); // loads itself
    final s = c2.read(allPhotosProvider);
    expect(s.photos.single.groupId, Group.personalRollId);
    expect(s.groupNames[Group.personalRollId], 'Mijn rolletje');
  });
}

class _OnePage extends FakeApi {
  _OnePage(this.page);
  final Map<String, dynamic> page;
  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) async =>
      path == '/me/photos' ? page : super.get(path, query: query);
}
