import 'dart:io';

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
import 'premium_controller.dart';

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

  void _open(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(premiumProvider);
    final isPro = ref.watch(isProProvider);
    final annual = s.annual, monthly = s.monthly;
    final selected = _annual ? annual : monthly;
    final l = context.l10n;
    final trial = _trialText(l, selected);
    final annualPrice = _price(annual, 49.99), monthlyPrice = _price(monthly, 7.99);
    final unavailable = s.configured && s.offering == null;

    Widget plan({required bool selected, required String title, required String price, required String sub, String? badge, required VoidCallback onTap}) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CT.paper,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: selected ? CT.ink : CT.line, width: selected ? 2.5 : 1.5),
            ),
            child: Stack(clipBehavior: Clip.none, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: CT.text(13, weight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(price, style: CT.text(20, weight: FontWeight.w700)),
                Text(sub, style: CT.text(11, color: CT.muted)),
              ]),
              if (badge != null)
                Positioned(
                  top: -22,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(8)),
                    child: Text(badge, style: CT.text(10, color: Colors.white, weight: FontWeight.w700)),
                  ),
                ),
            ]),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Align(alignment: Alignment.topRight, child: IconButton(tooltip: l.close, onPressed: () => context.pop(), icon: const Icon(Icons.close, color: CT.muted))),
          Expanded(
            child: ListView(padding: const EdgeInsets.symmetric(horizontal: 26), children: [
              SizedBox(
                height: 190,
                child: Stack(children: [
                  Positioned(left: 30, top: 6, width: 120, child: InstantPrint(rotation: -7, child: Container(color: const Color(0xFF6FB7DD)))),
                  Positioned(right: 30, top: 14, width: 112, child: InstantPrint(rotation: 6, child: Container(color: const Color(0xFF3B2F5C)))),
                  Positioned(left: 0, right: 0, top: 40, child: Center(child: SizedBox(width: 124, child: InstantPrint(rotation: -1, child: Image.asset('assets/images/app_icon.png', fit: BoxFit.cover))))),
                ]),
              ),
              const SizedBox(height: 10),
              Text(isPro ? l.paywallHavePro : 'CamTrip Pro', style: CT.title(30)),
              const SizedBox(height: 6),
              Text(l.paywallSubtitle, style: CT.text(15, color: CT.muted)),
              const SizedBox(height: 16),
              for (final f in [
                l.paywallFeatureStyles('${l.styleBw}, ${l.styleGolden}, ${l.styleChrome}'),
                l.paywallFeatureUnlimited,
                l.paywallFeatureNoWatermark,
                l.paywallFeatureOriginal,
              ])
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Icon(Icons.check, size: 18, color: CT.accent),
                    const SizedBox(width: 10),
                    Expanded(child: Text(f, style: CT.text(15))),
                  ]),
                ),
              const SizedBox(height: 8),
              const GroupProNote(),
              if (!isPro) ...[
                const SizedBox(height: 22),
                Row(children: [
                  plan(
                    selected: _annual,
                    title: l.planYear,
                    price: annualPrice,
                    sub: l.pricePerMonth(annual?.storeProduct.pricePerMonthString ?? _price(null, 4.17)),
                    badge: l.paywallSaveBadge(48),
                    onTap: () => setState(() => _annual = true),
                  ),
                  const SizedBox(width: 10),
                  plan(
                    selected: !_annual,
                    title: l.planMonth,
                    price: monthlyPrice,
                    sub: l.planMonthCancelAnytime,
                    onTap: () => setState(() => _annual = false),
                  ),
                ]),
              ],
            ]),
          ),
          if (!isPro)
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 8, 22, 4),
              child: CTButton(
                trial != null ? l.tryFree(trial) : l.becomePro,
                kind: CTButtonKind.primary,
                loading: s.busy,
                onTap: () => _buy(_annual ? annual : monthly),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 6, 22, 10),
            child: Column(children: [
              if (unavailable)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(l.subscriptionsLoadFailed,
                      textAlign: TextAlign.center, style: CT.text(12, color: CT.accent)),
                ),
              if (!isPro)
                Text(
                  [
                    switch ((_annual, trial)) {
                      (true, null) => l.legalAnnual(annualPrice),
                      (true, final t?) => l.legalAnnualTrial(t, annualPrice),
                      (false, null) => l.legalMonthly(monthlyPrice),
                      (false, final t?) => l.legalMonthlyTrial(t, monthlyPrice),
                    },
                    Platform.isIOS ? l.legalBillingApple : l.legalBillingGoogle,
                  ].join(' '),
                  textAlign: TextAlign.center,
                  style: CT.text(11, color: CT.muted),
                ),
              const SizedBox(height: 6),
              Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
                TextButton(onPressed: s.busy ? null : _restore, child: Text(l.restorePurchases, style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => _open(AppConfig.termsUrl), child: Text(l.terms, style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => _open(AppConfig.appleEulaUrl), child: Text('EULA', style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => _open(AppConfig.privacyUrl), child: Text(l.privacy, style: CT.text(12, color: CT.muted))),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}

/// "Eén Pro in de groep = Pro voor iedereen in die groep."
class GroupProNote extends StatelessWidget {
  const GroupProNote({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: CT.cream, borderRadius: BorderRadius.circular(14)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Icon(Icons.groups_rounded, size: 22, color: CT.accent),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(l.groupProTitle, style: CT.text(14, weight: FontWeight.w700)),
            const SizedBox(height: 3),
            Text(l.groupProBody, style: CT.text(13, color: CT.muted)),
          ]),
        ),
      ]),
    );
  }
}
