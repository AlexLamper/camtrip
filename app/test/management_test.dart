import 'dart:async';

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/gallery/gallery_controller.dart';
import 'package:camtrip/features/gallery/photo_actions.dart';
import 'package:camtrip/features/groups/group_actions.dart';
import 'package:camtrip/features/groups/groups_controller.dart';
import 'package:camtrip/main.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';

// ------------------------------------------------------------------ fixtures

Map<String, dynamic> photoJson(String id, {String user = 'me', int day = 1, bool fav = false}) => {
      'id': id,
      'groupId': 'g1',
      'userId': user,
      'kind': 'photo',
      'style': 'film',
      'takenAt': DateTime.utc(2027, 7, day, 12).toIso8601String(),
      'isFavorite': fav,
      'favoriteCount': fav ? 1 : 0,
    };

Map<String, dynamic> groupJson({String id = 'g1', String role = 'member', bool archived = false, int photos = 3, int hidden = 0}) => {
      'id': id,
      'name': 'Mallorca',
      'type': 'vacation',
      'code': 'ABC123',
      'status': 'active',
      'photoCount': photos,
      'hiddenCount': hidden,
      'myRole': role,
      'ownerId': 'owner',
      'archived': archived,
      'members': [
        {'id': 'me', 'name': 'Ik', 'role': role},
        {'id': 'other', 'name': 'Daan', 'role': 'member'},
      ],
    };

Photo photo(String id, {String user = 'me', int day = 1, bool fav = false}) => Photo.fromJson(photoJson(id, user: user, day: day, fav: fav));

/// Answers API calls from a table; a handler can wait on a Completer or throw.
class FakeApi extends Api {
  FakeApi() : super(SessionStorage());

  final calls = <String>[];
  final handlers = <String, FutureOr<Map<String, dynamic>> Function(Object? body)>{};

  Future<Map<String, dynamic>> _answer(String key, Object? body) async {
    calls.add(key);
    final h = handlers[key];
    if (h == null) return <String, dynamic>{};
    return await h(body);
  }

  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) => _answer('GET $path', query);
  @override
  Future<Map<String, dynamic>> post(String path, [Object? data]) => _answer('POST $path', data);
  @override
  Future<Map<String, dynamic>> patch(String path, Object data) => _answer('PATCH $path', data);
  @override
  Future<Map<String, dynamic>> delete(String path, [Object? data]) => _answer('DELETE $path', data);
}

class FakeAuth extends AuthController {
  @override
  Future<AppUser?> build() async => AppUser(
        id: 'me',
        name: 'Ik',
        email: '',
        avatarColor: '#d9472b',
        isPro: false,
        notifyNewPhotos: true,
        notifyRecap: true,
      );
}

Future<(ProviderContainer, FakeApi)> setup({List<Map<String, dynamic>>? photos, Map<String, dynamic>? group}) async {
  SharedPreferences.setMockInitialValues({'active_group': 'g1'});
  final prefs = Prefs(await SharedPreferences.getInstance());
  final api = FakeApi();
  final g = group ?? groupJson();
  api.handlers['GET /groups'] = (_) => {
        'groups': [g, groupJson(id: 'g2')],
      };
  api.handlers['GET /groups/g1/photos'] = (_) => {
        'photos': photos ?? [photoJson('p3', day: 3), photoJson('p2', user: 'other', day: 2), photoJson('p1', day: 1)],
        'nextCursor': null,
      };
  final c = ProviderContainer(overrides: [
    prefsProvider.overrideWithValue(prefs),
    apiProvider.overrideWithValue(api),
    authProvider.overrideWith(FakeAuth.new),
  ]);
  addTearDown(c.dispose);
  await c.read(authProvider.future);
  await c.read(groupsProvider.future);
  c.read(galleryProvider('g1'));
  await pumpEventQueue();
  return (c, api);
}

List<String> ids(ProviderContainer c) => c.read(galleryProvider('g1')).photos.map((p) => p.id).toList();

// ------------------------------------------------------------------ tests

