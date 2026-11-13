import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/gallery/all_photos_controller.dart';
import 'package:camtrip/features/gallery/all_photos_screen.dart';
import 'package:camtrip/main.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';

/// Answers GET /me/photos page by page and records the queries.
class PagedApi extends Api {
  PagedApi(this.pages) : super(SessionStorage());
  final List<Map<String, dynamic>> pages;
  final queries = <Map<String, dynamic>?>[];

  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) async {
    if (path == '/groups') {
      return {
        'groups': [
          {'id': 'g1', 'name': 'Mallorca', 'type': 'vacation', 'code': 'ABC', 'status': 'active', 'ownerId': 'me', 'members': []},
        ],
      };
    }
    if (path != '/me/photos') return {};
    queries.add(query);
    final cursor = query?['cursor'] as String?;
    final i = cursor == null ? 0 : int.parse(cursor);
    return i < pages.length ? pages[i] : {'photos': [], 'nextCursor': null};
  }
}

class Me extends AuthController {
  @override
  Future<AppUser?> build() async =>
      AppUser(id: 'me', name: 'Ik', email: '', avatarColor: '#d9472b', isPro: false, notifyNewPhotos: true, notifyRecap: true);
}

/// [n] photos, newest first, starting at [from] (index into a long timeline).
List<Map<String, dynamic>> photosJson(int n, {int from = 0, Set<int> videos = const {}}) => [
      for (var i = from; i < from + n; i++)
        {
          'id': 'p${i.toString().padLeft(4, '0')}',
          'groupId': 'g1',
          'groupName': 'Mallorca',
          'userId': 'me',
          'kind': videos.contains(i) ? 'video' : 'photo',
          'durationMs': videos.contains(i) ? 7400 : 0,
          'takenAt': DateTime.utc(2027, 8, 1).subtract(Duration(hours: i * 7)).toIso8601String(),
          'thumbUrl': 'https://example.invalid/$i.jpg',
        },
    ];

Future<PagedApi> pumpScreen(WidgetTester tester, List<Map<String, dynamic>> pages) async {
  tester.view.physicalSize = const Size(390, 844) * 3;
  tester.view.devicePixelRatio = 3;
  tester.view.padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
  addTearDown(tester.view.reset);
  SharedPreferences.setMockInitialValues({});
  final prefs = Prefs(await SharedPreferences.getInstance());
  final api = PagedApi(pages);
  await tester.pumpWidget(ProviderScope(
    overrides: [
      prefsProvider.overrideWithValue(prefs),
      apiProvider.overrideWithValue(api),
      authProvider.overrideWith(Me.new),
    ],
    child: localizedApp(
      theme: CT.theme(),
      home: AllPhotosScreen(thumbBuilder: (p) => ColoredBox(key: Key('thumb-${p.id}'), color: Colors.primaries[p.id.hashCode % 18])),
    ),
  ));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 50));
  return api;
}

void main() {
  setUpAll(useDutch);

  test('formatDuration', () {
    expect(formatDuration(0), '0:00');
    expect(formatDuration(7400), '0:07');
    expect(formatDuration(83000), '1:23');
    expect(formatDuration(3723000), '1:02:03');
  });

  testWidgets('3 square columns, edge to edge at 390 wide, thin gaps', (tester) async {
    await pumpScreen(tester, [
      {'photos': photosJson(12, videos: {4}), 'nextCursor': null},
    ]);
    final r0 = tester.getRect(find.byKey(const ValueKey('p0000')));
    final r1 = tester.getRect(find.byKey(const ValueKey('p0001')));
    final r2 = tester.getRect(find.byKey(const ValueKey('p0002')));
    final r3 = tester.getRect(find.byKey(const ValueKey('p0003')));
    const tile = (390 - 2 * AllPhotosScreen.gap) / 3;
    expect(r0.left, 0);
    expect(r2.right, closeTo(390, 0.01));
    for (final r in [r0, r1, r2, r3]) {
      expect(r.width, closeTo(tile, 0.01));
      expect(r.height, closeTo(tile, 0.01)); // square
    }
    expect(r1.left - r0.right, closeTo(AllPhotosScreen.gap, 0.01));
    expect(r1.top, r0.top);
    expect(r2.top, r0.top);
    // 4th photo starts the second row
    expect(r3.left, 0);
    expect(r3.top - r0.bottom, closeTo(AllPhotosScreen.gap, 0.01));
    // video badge with duration, the pill and the camera button
    expect(find.byKey(const Key('video-badge-p0004')), findsOneWidget);
    expect(find.text('0:07'), findsOneWidget);
    expect(find.text("Alle foto's"), findsOneWidget);
    expect(find.byKey(const Key('all-photos-camera')), findsOneWidget);
    expect(find.byKey(const Key('all-photos-month')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('scrolling near the end loads the next page with the cursor', (tester) async {
    final api = await pumpScreen(tester, [
      {'photos': photosJson(60), 'nextCursor': '1'},
      {'photos': photosJson(30, from: 60), 'nextCursor': null},
    ]);
    expect(api.queries.length, 1);
    expect(api.queries.first?['cursor'], isNull);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -600));
    await tester.pumpAndSettle();
    expect(api.queries.length, 2);
    expect(api.queries[1]?['cursor'], '1');

    final container = ProviderScope.containerOf(tester.element(find.byType(AllPhotosScreen)));
    expect(container.read(allPhotosProvider).photos.length, 90);
    expect(container.read(allPhotosProvider).hasMore, isFalse);

    // the end: no more requests
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -3000));
    await tester.pumpAndSettle();
    expect(api.queries.length, 2);
    expect(find.byKey(const ValueKey('p0089')), findsOneWidget);
  });

  testWidgets('long-press starts selection with Opslaan / Delen', (tester) async {
    await pumpScreen(tester, [
      {'photos': photosJson(6), 'nextCursor': null},
    ]);
    await tester.longPress(find.byKey(const ValueKey('p0001')));
    await tester.pump();
    expect(find.text('1 geselecteerd'), findsOneWidget);
    expect(find.byKey(const Key('sel-save')), findsOneWidget);
    expect(find.byKey(const Key('sel-share')), findsOneWidget);
    expect(find.byKey(const Key('all-photos-camera')), findsNothing);
    await tester.tap(find.byKey(const ValueKey('p0002')));
    await tester.pump();
    expect(find.text('2 geselecteerd'), findsOneWidget);
    // the left button now cancels
    await tester.tap(find.byKey(const Key('all-photos-settings')));
    await tester.pump();
    expect(find.text("Alle foto's"), findsOneWidget);
  });

  testWidgets('empty state', (tester) async {
    await pumpScreen(tester, [
      {'photos': [], 'nextCursor': null},
    ]);
    await tester.pumpAndSettle();
    expect(find.text("Nog geen foto's"), findsOneWidget);
    expect(find.text('Open de camera'), findsOneWidget);
  });
}
