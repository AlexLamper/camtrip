@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/onboarding_slides.dart';
import 'package:camtrip/features/gallery/all_photos_screen.dart';
import 'package:camtrip/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_photos_test.dart' show Me, PagedApi, photosJson;
import 'support/l10n.dart';
import 'support/real_fonts.dart';

/// Renders "Alle foto's" with real fonts and photos to PNG.
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

  testWidgets('preview', (tester) async {
    const size = Size(390, 844);
    tester.view.physicalSize = size * 3;
    tester.view.devicePixelRatio = 3;
    tester.view.padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = Prefs(await SharedPreferences.getInstance());
    final api = PagedApi([
      {'photos': photosJson(24, videos: {2, 9}), 'nextCursor': null},
    ]);
    final photos = OnboardingPhotos.all;
    final key = GlobalKey();
    await tester.pumpWidget(RepaintBoundary(
      key: key,
      child: ProviderScope(
        overrides: [prefsProvider.overrideWithValue(prefs), apiProvider.overrideWithValue(api), authProvider.overrideWith(Me.new)],
        child: localizedApp(
          theme: CT.theme(),
          debugShowCheckedModeBanner: false,
          home: AllPhotosScreen(
            thumbBuilder: (p) => Image.asset(photos[int.parse(p.id.substring(1)) % photos.length], fit: BoxFit.cover, cacheWidth: 400),
          ),
        ),
      ),
    ));
    await tester.pump();
    final context = tester.element(find.byType(AllPhotosScreen));
    await tester.runAsync(() async {
      for (final p in photos) {
        await precacheImage(ResizeImage(AssetImage(p), width: 400), context);
      }
    });
    await tester.pumpAndSettle();
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await shoot(tester, key, 'preview');

    await tester.longPress(find.byKey(const ValueKey('p0004')));
    await tester.tap(find.byKey(const ValueKey('p0005')));
    await tester.pumpAndSettle();
    await shoot(tester, key, 'preview_select');
  }, skip: out == null);
}
