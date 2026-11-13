@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/onboarding_screen.dart';
import 'package:camtrip/features/auth/onboarding_slides.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/l10n.dart';
import 'support/real_fonts.dart';

class _SignedOut extends AuthController {
  @override
  Future<AppUser?> build() async => null;
}

/// Renders every onboarding slide with real fonts and photos to PNG.
/// Run with: CAMTRIP_PREVIEW=/tmp/onboarding flutter test test/onboarding_preview_test.dart
void main() {
  final out = Platform.environment['CAMTRIP_PREVIEW'];
  setUpAll(loadRealFonts);

  const sizes = {'': Size(390, 844), 'se_': Size(375, 667), 'promax_': Size(440, 956)};
  for (final s in sizes.entries) {
    testWidgets('preview ${s.key}slides', (tester) async {
      tester.view.physicalSize = s.value * 3;
      tester.view.devicePixelRatio = 3;
      tester.view.padding = FakeViewPadding(top: s.value.height > 700 ? 47 * 3 : 20 * 3, bottom: s.value.height > 700 ? 34 * 3 : 0);
      addTearDown(tester.view.reset);
      debugDisableShadows = false; // real soft shadows in the preview
      addTearDown(() => debugDisableShadows = true);
      final key = GlobalKey();

      await tester.pumpWidget(RepaintBoundary(
        key: key,
        child: ProviderScope(
          overrides: [authProvider.overrideWith(_SignedOut.new)],
          child: localizedApp(theme: CT.theme(), debugShowCheckedModeBanner: false, home: const OnboardingScreen()),
        ),
      ));
      final context = tester.element(find.byType(OnboardingScreen));
      await tester.runAsync(() async {
        for (final p in OnboardingPhotos.all) {
          await precacheImage(AssetImage(p), context);
        }
      });

      for (var page = 0; page < 3; page++) {
        await tester.pumpAndSettle();
        // decode the images of the newly built slide
        await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        final boundary = tester.renderObject<RenderRepaintBoundary>(find.byKey(key));
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2);
          final png = await image.toByteData(format: ui.ImageByteFormat.png);
          Directory(out!).createSync(recursive: true);
          File('$out/${s.key}slide_${page + 1}.png').writeAsBytesSync(png!.buffer.asUint8List());
        });
        if (page < 2) await tester.drag(find.byType(PageView), Offset(-s.value.width, 0));
      }
    }, skip: out == null);
  }
}
