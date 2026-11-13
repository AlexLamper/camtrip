@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/onboarding_slides.dart';
import 'package:camtrip/features/groups/albums_screen.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_photos_test.dart' show Me, NoQueue, PagedApi, photosJson;
import 'support/l10n.dart';
import 'support/real_fonts.dart';

/// Renders the home ("Alle foto's" and "Albums" tabs) with real fonts and photos to PNG.
/// Run with: CAMTRIP_PREVIEW=/tmp/allphotos flutter test test/all_photos_preview_test.dart
void main() {
  final out = Platform.environment['CAMTRIP_PREVIEW'];
  setUpAll(() async {
    useDutch();
    await loadRealFonts();
  });

  Future<void> shoot(WidgetTester tester, GlobalKey key, String name) async {
    final boundary = tester.renderObject<RenderRepaintBoundary>(find.byKey(key));
    await tester.runAsync(() async {
      final image = await boundary.toImage(pixelRatio: 2);
      final png = await image.toByteData(format: ui.ImageByteFormat.png);
      Directory(out!).createSync(recursive: true);
      File('$out/$name.png').writeAsBytesSync(png!.buffer.asUint8List());
    });
  }

  Future<void> pumpHome(WidgetTester tester, GlobalKey key, HomeTab tab) async {
    const size = Size(390, 844);
    tester.view.physicalSize = size * 3;
    tester.view.devicePixelRatio = 3;
    tester.view.padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = Prefs(await SharedPreferences.getInstance());
    final api = PreviewApi([
      {'photos': photosJson(24, videos: {2, 9}), 'nextCursor': null},
    ]);
    final photos = OnboardingPhotos.all;
    await tester.pumpWidget(RepaintBoundary(
      key: key,
      child: ProviderScope(
        overrides: [prefsProvider.overrideWithValue(prefs), apiProvider.overrideWithValue(api), authProvider.overrideWith(Me.new), uploadQueueProvider.overrideWith(NoQueue.new)],
        child: localizedApp(
          theme: CT.theme(),
          debugShowCheckedModeBanner: false,
          home: AlbumsScreen(
            initialTab: tab,
            photoThumbBuilder: (p) => Image.asset(photos[int.parse(p.id.substring(1)) % photos.length], fit: BoxFit.cover, cacheWidth: 400),
          ),
        ),
      ),
    ));
    await tester.pump();
    final context = tester.element(find.byType(AlbumsScreen));
    await tester.runAsync(() async {
      for (final p in photos) {
        await precacheImage(ResizeImage(AssetImage(p), width: 400), context);
      }
    });
    await tester.pumpAndSettle();
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  }

  testWidgets('photos tab', (tester) async {
    final key = GlobalKey();
    await pumpHome(tester, key, HomeTab.photos);
    await shoot(tester, key, 'preview_v2');

    await tester.longPress(find.byKey(const ValueKey('p0004')));
    await tester.tap(find.byKey(const ValueKey('p0005')));
    await tester.pumpAndSettle();
    await shoot(tester, key, 'preview_v2_select');
  }, skip: out == null);

  testWidgets('photos tab, "Selecteer" and the 5-action bar', (tester) async {
    final key = GlobalKey();
    await pumpHome(tester, key, HomeTab.photos);
    await shoot(tester, key, 'preview_v3');

    await tester.tap(find.byKey(const Key('home-select')));
    await tester.pumpAndSettle();
    for (final id in ['p0001', 'p0004', 'p0005']) {
      await tester.tap(find.byKey(ValueKey(id)));
    }
    await tester.pumpAndSettle();
    await shoot(tester, key, 'preview_v3_select');
  }, skip: out == null);

  testWidgets('albums tab', (tester) async {
    final key = GlobalKey();
    await pumpHome(tester, key, HomeTab.albums);
    await shoot(tester, key, 'albums_v2');
  }, skip: out == null);
}

/// Two albums with covers, so the albums tab looks like a real home.
class PreviewApi extends PagedApi {
  PreviewApi(super.pages);

  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) async {
    if (path == '/groups') {
      return {
        'groups': [
          {'id': 'g1', 'name': 'Mallorca', 'type': 'vacation', 'code': 'ABC', 'status': 'active', 'ownerId': 'me', 'members': [], 'photoCount': 24},
          {'id': 'g2', 'name': 'Bruiloft Sanne', 'type': 'event', 'code': 'DEF', 'status': 'active', 'ownerId': 'me', 'members': [], 'photoCount': 12},
        ],
      };
    }
    return super.get(path, query: query);
  }
}
