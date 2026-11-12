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

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(premiumProvider);
    final isPro = ref.watch(isProProvider);
    final annual = s.annual, monthly = s.monthly;
    final trial = (annual ?? monthly)?.storeProduct.introductoryPrice;

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
              if (!isPro) ...[
                const SizedBox(height: 22),
                Row(children: [
                  plan(
                    selected: _annual,
                    title: 'Jaar',
                    price: _price(annual, '€49,99'),
                    sub: annual != null ? '${(annual.storeProduct.price / 12).toStringAsFixed(2).replaceAll('.', ',')} per maand' : '€4,17 per maand',
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
                trial != null && _annual ? 'Probeer 7 dagen gratis' : 'Word Pro',
                kind: CTButtonKind.primary,
                loading: s.busy,
                onTap: () => _buy(_annual ? annual : monthly),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 6, 22, 10),
            child: Column(children: [
              if (!isPro)
                Text(
                  _annual
                      ? '${trial != null ? '7 dagen gratis, daarna ' : ''}${_price(annual, '€49,99')} per jaar. Verlengt automatisch, opzeggen kan altijd.'
                      : '${_price(monthly, '€7,99')} per maand. Verlengt automatisch, opzeggen kan altijd.',
                  textAlign: TextAlign.center,
                  style: CT.text(11, color: CT.muted),
                ),
              const SizedBox(height: 6),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(onPressed: _restore, child: Text('Herstel aankopen', style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => launchUrl(Uri.parse(AppConfig.appleEulaUrl)), child: Text('Voorwaarden', style: CT.text(12, color: CT.muted))),
                Text('·', style: CT.text(12, color: CT.muted)),
                TextButton(onPressed: () => launchUrl(Uri.parse(AppConfig.privacyUrl)), child: Text('Privacy', style: CT.text(12, color: CT.muted))),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}