void main() {
  setUpAll(useDutch);
  group('PhotoSelection', () {
    test('long-press starts, tap toggles, exit clears', () {
      final s = PhotoSelection()..start('a');
      expect(s.active, isTrue);
      expect(s.count, 1);
      s.toggle('b');
      s.toggle('a');
      expect(s.ids, {'b'});
      s.exit();
      expect(s.active, isFalse);
      expect(s.count, 0);
    });

    test('"Alles selecteren" selects all, a second time clears', () {
      final s = PhotoSelection()..start('a');
      s.toggleAll(['a', 'b', 'c']);
      expect(s.allSelected(['a', 'b', 'c']), isTrue);
      s.toggleAll(['a', 'b', 'c']);
      expect(s.count, 0);
    });

    test('only own photos are deletable for members, all for admins', () {
      final photos = [photo('p1'), photo('p2', user: 'other')];
      final s = PhotoSelection()..toggleAll(['p1', 'p2']);
      final member = Group.fromJson(groupJson());
      final admin = Group.fromJson(groupJson(role: 'admin'));
      expect(s.deletable(photos, 'me', member).map((p) => p.id), ['p1']);
      expect(s.deletable(photos, 'me', admin).map((p) => p.id), ['p1', 'p2']);
    });

    test('favorite action adds unless all are favorites', () {
      final photos = [photo('a', fav: true), photo('b')];
      final s = PhotoSelection()..toggleAll(['a', 'b']);
      expect(s.favoriteTarget(photos), isTrue);
      s.toggle('b');
      expect(s.favoriteTarget(photos), isFalse);
    });

    test('retain drops photos that left the gallery', () {
      final s = PhotoSelection()..toggleAll(['a', 'b']);
      s.retain(['b']);
      expect(s.ids, {'b'});
    });
  });

  test('mergePhotos keeps server order and skips duplicates', () {
    final merged = mergePhotos([photo('p3', day: 3), photo('p1', day: 1)], [photo('p2', day: 2), photo('p3', day: 3)]);
    expect(merged.map((p) => p.id), ['p3', 'p2', 'p1']);
  });

  test('Group parses personal archive and hidden count', () {
    final g = Group.fromJson(groupJson(archived: true, hidden: 4));
    expect(g.archived, isTrue);
    expect(g.hiddenCount, 4);
    expect(g.isClosed, isFalse);
    expect(g.copyWith(archived: false).archived, isFalse);
  });

  group('GalleryController (optimistic)', () {
    test('delete removes at once, then applies the server group', () async {
      final (c, api) = await setup();
      final gate = Completer<Map<String, dynamic>>();
      api.handlers['POST /groups/g1/photos/batch-delete'] = (_) => gate.future;
      final done = c.read(galleryProvider('g1').notifier).deletePhotos(['p3']);
      expect(ids(c), ['p2', 'p1']); // gone before the server answers
      gate.complete({'deleted': ['p3'], 'skipped': [], 'group': groupJson(photos: 2)});
      final r = await done;
      expect(r.deleted, 1);
      expect(c.read(groupProvider('g1'))!.photoCount, 2);
    });

    test('delete rolls back when the server fails', () async {
      final (c, api) = await setup();
      api.handlers['POST /groups/g1/photos/batch-delete'] = (_) => throw ApiException('Geen verbinding');
      await expectLater(c.read(galleryProvider('g1').notifier).deletePhotos(['p3', 'p1']), throwsA(isA<ApiException>()));
      expect(ids(c), ['p3', 'p2', 'p1']);
    });

    test('photos the server refused come back, deleted ones stay gone', () async {
      final (c, api) = await setup();
      api.handlers['POST /groups/g1/photos/batch-delete'] = (_) => {
            'deleted': ['p3'],
            'skipped': [
              {'id': 'p2', 'reason': 'forbidden'},
            ],
          };
      final r = await c.read(galleryProvider('g1').notifier).deletePhotos(['p3', 'p2']);
      expect(r.forbidden, 1);
      expect(ids(c), ['p2', 'p1']);
    });

    test('hide removes for me and undo puts it back in place', () async {
      final (c, api) = await setup();
      final ctrl = c.read(galleryProvider('g1').notifier);
      final hidden = await ctrl.hide(['p2']);
      expect(ids(c), ['p3', 'p1']);
      expect(c.read(groupProvider('g1'))!.hiddenCount, 1);
      await ctrl.unhide(hidden);
      expect(ids(c), ['p3', 'p2', 'p1']);
      expect(c.read(groupProvider('g1'))!.hiddenCount, 0);
      expect(api.calls.where((x) => x == 'POST /groups/g1/photos/hide').length, 2);
    });

    test('hide rolls back on error', () async {
      final (c, api) = await setup();
      api.handlers['POST /groups/g1/photos/hide'] = (_) => throw ApiException('Nee');
      await expectLater(c.read(galleryProvider('g1').notifier).hide(['p2']), throwsA(isA<ApiException>()));
      expect(ids(c), ['p3', 'p2', 'p1']);
      expect(c.read(groupProvider('g1'))!.hiddenCount, 0);
    });

    test('batch favorite flips at once and rolls back on error', () async {
      final (c, api) = await setup();
      final ctrl = c.read(galleryProvider('g1').notifier);
      await ctrl.setFavorite(['p1', 'p2'], true);
      expect(c.read(galleryProvider('g1')).photos.where((p) => p.isFavorite).map((p) => p.id), ['p2', 'p1']);
      api.handlers['POST /groups/g1/photos/batch-favorite'] = (_) => throw ApiException('Nee');
      await expectLater(ctrl.setFavorite(['p1'], false), throwsA(isA<ApiException>()));
      expect(c.read(galleryProvider('g1')).photos.firstWhere((p) => p.id == 'p1').isFavorite, isTrue);
    });

    test('paging still works after a delete', () async {
      final (c, api) = await setup();
      api.handlers['GET /groups/g1/photos'] = (q) {
        final before = (q as Map?)?['before'];
        return before == null
            ? {
                'photos': [photoJson('p3', day: 3), photoJson('p2', day: 2)],
                'nextCursor': {'before': 'x', 'beforeId': 'p2'},
              }
            : {
                'photos': [photoJson('p1', day: 1)],
                'nextCursor': null,
              };
      };
      final ctrl = c.read(galleryProvider('g1').notifier);
      await ctrl.refresh();
      await ctrl.deletePhotos(['p3']);
      await ctrl.loadMore();
      expect(ids(c), ['p2', 'p1']);
      expect(c.read(galleryProvider('g1')).hasMore, isFalse);
    });
  });

  group('GroupsController (optimistic)', () {
    test('archive is personal, moves the camera on, and rolls back on error', () async {
      final (c, api) = await setup();
      expect(c.read(activeGroupIdProvider), 'g1');
      final gate = Completer<Map<String, dynamic>>();
      api.handlers['PATCH /groups/g1/archive'] = (_) => gate.future;
      final f = c.read(groupsProvider.notifier).setArchived('g1', true);
      expect(c.read(groupProvider('g1'))!.archived, isTrue);
      expect(c.read(activeGroupIdProvider), 'g2');
      gate.completeError(ApiException('Nee'));
      await expectLater(f, throwsA(isA<ApiException>()));
      expect(c.read(groupProvider('g1'))!.archived, isFalse);
      expect(c.read(activeGroupIdProvider), 'g1');
    });

    test('leave removes the group and restores it on error', () async {
      final (c, api) = await setup();
      api.handlers['POST /groups/g1/leave'] = (_) => throw ApiException('Nee');
      await expectLater(c.read(groupsProvider.notifier).leave('g1'), throwsA(isA<ApiException>()));
      expect(c.read(groupProvider('g1')), isNotNull);
      api.handlers.remove('POST /groups/g1/leave');
      await c.read(groupsProvider.notifier).leave('g1');
      expect(c.read(groupProvider('g1')), isNull);
    });

    test('rename shows the new name at once and rolls back on error', () async {
      final (c, api) = await setup(group: groupJson(role: 'admin'));
      api.handlers['PATCH /groups/g1'] = (_) => throw ApiException('Nee');
      final f = c.read(groupsProvider.notifier).rename('g1', 'Ibiza');
      expect(c.read(groupProvider('g1'))!.name, 'Ibiza');
      await expectLater(f, throwsA(isA<ApiException>()));
      expect(c.read(groupProvider('g1'))!.name, 'Mallorca');
    });
  });

  group('widgets', () {
    testWidgets('SelectionActionBar: delete disabled without deletable photos', (t) async {
      var saved = 0, deleted = 0;
      Future<void> pump({required bool canDelete}) => t.pumpWidget(localizedApp(
            home: Scaffold(
              body: SelectionActionBar(
                count: 2,
                onSave: () => saved++,
                onFavorite: () {},
                onHide: () {},
                onDelete: canDelete ? () => deleted++ : null,
              ),
            ),
          ));
      await pump(canDelete: false);
      await t.tap(find.byKey(const Key('sel-delete')));
      await t.tap(find.byKey(const Key('sel-save')));
      expect(deleted, 0);
      expect(saved, 1);
      await pump(canDelete: true);
      await t.tap(find.byKey(const Key('sel-delete')));
      expect(deleted, 1);
      expect(find.text('Verbergen'), findsOneWidget);
      expect(find.text('Favoriet'), findsOneWidget);
    });

    testWidgets('delete confirmation mentions the camera roll and skipped photos', (t) async {
      bool? result;
      await t.pumpWidget(localizedApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async => result = await confirmDeletePhotos(context, count: 3, notAllowed: 1),
            child: const Text('go'),
          ),
        ),
      ));
      await t.tap(find.text('go'));
      await t.pumpAndSettle();
      expect(find.text('3 foto\'s verwijderen?'), findsOneWidget);
      expect(find.text('Je eigen fotorol blijft ongewijzigd.'), findsOneWidget);
      expect(find.textContaining('1 foto is van iemand anders'), findsOneWidget);
      await t.tap(find.byKey(const Key('confirm-delete')));
      await t.pumpAndSettle();
      expect(result, isTrue);
    });

    testWidgets('group delete needs the group name typed', (t) async {
      final g = Group.fromJson(groupJson(role: 'admin'));
      bool? result;
      await t.pumpWidget(localizedApp(
        home: Builder(
          builder: (context) => TextButton(onPressed: () async => result = await confirmDeleteGroup(context, g), child: const Text('go')),
        ),
      ));
      await t.tap(find.text('go'));
      await t.pumpAndSettle();
      FilledButton button() => t.widget<FilledButton>(find.byKey(const Key('delete-group-confirm')));
      expect(button().onPressed, isNull);
      await t.enterText(find.byKey(const Key('delete-group-name')), 'mallorca ');
      await t.pump();
      expect(button().onPressed, isNotNull);
      await t.tap(find.byKey(const Key('delete-group-confirm')));
      await t.pumpAndSettle();
      expect(result, isTrue);
    });
  });
}
