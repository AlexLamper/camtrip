import 'dart:async';

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/router.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/core/widgets.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/gallery/all_photos_controller.dart';
import 'package:camtrip/features/gallery/all_photos_screen.dart';
import 'package:camtrip/features/gallery/gallery_controller.dart' show DownloadProgress;
import 'package:camtrip/features/gallery/photo_actions.dart';
import 'package:camtrip/features/groups/albums_screen.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/l10n/l10n.dart';
import 'package:camtrip/main.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';

/// Answers GET /me/photos page by page and records the queries and posts.
class PagedApi extends Api {
  PagedApi(this.pages) : super(SessionStorage());
  final List<Map<String, dynamic>> pages;
  final queries = <Map<String, dynamic>?>[];
  final posts = <(String, Object?)>[];

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

  @override
  Future<Map<String, dynamic>> post(String path, [Object? data]) async {
    posts.add((path, data));
    return {};
  }
}

/// Records what would be shared instead of downloading and opening the sheet.
class FakeShare extends PhotoShare {
  FakeShare() : super(PagedApi(const []));
  final calls = <List<String>>[];
  Completer<void>? gate;

  @override
  Future<void> share(List<Photo> photos, {void Function(DownloadProgress)? onProgress, Rect? origin}) async {
    calls.add(photos.map((p) => p.id).toList());
    onProgress?.call(DownloadProgress(1, photos.length));
    if (gate != null) await gate!.future;
  }
}

/// No upload queue on disk in tests.
class NoQueue extends UploadQueue {
  @override
  List<UploadItem> build() => const [];
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

void phone(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844) * 3;
  tester.view.devicePixelRatio = 3;
  tester.view.padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
  addTearDown(tester.view.reset);
}

Widget colorThumb(Photo p) => ColoredBox(key: Key('thumb-${p.id}'), color: Colors.primaries[p.id.hashCode % 18]);

