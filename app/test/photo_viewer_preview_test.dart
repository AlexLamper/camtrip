@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/onboarding_slides.dart';
import 'package:camtrip/features/gallery/photo_screen.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_photos_test.dart' show Me, NoQueue;
import 'photo_viewer_test.dart' show ViewerApi;
import 'support/l10n.dart';
import 'support/real_fonts.dart';

/// Renders the full-screen photo viewer with real fonts and photos to PNG.
/// Run with: CAMTRIP_PREVIEW=/tmp/photo_viewer flutter test test/photo_viewer_preview_test.dart
void main() {
  final out = Platform.environment['CAMTRIP_PREVIEW'];
  setUpAll(() async {
    useDutch();
    await loadRealFonts();
    PhotoScreen.setSystemBars = (_) {};
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

  testWidgets('viewer', (tester) async {
    final key = GlobalKey();
    const size = Size(390, 844);
    tester.view.physicalSize = size * 3;
    tester.view.devicePixelRatio = 3;
    tester.view.padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = Prefs(await SharedPreferences.getInstance());
    final photos = [OnboardingPhotos.friends, OnboardingPhotos.beach, OnboardingPhotos.sunset];
    final api = ViewerApi(photos: [
      for (final (i, owner) in ['anna', 'me', 'anna'].indexed)
        {
          'id': 'p${i + 1}',
          'groupId': 'g1',
          'userId': owner,
          'kind': 'photo',
          'takenAt': DateTime.utc(2027, 8, 1, 18, 42).subtract(Duration(hours: i)).toIso8601String(),
          'reactions': i == 0
              ? [
                  {'emoji': '❤️', 'count': 3},
                  {'emoji': '🔥', 'count': 1},
                ]
              : [],
          'myReactions': i == 0 ? ['❤️'] : [],
          'isFavorite': i == 0,
        },
    ]);
    await tester.pumpWidget(RepaintBoundary(
      key: key,
      child: ProviderScope(
        overrides: [prefsProvider.overrideWithValue(prefs), apiProvider.overrideWithValue(api), authProvider.overrideWith(Me.new), uploadQueueProvider.overrideWith(NoQueue.new)],
        child: localizedApp(
          theme: CT.theme(),
          debugShowCheckedModeBanner: false,
          home: PhotoScreen(
            groupId: 'g1',
            photoId: 'p1',
            imageBuilder: (p) => Image.asset(photos[int.parse(p.id.substring(1)) - 1], fit: BoxFit.contain),
          ),
        ),
      ),
    ));
    await tester.pump();
    final context = tester.element(find.byType(PhotoScreen));
    await tester.runAsync(() async {
      for (final p in photos) {
        await precacheImage(AssetImage(p), context);
      }
    });
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await shoot(tester, key, 'preview'); // someone else's photo: delete disabled

    await tester.fling(find.byKey(const Key('photo-pages')), const Offset(-300, 0), 1500);
    await tester.pumpAndSettle();
    await shoot(tester, key, 'preview_own'); // own photo: delete enabled

    await tester.tap(find.byKey(const Key('photo-delete')));
    await tester.pumpAndSettle();
    await shoot(tester, key, 'preview_delete');
    await tester.tap(find.text('Annuleer'));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(195, 420));
    await tester.pump(kDoubleTapTimeout + const Duration(milliseconds: 20));
    await tester.pumpAndSettle();
    await shoot(tester, key, 'preview_immersive');
  }, skip: out == null);
}
