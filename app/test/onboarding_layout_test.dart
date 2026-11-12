import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/onboarding_screen.dart';
import 'package:camtrip/features/auth/onboarding_slides.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/real_fonts.dart';

class _SignedOut extends AuthController {
  @override
  Future<AppUser?> build() async => null;
}

/// iPhone SE and iPhone Pro Max, with the notch / home indicator insets.
const _phones = {
  'iPhone SE 375x667': (Size(375, 667), EdgeInsets.only(top: 20)),
  'iPhone Pro Max 440x956': (Size(440, 956), EdgeInsets.only(top: 62, bottom: 34)),
};

void main() {
  setUpAll(loadRealFonts); // real glyph widths, like on the phone

  for (final phone in _phones.entries) {
    for (final scale in [1.0, 1.3]) {
      testWidgets('onboarding fits on ${phone.key} at text scale $scale', (tester) async {
        final (size, padding) = phone.value;
        tester.view.physicalSize = size * 3;
        tester.view.devicePixelRatio = 3;
        tester.view.padding = FakeViewPadding(top: padding.top * 3, bottom: padding.bottom * 3);
        addTearDown(tester.view.reset);

        await tester.pumpWidget(ProviderScope(
          overrides: [authProvider.overrideWith(_SignedOut.new)],
          child: MaterialApp(
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
              child: child!,
            ),
            home: const OnboardingScreen(pendingCode: 'ABC123'), // invite line makes slide 1 the tallest
          ),
        ));

        for (var page = 0; page < 3; page++) {
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull, reason: 'slide ${page + 1}');

          // the text never runs over the visual, and stays on screen
          final slides = find.byType(OnboardingSlide);
          final onScreen = [for (var k = 0; k < slides.evaluate().length; k++) slides.at(k)].where((f) => tester.getRect(f).left.abs() < 1);
          expect(onScreen, hasLength(1), reason: 'slide ${page + 1} is not settled');
          final slide = onScreen.single;
          expect(tester.widget<OnboardingSlide>(slide).index, page);
          final visual = tester.getRect(find.descendant(of: slide, matching: find.byType(FittedBox)).first);
          final textBlock = find.descendant(of: slide, matching: find.byType(SingleChildScrollView));
          final title = tester.getRect(find.descendant(of: textBlock, matching: find.byType(Text)).first);
          expect(visual.bottom, lessThanOrEqualTo(title.top), reason: 'slide ${page + 1}: visual overlaps text');
          expect(title.top, greaterThanOrEqualTo(padding.top));
          expect(visual.height, greaterThan(80), reason: 'slide ${page + 1}: visual squeezed away');

          if (page < 2) {
            await tester.drag(find.byType(PageView), Offset(-size.width, 0));
          }
        }
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    }
  }
}
