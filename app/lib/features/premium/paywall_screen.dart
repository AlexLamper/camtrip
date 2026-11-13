import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/onboarding_slides.dart' show OnboardingPhotos;
import '../camera/styles.dart';
import '../groups/groups_controller.dart';
import 'paywall_widgets.dart';
import 'premium_controller.dart';
import 'roll.dart';

export 'paywall_widgets.dart' show GroupProNote;
export 'roll.dart' show PaywallReason, openPaywall, paywallLocation;

/// The three things the paywall sells.
enum PaywallPlan { tripPass, annual, monthly }

/// The paywall. A header that says why it opened ([reason]), then up to three
/// options: Trip Pass (only for a group: [groupId]), Pro per year and Pro per
/// month. No free trial: if the store still reports an introductory offer,
/// it is not advertised. At the default text size everything needed to buy
/// (header, options, the button, the terms and the legal links) fits on an
/// iPhone SE without scrolling; the details below scroll.
class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key, this.reason = PaywallReason.general, this.groupId});

  final PaywallReason reason;

  /// App id of the group the paywall was opened from (offers the Trip Pass).
  final String? groupId;

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  PaywallPlan? _picked;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(premiumProvider.notifier).loadOffering());
  }

  /// The group a Trip Pass would be for, or null when it cannot have one.
  Group? _tripPassGroup() {
    final id = widget.groupId;
    if (id == null) return null;
    final g = ref.watch(groupProvider(id));
    if (g == null || g.isPersonal || g.hasTripPass) return null;
    return g;
  }

  /// What is selected: the user's pick, else the Trip Pass when the roll is
  /// full or the trip is about to go (the smallest step), else the year.
  PaywallPlan _plan(bool tripPassOffered) {
    final p = _picked;
    if (p != null && (p != PaywallPlan.tripPass || tripPassOffered)) return p;
    if (tripPassOffered && (widget.reason == PaywallReason.rollFull || widget.reason == PaywallReason.deletion)) {
      return PaywallPlan.tripPass;
    }
    return PaywallPlan.annual;
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

  Future<void> _buyTripPass(Group group) async {
    try {
      final outcome = await ref.read(premiumProvider.notifier).purchaseTripPass(group);
      if (!mounted || outcome == TripPassOutcome.cancelled) return;
      showMessage(context, outcome == TripPassOutcome.activated ? context.l10n.tripPassActive : context.l10n.tripPassActivating);
      context.pop();
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

  void _open(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

  /// Title and one line below it, for why the paywall opened.
  (String, String) _header(AppLocalizations l, bool isPro) {
    if (isPro) return (l.paywallHavePro, l.paywallSubtitle);
    final group = widget.groupId == null ? null : ref.watch(groupProvider(widget.groupId!));
    switch (widget.reason) {
      case PaywallReason.rollFull:
        final roll = widget.groupId == null ? null : ref.watch(rollProvider(widget.groupId!));
        final limit = roll?.limit ?? group?.rollLimit ?? 24;
        final used = (roll?.used ?? limit).clamp(0, limit);
        return (l.paywallRollFullTitle(used, limit), l.paywallRollFullSub);
      case PaywallReason.camera:
        return (l.paywallCameraTitle, l.paywallCameraSub(CameraStyle.all.length));
      case PaywallReason.watermark:
        return (l.paywallWatermarkTitle, l.paywallWatermarkSub);
      case PaywallReason.deletion:
        final until = group?.deleteAfter;
        return (l.paywallDeletionTitle, until == null ? l.deletionBannerBody : l.paywallDeletionSub(Fmt.shortYear(until)));
      case PaywallReason.general:
        return ('CamTrip Pro', l.paywallSubtitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(premiumProvider);
    final isPro = ref.watch(isProProvider);
    final annual = s.annual, monthly = s.monthly, tripPassPackage = s.tripPass;
    final l = context.l10n;
    final tripGroup = isPro ? null : _tripPassGroup();
    final plan = _plan(tripGroup != null);
    final annualPrice = _price(annual, 49.99), monthlyPrice = _price(monthly, 7.99);
    final tripPassPrice = _price(tripPassPackage, 4.99);
    final unavailable = s.configured && s.offering == null;
    final store = defaultTargetPlatform == TargetPlatform.iOS ? 'App Store' : 'Google Play';
    final (title, subtitle) = _header(l, isPro);

    // Only subscriptions renew: the Trip Pass gets its own one-line terms.
    final terms = switch (plan) {
      PaywallPlan.tripPass => l.paywallTripPassTerms(tripPassPrice),
      PaywallPlan.annual => '${l.paywallPriceYear(annualPrice)} ${l.paywallAutoRenew(store)}',
      PaywallPlan.monthly => '${l.paywallPriceMonth(monthlyPrice)} ${l.paywallAutoRenew(store)}',
    };

    final benefits = [
      (Icons.all_inclusive_rounded, l.paywallBenefitUnlimited),
      (Icons.auto_awesome_rounded, l.paywallBenefitStyles),
      (Icons.groups_rounded, l.paywallBenefitGroup),
    ];

    void pick(PaywallPlan p) => setState(() => _picked = p);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Stack(children: [
              LayoutBuilder(builder: (context, box) {
                // The hero gets what the essentials leave over, so the options
                // stay on screen on small phones.
                final essentials = tripGroup != null ? 400 : 340;
                final hero = (box.maxHeight - essentials * MediaQuery.textScalerOf(context).scale(1)).clamp(0.0, 170.0);
                return ListView(padding: const EdgeInsets.fromLTRB(20, 0, 20, 24), children: [
                  if (hero >= 90)
                    PaywallHero(height: hero, photos: const [OnboardingPhotos.sunset, OnboardingPhotos.friends])
                  else
                    const SizedBox(height: 44),
                  Text(title, key: const ValueKey('paywall-title'), style: CT.title(24)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: CT.text(14, color: CT.muted, height: 1.3)),
                  const SizedBox(height: 10),
                  for (final (icon, text) in benefits) BenefitLine(icon: icon, text: text),
                  if (!isPro) ...[
                    const SizedBox(height: 8),
                    if (tripGroup != null) ...[
                      PaywallOption(
                        key: const ValueKey('plan-trip-pass'),
                        selected: plan == PaywallPlan.tripPass,
                        title: 'Trip Pass',
                        sub: l.paywallTripPassSub,
                        price: tripPassPrice,
                        priceNote: l.paywallOneTime,
                        onTap: () => pick(PaywallPlan.tripPass),
                      ),
                      const SizedBox(height: 8),
                    ],
                    PaywallOption(
                      key: const ValueKey('plan-annual'),
                      selected: plan == PaywallPlan.annual,
                      title: 'Pro · ${l.planYear}',
                      sub: l.pricePerMonth(annual?.storeProduct.pricePerMonthString ?? _price(null, 4.17)),
                      price: annualPrice,
                      badge: l.paywallBestValue,
                      onTap: () => pick(PaywallPlan.annual),
                    ),
                    const SizedBox(height: 8),
                    PaywallOption(
                      key: const ValueKey('plan-monthly'),
                      selected: plan == PaywallPlan.monthly,
                      title: 'Pro · ${l.planMonth}',
                      sub: l.planMonthCancelAnytime,
                      price: monthlyPrice,
                      onTap: () => pick(PaywallPlan.monthly),
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
              PositionedDirectional(
                top: 4,
                end: 8,
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
                    plan == PaywallPlan.tripPass ? l.buyTripPass : l.becomePro,
                    key: const ValueKey('paywall-cta'),
                    kind: CTButtonKind.dark,
                    loading: s.busy,
                    onTap: () => switch (plan) {
                      PaywallPlan.tripPass => _buyTripPass(tripGroup!),
                      PaywallPlan.annual => _buy(annual),
                      PaywallPlan.monthly => _buy(monthly),
                    },
                  ),
                  const SizedBox(height: 6),
                  Text(terms, key: const ValueKey('paywall-terms'), textAlign: TextAlign.center, style: CT.text(11, color: CT.muted, height: 1.3)),
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
