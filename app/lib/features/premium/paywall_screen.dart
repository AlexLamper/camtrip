import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../auth/onboarding_slides.dart' show OnboardingPhotos;
import '../camera/styles.dart';
import 'paywall_widgets.dart';
import 'premium_controller.dart';

export 'paywall_widgets.dart' show GroupProNote;

/// The Pro paywall. At the default text size everything needed to buy
/// (benefits, both prices, the button, the renewal terms and the legal links)
/// fits on an iPhone SE without scrolling; the details below the plans and
/// large accessibility text scroll.
class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});
  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  bool _annual = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(premiumProvider.notifier).loadOffering());
  }

  Future<void> _buy(Package? p) async {
    if (p == null) {
      showMessage(context, context.l10n.subscriptionsUnavailable);
      return;
    }
    try {
      final ok = await ref.read(premiumProvider.notifier).purchase(p);
      if (ok && mounted) {
        showMessage(context, context.l10n.welcomePro);
        context.pop();
      }
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    }
  }

  Future<void> _restore() async {
    try {
      final ok = await ref.read(premiumProvider.notifier).restore();
      if (mounted) showMessage(context, ok ? context.l10n.proRestored : context.l10n.noPurchaseFound);
      if (ok && mounted) context.pop();
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    }
  }

  /// The store's price, or the list price in euros while the store has not answered.
  String _price(Package? p, double fallback) =>
      p?.storeProduct.priceString ?? NumberFormat.simpleCurrency(locale: L10n.intlLocale, name: 'EUR').format(fallback);

  /// "7 dagen" / "1 maand" from the store's introductory offer, if it is free.
  static String? _trialText(AppLocalizations l, Package? p) {
    final intro = p?.storeProduct.introductoryPrice;
    if (intro == null || intro.price > 0) return null;
    final n = intro.periodNumberOfUnits * intro.cycles;
    return switch (intro.periodUnit) {
      PeriodUnit.day => l.periodDays(n),
      PeriodUnit.week => n == 1 ? l.periodDays(7) : l.periodWeeks(n),
      PeriodUnit.month => l.periodMonths(n),
      PeriodUnit.year => l.periodYears(n),
      _ => null,
    };
  }

  /// What the year saves against twelve months, from the store's prices.
  static int _savePercent(Package? annual, Package? monthly) {
    final y = annual?.storeProduct.price, m = monthly?.storeProduct.price;
    if (y == null || m == null || m <= 0) return 48; // 49,99 vs 12 x 7,99
    return ((1 - y / (m * 12)) * 100).round().clamp(0, 99);
  }

  void _open(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(premiumProvider);
    final isPro = ref.watch(isProProvider);
    final annual = s.annual, monthly = s.monthly;
    final l = context.l10n;
    final trial = _trialText(l, _annual ? annual : monthly);
    final annualTrial = _trialText(l, annual), monthlyTrial = _trialText(l, monthly);
    final annualPrice = _price(annual, 49.99), monthlyPrice = _price(monthly, 7.99);
    final unavailable = s.configured && s.offering == null;
    final store = defaultTargetPlatform == TargetPlatform.iOS ? 'App Store' : 'Google Play';

    final renew = [
      switch ((_annual, trial)) {
        (true, null) => l.paywallPriceYear(annualPrice),
        (true, final t?) => l.paywallPriceYearTrial(t, annualPrice),
        (false, null) => l.paywallPriceMonth(monthlyPrice),
        (false, final t?) => l.paywallPriceMonthTrial(t, monthlyPrice),
      },
      l.paywallAutoRenew(store),
    ].join(' ');

    final benefits = [
      (Icons.auto_awesome_rounded, l.paywallBenefitStyles),
      (Icons.all_inclusive_rounded, l.paywallBenefitUnlimited),
      (Icons.hd_rounded, l.paywallBenefitQuality),
      (Icons.groups_rounded, l.paywallBenefitGroup),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Stack(children: [
              LayoutBuilder(builder: (context, box) {
                // The hero gets what the essentials leave over, so the plans
                // stay on screen on small phones.
                final hero = (box.maxHeight - 330 * MediaQuery.textScalerOf(context).scale(1)).clamp(0.0, 200.0);
                return ListView(padding: const EdgeInsets.fromLTRB(24, 0, 24, 24), children: [
                  if (hero >= 90) PaywallHero(height: hero, photos: const [OnboardingPhotos.sunset, OnboardingPhotos.friends]) else const SizedBox(height: 44),
                  Text(isPro ? l.paywallHavePro : 'CamTrip Pro', style: CT.title(28)),
                  const SizedBox(height: 2),
                  Text(l.paywallSubtitle, style: CT.text(14, color: CT.muted)),
                  const SizedBox(height: 12),
                  for (final (icon, text) in benefits) BenefitLine(icon: icon, text: text),
                  if (!isPro) ...[
                    const SizedBox(height: 20),
                    IntrinsicHeight(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        Expanded(
                          child: PlanCard(
                            key: const ValueKey('plan-annual'),
                            selected: _annual,
                            title: l.planYear,
                            price: annualPrice,
                            highlight: annualTrial != null ? l.paywallFreeTrial(annualTrial) : null,
                            sub: l.pricePerMonth(annual?.storeProduct.pricePerMonthString ?? _price(null, 4.17)),
                            badge: l.paywallSaveBadge(_savePercent(annual, monthly)),
                            onTap: () => setState(() => _annual = true),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: PlanCard(
                            key: const ValueKey('plan-monthly'),
                            selected: !_annual,
                            title: l.planMonth,
                            price: monthlyPrice,
                            highlight: monthlyTrial != null ? l.paywallFreeTrial(monthlyTrial) : null,
                            sub: l.planMonthCancelAnytime,
                            onTap: () => setState(() => _annual = false),
                          ),
                        ),
                      ]),
                    ),
                  ],
                  // Below the fold: the long version, for whoever scrolls.
                  const SizedBox(height: 36),
                  Text(l.paywallDetailsTitle.toUpperCase(), style: CT.label),
                  const SizedBox(height: 10),
                  for (final f in [
                    l.cameraPickerPaywallStyles(CameraStyle.all.length, paywallStyleHighlights().join(', ')),
                    l.paywallFeatureUnlimited,
                    l.paywallFeatureNoWatermark,
                    l.paywallFeatureOriginal,
                  ])
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Padding(padding: EdgeInsets.only(top: 2), child: Icon(Icons.check, size: 16, color: CT.accent)),
                        const SizedBox(width: 10),
                        Expanded(child: Text(f, style: CT.text(14))),
                      ]),
                    ),
                  const SizedBox(height: 8),
                  const GroupProNote(),
                ]);
              }),
              Positioned(
                top: 4,
                right: 8,
                child: CloseCircle(tooltip: l.close, onTap: () => context.pop()),
              ),
            ]),
          ),
          // Fixed footer: always on screen.
          DecoratedBox(
            decoration: const BoxDecoration(color: CT.bg, border: Border(top: BorderSide(color: CT.line, width: 0.5))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                if (unavailable)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(l.subscriptionsLoadFailed, textAlign: TextAlign.center, style: CT.text(12, color: CT.accent, height: 1.3)),
                  ),
                if (!isPro) ...[
                  CTButton(
                    trial != null ? l.tryFree(trial) : l.becomePro,
                    key: const ValueKey('paywall-cta'),
                    kind: CTButtonKind.dark,
                    loading: s.busy,
                    onTap: () => _buy(_annual ? annual : monthly),
                  ),
                  const SizedBox(height: 6),
                  Text(renew, textAlign: TextAlign.center, style: CT.text(11, color: CT.muted, height: 1.3)),
                ],
                LegalLinks(links: [
                  (l.restorePurchases, s.busy ? null : _restore),
                  (l.terms, () => _open(AppConfig.termsUrl)),
                  (l.privacy, () => _open(AppConfig.privacyUrl)),
                  ('EULA', () => _open(AppConfig.appleEulaUrl)),
                ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

/// A few Pro cameras named in the paywall's benefit line (the rest is "all N").
List<String> paywallStyleHighlights() =>
    [for (final id in const ['bw', 'golden', 'night', 'super8']) CameraStyle.all.where((s) => s.id == id && s.pro).firstOrNull?.name]
        .whereType<String>()
        .toList();
