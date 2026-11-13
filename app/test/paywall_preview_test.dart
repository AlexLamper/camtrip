@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/onboarding_slides.dart';
import 'package:camtrip/features/premium/paywall_screen.dart';
import 'package:camtrip/features/premium/premium_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_offerings.dart';
import 'support/l10n.dart';
import 'support/real_fonts.dart';

/// Renders the paywall with real fonts and photos to PNG.
/// Run with: CAMTRIP_PREVIEW=/tmp/paywall flutter test test/paywall_preview_test.dart
void main() {
  final out = Platform.environment['CAMTRIP_PREVIEW'];
  setUpAll(loadRealFonts);

  const phones = {
    'preview_se': (Size(375, 667), 20.0, 0.0),
    'preview_pro': (Size(390, 844), 47.0, 34.0),
  };
  for (final locale in const [Locale('nl'), Locale('en')]) {
    for (final p in phones.entries) {
      final name = locale.languageCode == 'nl' ? p.key : '${p.key}_${locale.languageCode}';
      testWidgets(name, (tester) async {
        final (size, top, bottom) = p.value;
        tester.view.physicalSize = size * 3;
        tester.view.devicePixelRatio = 3;
        tester.view.padding = FakeViewPadding(top: top * 3, bottom: bottom * 3);
        addTearDown(tester.view.reset);
        debugDisableShadows = false;
        addTearDown(() => debugDisableShadows = true);
        final key = GlobalKey();

        await tester.pumpWidget(RepaintBoundary(
          key: key,
          child: ProviderScope(
            overrides: [
              premiumProvider.overrideWith(FakePremium.new),
              isProProvider.overrideWith((ref) => false),
            ],
            child: localizedApp(locale: locale, theme: CT.theme(), debugShowCheckedModeBanner: false, home: const PaywallScreen()),
          ),
        ));
        final context = tester.element(find.byType(PaywallScreen));
        await tester.runAsync(() async {
          for (final a in [OnboardingPhotos.sunset, OnboardingPhotos.friends, 'assets/images/app_icon.png']) {
            await precacheImage(AssetImage(a), context);
          }
        });
        await tester.pumpAndSettle();
        await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        final boundary = tester.renderObject<RenderRepaintBoundary>(find.byKey(key));
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2);
          final png = await image.toByteData(format: ui.ImageByteFormat.png);
          Directory(out!).createSync(recursive: true);
          File('$out/$name.png').writeAsBytesSync(png!.buffer.asUint8List());
        });
      }, skip: out == null);
    }
  }
}
