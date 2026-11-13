import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';

/// Three instant prints: two trip photos fanned out behind the app icon.
class PaywallHero extends StatelessWidget {
  const PaywallHero({super.key, required this.height, required this.photos});
  final double height;
  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    final w = height * 0.74; // print width that keeps the stack inside [height]
    Widget photo(String asset) => Image.asset(asset, fit: BoxFit.cover, errorBuilder: (_, _, _) => const ColoredBox(color: CT.cream));
    return SizedBox(
      height: height,
      child: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          top: height * 0.08,
          left: 0,
          right: w * 0.95,
          child: Center(child: SizedBox(width: w * 0.9, child: InstantPrint(rotation: -8, bottom: w * 0.16, padding: 5, child: photo(photos[0])))),
        ),
        Positioned(
          top: height * 0.1,
          left: w * 0.95,
          right: 0,
          child: Center(child: SizedBox(width: w * 0.86, child: InstantPrint(rotation: 7, bottom: w * 0.16, padding: 5, child: photo(photos[1])))),
        ),
        Positioned(
          top: height * 0.02,
          child: SizedBox(
            width: w,
            child: InstantPrint(rotation: -1.5, bottom: w * 0.2, padding: 6, child: Image.asset('assets/images/app_icon.png', fit: BoxFit.cover)),
          ),
        ),
      ]),
    );
  }
}

/// One short benefit with an icon, on one line at normal text size.
class BenefitLine extends StatelessWidget {
  const BenefitLine({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(color: CT.accent.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Icon(icon, size: 14, color: CT.accent),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: CT.text(14.5, weight: FontWeight.w500, height: 1.25))),
      ]),
    );
  }
}

/// A selectable plan: name, store price and a line or two below it.
class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.selected,
    required this.title,
    required this.price,
    required this.sub,
    required this.onTap,
    this.highlight,
    this.badge,
  });

  final bool selected;
  final String title;
  final String price;
  final String sub;
  final String? highlight;
  final String? badge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.fromLTRB(12, 11, 10, 11),
          decoration: BoxDecoration(
            color: CT.paper,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: selected ? CT.ink : CT.line, width: selected ? 2 : 1.5),
            boxShadow: selected ? CT.cardShadow : null,
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(child: Text(title, style: CT.text(13, weight: FontWeight.w600, height: 1.2))),
                Icon(selected ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, size: 18, color: selected ? CT.ink : CT.line),
              ]),
              const SizedBox(height: 2),
              Text(price, style: CT.title(22)),
              const SizedBox(height: 3),
              if (highlight != null) Text(highlight!, style: CT.text(12, color: CT.accent, weight: FontWeight.w700, height: 1.25)),
              Text(sub, style: CT.text(11.5, color: CT.muted, height: 1.25)),
            ]),
            if (badge != null)
              Positioned(
                top: -21,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(6)),
                  child: Text(badge!, style: CT.text(10, color: Colors.white, weight: FontWeight.w700, height: 1.3)),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}

/// Round close button that floats over the paywall.
class CloseCircle extends StatelessWidget {
  const CloseCircle({super.key, required this.tooltip, required this.onTap});
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onTap,
      style: IconButton.styleFrom(backgroundColor: CT.paper.withValues(alpha: 0.85), fixedSize: const Size(36, 36), minimumSize: const Size(36, 36)),
      icon: const Icon(Icons.close_rounded, size: 20, color: CT.muted),
    );
  }
}

/// "Herstel aankopen · Voorwaarden · Privacy · EULA" in small grey text.
class LegalLinks extends StatelessWidget {
  const LegalLinks({super.key, required this.links});
  final List<(String, VoidCallback?)> links;

  @override
  Widget build(BuildContext context) {
    final style = CT.text(11.5, color: CT.muted, height: 1.2);
    return Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
      for (var i = 0; i < links.length; i++) ...[
        if (i > 0) Text('·', style: style),
        InkWell(
          onTap: links[i].$2,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
            child: Text(links[i].$1, style: style.copyWith(decoration: TextDecoration.underline, decorationColor: CT.line)),
          ),
        ),
      ],
    ]);
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