/// The home screen, on the "Alle foto's" tab unless [tab] says otherwise.
Future<PagedApi> pumpHome(WidgetTester tester, List<Map<String, dynamic>> pages, {HomeTab tab = HomeTab.photos, PhotoShare? share}) async {
  phone(tester);
  SharedPreferences.setMockInitialValues({});
  final prefs = Prefs(await SharedPreferences.getInstance());
  final api = PagedApi(pages);
  await tester.pumpWidget(ProviderScope(
    overrides: [
      prefsProvider.overrideWithValue(prefs),
      apiProvider.overrideWithValue(api),
      authProvider.overrideWith(Me.new),
      uploadQueueProvider.overrideWith(NoQueue.new),
      if (share != null) photoShareProvider.overrideWithValue(share),
    ],
    child: localizedApp(theme: CT.theme(), home: AlbumsScreen(initialTab: tab, photoThumbBuilder: colorThumb)),
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

  testWidgets('3 square columns, edge to edge at 390 wide, thin gaps, in the app style', (tester) async {
    await pumpHome(tester, [
      {'photos': photosJson(12, videos: {4}), 'nextCursor': null},
    ]);
    final r0 = tester.getRect(find.byKey(const ValueKey('p0000')));
    final r1 = tester.getRect(find.byKey(const ValueKey('p0001')));
    final r2 = tester.getRect(find.byKey(const ValueKey('p0002')));
    final r3 = tester.getRect(find.byKey(const ValueKey('p0003')));
    const tile = (390 - 2 * AllPhotosView.gap) / 3;
    expect(r0.left, 0);
    expect(r2.right, closeTo(390, 0.01));
    for (final r in [r0, r1, r2, r3]) {
      expect(r.width, closeTo(tile, 0.01));
      expect(r.height, closeTo(tile, 0.01)); // square
    }
    expect(r1.left - r0.right, closeTo(AllPhotosView.gap, 0.01));
    expect(r1.top, r0.top);
    expect(r2.top, r0.top);
    // 4th photo starts the second row
    expect(r3.left, 0);
    expect(r3.top - r0.bottom, closeTo(AllPhotosView.gap, 0.01));
    // The grid sits under the home's own title row and tab switch.
    expect(r0.top, greaterThan(tester.getRect(find.byType(CTSegmented<HomeTab>)).bottom));
    // video badge with duration
    expect(find.byKey(const Key('video-badge-p0004')), findsOneWidget);
    expect(find.text('0:07'), findsOneWidget);
    // Title and the selected segment; the home's camera button stays.
    expect(find.text("Alle foto's"), findsNWidgets(2));
    expect(find.byKey(const Key('home-tab-albums')), findsOneWidget);
    expect(find.widgetWithText(CTButton, 'Camera'), findsOneWidget);
    // Cream app background, no black camera-roll chrome.
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor ?? CT.theme().scaffoldBackgroundColor, CT.bg);
    for (final k in ['all-photos-settings', 'all-photos-select', 'all-photos-pill', 'all-photos-camera', 'all-photos-month', 'all-photos-entry']) {
      expect(find.byKey(Key(k)), findsNothing, reason: k);
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('scrolling near the end loads the next page with the cursor', (tester) async {
    final api = await pumpHome(tester, [
      {'photos': photosJson(60), 'nextCursor': '1'},
      {'photos': photosJson(30, from: 60), 'nextCursor': null},
    ]);
    expect(api.queries.length, 1);
    expect(api.queries.first?['cursor'], isNull);

    final grid = find.descendant(of: find.byType(AllPhotosView), matching: find.byType(CustomScrollView));
    await tester.drag(grid, const Offset(0, -900));
    await tester.pumpAndSettle();
    expect(api.queries.length, 2);
    expect(api.queries[1]?['cursor'], '1');

    final container = ProviderScope.containerOf(tester.element(find.byType(AllPhotosView)));
    expect(container.read(allPhotosProvider).photos.length, 90);
    expect(container.read(allPhotosProvider).hasMore, isFalse);

    // the end: no more requests
    await tester.drag(grid, const Offset(0, -3000));
    await tester.pumpAndSettle();
    expect(api.queries.length, 2);
    expect(find.byKey(const ValueKey('p0089')), findsOneWidget);
  });

  testWidgets('long-press selects like an album gallery: header and action bar', (tester) async {
    await pumpHome(tester, [
      {'photos': photosJson(6), 'nextCursor': null},
    ]);
    await tester.longPress(find.byKey(const ValueKey('p0001')));
    await tester.pumpAndSettle();
    expect(find.text('1 geselecteerd'), findsOneWidget);
    // The tab switch makes way for the selection header ...
    expect(find.byType(CTSegmented<HomeTab>), findsNothing);
    expect(find.byKey(const Key('sel-close')), findsOneWidget);
    expect(find.byKey(const Key('sel-all')), findsOneWidget);
    // ... and the camera button for the gallery's action bar.
    for (final k in ['sel-save', 'sel-share', 'sel-favorite', 'sel-hide', 'sel-delete']) {
      expect(find.byKey(Key(k)), findsOneWidget, reason: k);
    }
    expect(find.widgetWithText(CTButton, 'Camera'), findsNothing);

    await tester.tap(find.byKey(const ValueKey('p0002')));
    await tester.pump();
    expect(find.text('2 geselecteerd'), findsOneWidget);
    await tester.tap(find.byKey(const Key('sel-all')));
    await tester.pump();
    expect(find.text('6 geselecteerd'), findsOneWidget);

    await tester.tap(find.byKey(const Key('sel-close')));
    await tester.pumpAndSettle();
    expect(find.byType(CTSegmented<HomeTab>), findsOneWidget);
    expect(find.widgetWithText(CTButton, 'Camera'), findsOneWidget);
  });

  testWidgets('back leaves selection first, then goes to the albums tab', (tester) async {
    await pumpHome(tester, [
      {'photos': photosJson(6), 'nextCursor': null},
    ]);
    await tester.longPress(find.byKey(const ValueKey('p0001')));
    await tester.pump();
    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(find.text('1 geselecteerd'), findsNothing);
    expect(find.byType(CTSegmented<HomeTab>), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(find.text('Je albums'), findsOneWidget);
    expect(find.byKey(const ValueKey('album-g1')), findsOneWidget);
  });

  testWidgets('hide removes the photos from the grid and goes to their album', (tester) async {
    final api = await pumpHome(tester, [
      {'photos': photosJson(6), 'nextCursor': null},
    ]);
    await tester.longPress(find.byKey(const ValueKey('p0001')));
    await tester.tap(find.byKey(const ValueKey('p0002')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('sel-hide')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(find.byKey(const ValueKey('p0001')), findsNothing);
    expect(find.byKey(const ValueKey('p0002')), findsNothing);
    final hide = api.posts.singleWhere((p) => p.$1 == '/groups/g1/photos/hide');
    expect((hide.$2! as Map)['photoIds'], ['p0001', 'p0002']);
    expect(find.text("2 foto's verborgen voor jou"), findsOneWidget);
  });

  testWidgets('empty state in the app style', (tester) async {
    await pumpHome(tester, [
      {'photos': [], 'nextCursor': null},
    ]);
    await tester.pumpAndSettle();
    expect(find.text("Nog geen foto's"), findsOneWidget);
    expect(find.byType(EmptyState), findsOneWidget);
  });

  testWidgets('the tab switch swaps albums and photos on the same screen', (tester) async {
    final api = await pumpHome(tester, [
      {'photos': photosJson(6), 'nextCursor': null},
    ], tab: HomeTab.albums);
    await tester.pumpAndSettle();
    expect(find.text('Je albums'), findsOneWidget);
    expect(find.byKey(const ValueKey('album-g1')), findsOneWidget);
    expect(find.byType(AllPhotosView), findsNothing); // built on first visit
    expect(api.queries, isEmpty);

    await tester.tap(find.byKey(const Key('home-tab-photos')));
    await tester.pumpAndSettle();
    expect(find.text("Alle foto's"), findsNWidgets(2));
    expect(find.byKey(const ValueKey('p0000')), findsOneWidget);
    expect(find.byType(AlbumsScreen), findsOneWidget); // no new route

    await tester.tap(find.byKey(const Key('home-tab-albums')));
    await tester.pumpAndSettle();
    expect(find.text('Je albums'), findsOneWidget);
    expect(find.byKey(const ValueKey('album-g1')), findsOneWidget);
  });

  testWidgets('/photos opens the home on the "Alle foto\'s" tab', (tester) async {
    phone(tester);
    SharedPreferences.setMockInitialValues({});
    final prefs = Prefs(await SharedPreferences.getInstance());
    final api = PagedApi([
      {'photos': photosJson(3), 'nextCursor': null},
    ]);
    final container = ProviderContainer(overrides: [
      prefsProvider.overrideWithValue(prefs),
      apiProvider.overrideWithValue(api),
      authProvider.overrideWith(Me.new),
      uploadQueueProvider.overrideWith(NoQueue.new),
    ]);
    addTearDown(container.dispose);
    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: Consumer(
        builder: (_, ref, _) => MaterialApp.router(
          theme: CT.theme(),
          routerConfig: ref.watch(routerProvider),
          locale: dutch,
          supportedLocales: L10n.supportedLocales,
          localizationsDelegates: L10n.delegates,
        ),
      ),
    ));
    await tester.pumpAndSettle();
    final router = container.read(routerProvider);
    expect(router.state.matchedLocation, '/');
    expect(find.text('Je albums'), findsOneWidget);

    router.go('/photos');
    await tester.pumpAndSettle();
    expect(router.state.matchedLocation, '/');
    expect(find.byType(AlbumsScreen), findsOneWidget);
    expect(find.byKey(const ValueKey('p0000')), findsOneWidget);
    expect(find.text("Alle foto's"), findsNWidgets(2));

    router.go('/');
    await tester.pumpAndSettle();
    expect(find.text('Je albums'), findsOneWidget);
  });

  testWidgets('"Selecteer" in the header toggles selection mode on the photos tab', (tester) async {
    await pumpHome(tester, [
      {'photos': photosJson(6), 'nextCursor': null},
    ]);
    await tester.pumpAndSettle();
    final chip = find.byKey(const Key('home-select'));
    expect(chip, findsOneWidget);
    // The label, or (icon-only chip when the title needs the room) its tooltip.
    bool says(String label) =>
        find.descendant(of: chip, matching: find.text(label)).evaluate().isNotEmpty ||
        find.ancestor(of: chip, matching: find.byWidgetPredicate((w) => w is Tooltip && w.message == label)).evaluate().isNotEmpty;
    expect(says('Selecteer'), isTrue);
    // Right of the title, left of the avatar, on the title row.
    final title = tester.getRect(find.text("Alle foto's").first);
    expect(tester.getRect(chip).left, greaterThan(title.left));
    expect(tester.getRect(chip).center.dy, closeTo(title.center.dy, 8));

    await tester.tap(chip);
    await tester.pumpAndSettle();
    expect(find.text('Kies foto\'s'), findsOneWidget);
    expect(find.byKey(const Key('sel-save')), findsOneWidget);
    expect(says('Klaar'), isTrue);
    expect(find.byKey(const Key('sel-mark-p0000')), findsOneWidget);
    // In selection mode a tap picks instead of opening.
    await tester.tap(find.byKey(const ValueKey('p0001')));
    await tester.pump();
    expect(find.text('1 geselecteerd'), findsOneWidget);

    await tester.tap(chip);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('sel-save')), findsNothing);
    expect(find.byKey(const Key('sel-mark-p0000')), findsNothing);
    expect(find.byType(CTSegmented<HomeTab>), findsOneWidget);

    // Long-press still works, and the chip follows it.
    await tester.longPress(find.byKey(const ValueKey('p0002')));
    await tester.pumpAndSettle();
    expect(find.text('1 geselecteerd'), findsOneWidget);
    expect(says('Klaar'), isTrue);

    // Not on the albums tab.
    await tester.tap(chip);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('home-tab-albums')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('home-select')), findsNothing);
  });

  testWidgets('"Delen" shares the picked photos through the share helper', (tester) async {
    final share = FakeShare()..gate = Completer<void>();
    await pumpHome(tester, [
      {'photos': photosJson(6), 'nextCursor': null},
    ], share: share);
    await tester.pumpAndSettle();
    await tester.longPress(find.byKey(const ValueKey('p0001')));
    await tester.tap(find.byKey(const ValueKey('p0003')));
    await tester.tap(find.byKey(const ValueKey('p0004')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('sel-share')));
    await tester.pump();
    expect(share.calls, [
      ['p0001', 'p0003', 'p0004'],
    ]);
    // Progress while the files are prepared.
    expect(find.text('Voorbereiden... 1/3'), findsOneWidget);
    share.gate!.complete();
    await tester.pumpAndSettle();
    // Done: selection mode ends.
    expect(find.byKey(const Key('sel-save')), findsNothing);
    expect(find.byType(CTSegmented<HomeTab>), findsOneWidget);
  });

  testWidgets('"Delen" failing shows a message and keeps the selection', (tester) async {
    await pumpHome(tester, [
      {'photos': photosJson(3), 'nextCursor': null},
    ], share: _FailingShare());
    await tester.pumpAndSettle();
    await tester.longPress(find.byKey(const ValueKey('p0001')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('sel-share')));
    await tester.pump();
    await tester.pump();
    expect(find.text('Delen lukte niet'), findsOneWidget);
    expect(find.text('1 geselecteerd'), findsOneWidget);
    expect(find.byKey(const Key('sel-share')), findsOneWidget);
  });
}

class _FailingShare extends FakeShare {
  @override
  Future<void> share(List<Photo> photos, {void Function(DownloadProgress)? onProgress, Rect? origin}) async {
    throw ApiException('kapot');
  }
}
