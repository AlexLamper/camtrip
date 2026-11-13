import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/premium/paywall_screen.dart';
import 'package:camtrip/features/premium/premium_controller.dart';
import 'package:camtrip/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_offerings.dart';
import 'support/l10n.dart';
import 'support/real_fonts.dart';

const _se = Size(375, 667);

Future<void> _pump(WidgetTester tester, {required Locale locale, double scale = 1, Size size = _se, double top = 20}) async {
  tester.view.physicalSize = size * 3;
  tester.view.devicePixelRatio = 3;
  tester.view.padding = FakeViewPadding(top: top * 3);
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(
    overrides: [
      premiumProvider.overrideWith(FakePremium.new),
      isProProvider.overrideWith((ref) => false),
    ],
    child: localizedApp(
      locale: locale,
      theme: CT.theme(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
        child: child!,
      ),
      home: const PaywallScreen(),
    ),
  ));
  await tester.pump(const Duration(milliseconds: 100));
}

/// [finder] is laid out entirely inside the screen, without scrolling.
void _expectInView(WidgetTester tester, Finder finder, Size screen, String what) {
  expect(finder, findsOneWidget, reason: what);
  final r = tester.getRect(finder);
  expect(r.top, greaterThanOrEqualTo(0), reason: '$what top');
  expect(r.left, greaterThanOrEqualTo(0), reason: '$what left');
  expect(r.right, lessThanOrEqualTo(screen.width), reason: '$what right');
  expect(r.bottom, lessThanOrEqualTo(screen.height), reason: '$what bottom ($r)');
}

void main() {
  setUpAll(loadRealFonts);

  for (final locale in const [Locale('nl'), Locale('en')]) {
    testWidgets('$locale: prices, CTA and legal links are on an iPhone SE screen without scrolling', (tester) async {
      await _pump(tester, locale: locale);
      expect(tester.takeException(), isNull);
      final l = lookupAppLocalizations(locale);

      _expectInView(tester, find.text('CamTrip Pro'), _se, 'title');
      _expectInView(tester, find.text(l.paywallBenefitStyles), _se, 'first benefit');
      _expectInView(tester, find.text(l.paywallBenefitGroup), _se, 'last benefit');
      _expectInView(tester, find.text('€ 47,99'), _se, 'annual price');
      _expectInView(tester, find.text('€ 7,49'), _se, 'monthly price');
      _expectInView(tester, find.text(l.paywallFreeTrial(l.periodDays(7))), _se, 'trial label');
      _expectInView(tester, find.text(l.paywallSaveBadge(47)), _se, 'save badge'); // 1 - 47.99 / (12 x 7.49)
      _expectInView(tester, find.byKey(const ValueKey('paywall-cta')), _se, 'CTA');
      _expectInView(tester, find.text(l.tryFree(l.periodDays(7))), _se, 'CTA label');
      _expectInView(tester, find.textContaining(l.paywallAutoRenew('Google Play')), _se, 'auto-renew terms');
      for (final link in [l.restorePurchases, l.terms, l.privacy, 'EULA']) {
        _expectInView(tester, find.text(link), _se, link);
      }
      // the close button stays reachable
      _expectInView(tester, find.byTooltip(l.close), _se, 'close');
      // the list is not scrolled: the title is at the top
      expect(tester.getRect(find.text('CamTrip Pro')).top, lessThan(_se.height / 2));
    });

    testWidgets('$locale: choosing monthly switches the CTA and the terms', (tester) async {
      await _pump(tester, locale: locale);
      final l = lookupAppLocalizations(locale);
      await tester.tap(find.byKey(const ValueKey('plan-monthly')));
      await tester.pump();
      expect(find.text(l.becomePro), findsOneWidget);
      expect(find.textContaining(l.paywallPriceMonth('€ 7,49')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('plan-annual')));
      await tester.pump();
      expect(find.textContaining(l.paywallPriceYearTrial(l.periodDays(7), '€ 47,99')), findsOneWidget);
    });
  }

  for (final locale in L10n.supportedLocales) {
    for (final scale in [1.0, 1.3]) {
      testWidgets('$locale at text scale $scale: no overflow on an iPhone SE, scrolled to the end too', (tester) async {
        await _pump(tester, locale: locale, scale: scale);
        expect(tester.takeException(), isNull);
        await tester.fling(find.byType(Scrollable).first, const Offset(0, -2000), 3000);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        // the buy button and legal links never scroll away
        final l = lookupAppLocalizations(locale);
        _expectInView(tester, find.byKey(const ValueKey('paywall-cta')), _se, 'CTA');
        _expectInView(tester, find.text(l.restorePurchases), _se, 'restore');
      });
    }
  }

  testWidgets('offerings failed to load: fallback prices and an error, still no overflow', (tester) async {
    tester.view.physicalSize = _se * 3;
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(ProviderScope(
      overrides: [
        premiumProvider.overrideWith(_NoOffering.new),
        isProProvider.overrideWith((ref) => false),
      ],
      child: localizedApp(theme: CT.theme(), home: const PaywallScreen()),
    ));
    await tester.pump();
    expect(tester.takeException(), isNull);
    final l = lookupAppLocalizations(dutch);
    expect(find.text(l.subscriptionsLoadFailed), findsOneWidget);
    _expectInView(tester, find.byKey(const ValueKey('paywall-cta')), _se, 'CTA');
    _expectInView(tester, find.text(l.restorePurchases), _se, 'restore');
  });
}

class _NoOffering extends PremiumController {
  @override
  PremiumState build() => const PremiumState(configured: true);
  @override
  Future<void> loadOffering() async {}
}
