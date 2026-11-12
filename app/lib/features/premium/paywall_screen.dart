import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
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
      showMessage(context, 'Abonnementen zijn nu niet beschikbaar. Probeer het later.');
      return;
    }
    try {
      final ok = await ref.read(premiumProvider.notifier).purchase(p);
      if (ok && mounted) {
        showMessage(context, 'Welkom bij CamTrip Pro! 🎉');
        context.pop();
      }
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    }
  }

  Future<void> _restore() async {
    try {
      final ok = await ref.read(premiumProvider.notifier).restore();
      if (mounted) showMessage(context, ok ? 'Pro is hersteld' : 'Geen eerdere aankoop gevonden');
      if (ok && mounted) context.pop();
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    }
  }

  String _price(Package? p, String fallback) => p?.storeProduct.priceString ?? fallback;

  /// "7 dagen" / "1 maand" from the store's introductory offer, if it is free.
  static String? _trialText(Package? p) {
    final intro = p?.storeProduct.introductoryPrice;
    if (intro == null || intro.price > 0) return null;
    final n = intro.periodNumberOfUnits * intro.cycles;
    return switch (intro.periodUnit) {
      PeriodUnit.day => '$n ${n == 1 ? 'dag' : 'dagen'}',
      PeriodUnit.week => n == 1 ? '7 dagen' : '$n weken',
      PeriodUnit.month => '$n ${n == 1 ? 'maand' : 'maanden'}',
      PeriodUnit.year => '$n jaar',
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
    final trial = _trialText(selected);
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
          Align(alignment: Alignment.topRight, child: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.close, color: CT.muted))),
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
              Text(isPro ? 'Je hebt CamTrip Pro' : 'CamTrip Pro', style: CT.title(30)),
              const SizedBox(height: 6),
              Text('Alles voor je volgende trip.', style: CT.text(15, color: CT.muted)),
              const SizedBox(height: 16),
              for (final f in const [
                'Alle camerastijlen (Z/W, Golden, Chrome)',
                'Onbeperkt leden en opslag, foto\'s blijven altijd bewaard',
                'Recaps zonder watermerk',
                'Originele kwaliteit downloaden',
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
                    title: 'Jaar',
                    price: _price(annual, '€49,99'),
                    sub: '${annual?.storeProduct.pricePerMonthString ?? '€4,17'} per maand',
                    badge: 'BESPAAR 48%',
                    onTap: () => setState(() => _annual = true),
                  ),
                  const SizedBox(width: 10),
                  plan(
                    selected: !_annual,
                    title: 'Maand',
                    price: _price(monthly, '€7,99'),
                    sub: 'maandelijks opzegbaar',
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
                trial != null ? 'Probeer $trial gratis' : 'Word Pro',
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
                  child: Text('Abonnementen konden niet geladen worden. Controleer je verbinding.',
                      textAlign: TextAlign.center, style: CT.text(12, color: CT.accent)),
                ),
              if (!isPro)
                Text(
                  [
                    _annual
                        ? 'CamTrip Pro jaarabonnement: ${trial != null ? '$trial gratis, daarna ' : ''}${_price(annual, '€49,99')} per jaar.'
                        : 'CamTrip Pro maandabonnement: ${trial != null ? '$trial gratis, daarna ' : ''}${_price(monthly, '€7,99')} per maand.',
                    'De betaling loopt via je ${Platform.isIOS ? 'Apple ID' : 'Google-account'}. Het abonnement verlengt automatisch, '
                        'tenzij je het uiterlijk 24 uur voor het einde van de periode opzegt. '
                        'Opzeggen en beheren kan in de instellingen van je ${Platform.isIOS ? 'App Store-account' : 'Google Play-account'}.',
                  ].join(' '),
                  textAlign: TextAlign.center,
                  style: CT.text(11, color: CT.muted),
                ),
              const SizedBox(height: 6),
              Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
                TextButton(onPressed: s.busy ? null : _restore, child: Text('Herstel aankopen', style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => _open(AppConfig.termsUrl), child: Text('Voorwaarden', style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => _open(AppConfig.appleEulaUrl), child: Text('EULA', style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => _open(AppConfig.privacyUrl), child: Text('Privacy', style: CT.text(12, color: CT.muted))),
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

  static const title = 'Eén Pro in de groep = Pro voor iedereen in die groep';
  static const body = 'Heeft één iemand Pro, dan krijgt de hele groep alle camerastijlen, onbeperkt leden, '
      'foto\'s die bewaard blijven, originele kwaliteit en recaps zonder watermerk.';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: CT.cream, borderRadius: BorderRadius.circular(14)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Icon(Icons.groups_rounded, size: 22, color: CT.accent),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: CT.text(14, weight: FontWeight.w700)),
            const SizedBox(height: 3),
            Text(body, style: CT.text(13, color: CT.muted)),
          ]),
        ),
      ]),
    );
  }
}
