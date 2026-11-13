import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/groups/groups_controller.dart';
import 'package:camtrip/features/premium/paywall_screen.dart';
import 'package:camtrip/features/premium/premium_controller.dart';
import 'package:camtrip/features/premium/roll.dart';
import 'package:camtrip/l10n/l10n.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_offerings.dart';
import 'support/l10n.dart';
import 'support/real_fonts.dart';

const _se = Size(375, 667);

Group _group({bool personal = false, bool tripPass = false, DateTime? deleteAfter}) => Group.fromJson({
      'id': 'g1',
      'name': 'Mallorca',
      'type': personal ? 'permanent' : 'vacation',
      'isPersonal': personal,
      'code': 'ABC123',
      'status': 'active',
      'myRole': 'member',
      'ownerId': 'owner',
      'isProGroup': tripPass,
      'proSource': tripPass ? 'tripPass' : null,
      'tripPass': tripPass ? {'purchasedByName': 'Sanne'} : null,
      'deleteAfter': deleteAfter?.toIso8601String(),
      'roll': tripPass ? null : {'used': 24, 'limit': 24},
      'memberLimit': 10,
      'members': [
        {'id': 'me', 'name': 'Ik', 'role': 'member'},
      ],
    });

Future<void> _pump(
  WidgetTester tester, {
  required Locale locale,
  double scale = 1,
  PaywallReason reason = PaywallReason.general,
  Group? group,
}) async {
  tester.view.physicalSize = _se * 3;
  tester.view.devicePixelRatio = 3;
  tester.view.padding = const FakeViewPadding(top: 20 * 3);
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(
    overrides: [
      premiumProvider.overrideWith(FakePremium.new),
      isProProvider.overrideWith((ref) => false),
      groupProvider.overrideWith((ref, id) => group != null && group.isId(id) ? group : null),
      rollProvider.overrideWith((ref, id) => group == null || group.rollLimit == null ? null : RollState(used: group.rollUsed, limit: group.rollLimit!)),
    ],
    child: localizedApp(
      locale: locale,
      theme: CT.theme(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
        child: child!,
      ),
      home: PaywallScreen(reason: reason, groupId: group?.id),
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

/// Everything needed to buy is on an iPhone SE screen without scrolling.
void _expectEssentialsInView(WidgetTester tester, AppLocalizations l, {required bool tripPass}) {
  _expectInView(tester, find.byKey(const ValueKey('paywall-title')), _se, 'title');
  if (tripPass) _expectInView(tester, find.byKey(const ValueKey('plan-trip-pass')), _se, 'trip pass option');
  _expectInView(tester, find.byKey(const ValueKey('plan-annual')), _se, 'annual option');
  _expectInView(tester, find.byKey(const ValueKey('plan-monthly')), _se, 'monthly option');
  _expectInView(tester, find.byKey(const ValueKey('paywall-cta')), _se, 'CTA');
  _expectInView(tester, find.byKey(const ValueKey('paywall-terms')), _se, 'terms');
  for (final link in [l.restorePurchases, l.terms, l.privacy, 'EULA']) {
    _expectInView(tester, find.text(link), _se, link);
  }
  _expectInView(tester, find.byTooltip(l.close), _se, 'close');
}

void main() {
  setUpAll(loadRealFonts);

  for (final locale in const [Locale('nl'), Locale('en'), Locale('de')]) {
    testWidgets('$locale: general paywall: Pro year and month, no Trip Pass, no free trial, fits an iPhone SE', (tester) async {
      await _pump(tester, locale: locale);
      expect(tester.takeException(), isNull);
      final l = lookupAppLocalizations(locale);

      _expectEssentialsInView(tester, l, tripPass: false);
      expect(find.byKey(const ValueKey('plan-trip-pass')), findsNothing);
      _expectInView(tester, find.text('€ 47,99'), _se, 'annual price');
      _expectInView(tester, find.text('€ 7,49'), _se, 'monthly price');
      _expectInView(tester, find.text(l.paywallBestValue), _se, 'best value badge');
      // The store still reports a 7-day intro offer: it is not advertised anywhere.
      expect(find.textContaining(l.periodDays(7)), findsNothing);
      expect(find.text(l.tryFree(l.periodDays(7))), findsNothing);
      expect(find.text(l.paywallFreeTrial(l.periodDays(7))), findsNothing);
      // Year is picked by default: "Word Pro" and the renewal terms.
      expect(find.text(l.becomePro), findsOneWidget);
      expect(find.textContaining(l.paywallPriceYear('€ 47,99')), findsOneWidget);
      expect(find.textContaining(l.paywallAutoRenew('Google Play')), findsOneWidget);
    });

    testWidgets('$locale: roll full in a group: header 24/24, Trip Pass first and picked, fits an iPhone SE', (tester) async {
      await _pump(tester, locale: locale, reason: PaywallReason.rollFull, group: _group());
      expect(tester.takeException(), isNull);
      final l = lookupAppLocalizations(locale);

      expect(find.text(l.paywallRollFullTitle(24, 24)), findsOneWidget);
      _expectEssentialsInView(tester, l, tripPass: true);
      _expectInView(tester, find.text('€ 4,49'), _se, 'trip pass price');
      _expectInView(tester, find.text(l.paywallTripPassSub), _se, 'trip pass line');
      // Trip Pass picked: its CTA and one-time terms, no auto-renew sentence.
      expect(find.text(l.buyTripPass), findsOneWidget);
      expect(find.text(l.paywallTripPassTerms('€ 4,49')), findsOneWidget);
      expect(find.textContaining(l.paywallAutoRenew('Google Play')), findsNothing);
      // Switching to the month brings the subscription terms back.
      await tester.tap(find.byKey(const ValueKey('plan-monthly')));
      await tester.pump();
      expect(find.text(l.becomePro), findsOneWidget);
      expect(find.textContaining(l.paywallPriceMonth('€ 7,49')), findsOneWidget);
      expect(find.textContaining(l.paywallAutoRenew('Google Play')), findsOneWidget);
    });
  }

  testWidgets('each trigger has its own header', (tester) async {
    final l = lookupAppLocalizations(dutch);
    final until = DateTime(2026, 12, 1);
    for (final (reason, title) in [
      (PaywallReason.camera, l.paywallCameraTitle),
      (PaywallReason.watermark, l.paywallWatermarkTitle),
      (PaywallReason.deletion, l.paywallDeletionTitle),
      (PaywallReason.general, 'CamTrip Pro'),
    ]) {
      await _pump(tester, locale: dutch, reason: reason, group: _group(deleteAfter: until));
      expect(find.text(title), findsOneWidget, reason: reason.name);
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('deletion warning in a group picks the Trip Pass; a camera prompt picks the year', (tester) async {
    final l = lookupAppLocalizations(dutch);
    await _pump(tester, locale: dutch, reason: PaywallReason.deletion, group: _group(deleteAfter: DateTime(2026, 12, 1)));
    expect(find.text(l.buyTripPass), findsOneWidget);
    await _pump(tester, locale: dutch, reason: PaywallReason.camera, group: _group());
    expect(find.byKey(const ValueKey('plan-trip-pass')), findsOneWidget);
    expect(find.text(l.becomePro), findsOneWidget);
  });

  testWidgets('no Trip Pass for my personal roll, or for a trip that already has one', (tester) async {
    await _pump(tester, locale: dutch, reason: PaywallReason.rollFull, group: _group(personal: true));
    expect(find.byKey(const ValueKey('plan-trip-pass')), findsNothing);
    await _pump(tester, locale: dutch, reason: PaywallReason.camera, group: _group(tripPass: true));
    expect(find.byKey(const ValueKey('plan-trip-pass')), findsNothing);
  });

  for (final locale in L10n.supportedLocales) {
    for (final scale in [1.0, 1.3]) {
      testWidgets('$locale at text scale $scale: no overflow on an iPhone SE with all three options, scrolled to the end too',
          (tester) async {
        await _pump(tester, locale: locale, scale: scale, reason: PaywallReason.rollFull, group: _group());
        expect(tester.takeException(), isNull);
        final l = lookupAppLocalizations(locale);
        if (scale == 1.0) _expectEssentialsInView(tester, l, tripPass: true);
        await tester.fling(find.byType(Scrollable).first, const Offset(0, -2000), 3000);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        // the buy button and legal links never scroll away
        _expectInView(tester, find.byKey(const ValueKey('paywall-cta')), _se, 'CTA');
        _expectInView(tester, find.text(l.restorePurchases), _se, 'restore');
      });
    }
  }

  testWidgets('offerings failed to load: fallback prices and an error, still no overflow', (tester) async {
    tester.view.physicalSize = _se * 3;
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    final group = _group();
    await tester.pumpWidget(ProviderScope(
      overrides: [
        premiumProvider.overrideWith(_NoOffering.new),
        isProProvider.overrideWith((ref) => false),
        groupProvider.overrideWith((ref, id) => group.isId(id) ? group : null),
        rollProvider.overrideWith((ref, id) => const RollState(used: 24, limit: 24)),
      ],
      child: localizedApp(theme: CT.theme(), home: const PaywallScreen(reason: PaywallReason.rollFull, groupId: 'g1')),
    ));
    await tester.pump();
    expect(tester.takeException(), isNull);
    final l = lookupAppLocalizations(dutch);
    expect(find.text(l.subscriptionsLoadFailed), findsOneWidget);
    // list prices while the store has not answered
    expect(find.textContaining('4,99'), findsWidgets);
    expect(find.textContaining('49,99'), findsOneWidget);
    expect(find.textContaining('7,99'), findsOneWidget);
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
