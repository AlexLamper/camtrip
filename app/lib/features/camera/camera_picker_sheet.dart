
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';
import '../premium/pro_gate.dart';
import 'styles.dart';

/// The photo every card in the picker is developed with, so the looks can be
/// compared side by side. Shown as a 4:3 crop from the top, which leaves out
/// the date stamp in its bottom corner.
const cameraPickerSamplePhoto = 'assets/images/onboarding/s2_hiker.jpg';

/// The styles in the order the picker shows them: the default "flash" camera
/// first, then the free cameras, then the Pro ones (each in [CameraStyle.all] order).
List<CameraStyle> cameraPickerOrder([List<CameraStyle>? styles]) {
  final all = styles ?? CameraStyle.all;
  int rank(CameraStyle s) => s.id == 'flash' ? 0 : (s.pro ? 2 : 1);
  final indexed = [for (var i = 0; i < all.length; i++) (i, all[i])];
  indexed.sort((a, b) {
    final r = rank(a.$2).compareTo(rank(b.$2));
    return r != 0 ? r : a.$1.compareTo(b.$1);
  });
  return [for (final e in indexed) e.$2];
}

/// Columns in the picker grid for a given grid width (screen minus padding):
/// 3 on phones from 360pt wide, 2 on very narrow ones (320pt), 4 on tablets.
int cameraPickerColumns(double gridWidth) => gridWidth >= 640 ? 4 : (gridWidth >= 330 ? 3 : 2);

/// Opens the camera picker. Resolves with the tapped camera (also when it is
/// locked: the caller sends the user to the paywall), or null when dismissed.
Future<CameraStyle?> showCameraPicker(BuildContext context, {required CameraStyle current, required ProGate gate}) {
  return showModalBottomSheet<CameraStyle>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: CT.bg,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (_) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.86,
      minChildSize: 0.5,
      maxChildSize: 0.94,
      builder: (context, scroll) => CameraPickerSheet(current: current, gate: gate, scrollController: scroll),
    ),
  );
}

/// Compact grid of camera cards: product shot, name, a small print developed
/// with that look, and a Pro lock where it applies. The one line about the
/// look shows on long-press and is read out by screen readers.
class CameraPickerSheet extends StatefulWidget {
  const CameraPickerSheet({super.key, required this.current, required this.gate, this.scrollController, this.styles});
  final CameraStyle current;
  final ProGate gate;
  final ScrollController? scrollController;

  /// Defaults to every style; for tests.
  final List<CameraStyle>? styles;

  @override
  State<CameraPickerSheet> createState() => _CameraPickerSheetState();
}

class _CameraPickerSheetState extends State<CameraPickerSheet> {
  late String _selected = widget.current.id;
  bool _closing = false;

  Future<void> _pick(CameraStyle s) async {
    if (_closing) return;
    _closing = true;
    final locked = !widget.gate.canUseStyle(styleIsPro: s.pro);
    if (locked) {
      HapticFeedback.lightImpact();
      Navigator.of(context).pop(s);
      return;
    }
    HapticFeedback.selectionClick();
    setState(() => _selected = s.id);
    await Future<void>.delayed(const Duration(milliseconds: 260));
    if (mounted) Navigator.of(context).pop(s);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final styles = cameraPickerOrder(widget.styles);
    final hint = widget.gate.cameraHint;
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(l.cameraPickerTitle, style: CT.title(24)),
              const SizedBox(height: 4),
              Text(l.cameraPickerSubtitle, style: CT.text(14, color: CT.muted)),
              if (hint != null) ...[
                const SizedBox(height: 10),
                Row(children: [
                  const Icon(Icons.star_rounded, size: 15, color: CT.accent),
                  const SizedBox(width: 4),
                  Flexible(child: Text(hint, style: CT.text(12.5, color: CT.ink, weight: FontWeight.w500))),
                ]),
              ],
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 24),
          sliver: SliverLayoutBuilder(builder: (context, constraints) {
            final columns = cameraPickerColumns(constraints.crossAxisExtent);
            const spacing = 8.0;
            final cardWidth = (constraints.crossAxisExtent - spacing * (columns - 1)) / columns;
            final artHeight = CameraCard.artHeightFor(cardWidth);
            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                mainAxisExtent: CameraCard.heightFor(artHeight, MediaQuery.textScalerOf(context)),
              ),
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final s = styles[i];
                  return CameraCard(
                    style: s,
                    selected: s.id == _selected,
                    locked: !widget.gate.canUseStyle(styleIsPro: s.pro),
                    artHeight: artHeight,
                    onTap: () => _pick(s),
                  );
                },
                childCount: styles.length,
              ),
            );
          }),
        ),
      ],
    );
  }
}

/// One camera in the picker.
class CameraCard extends StatefulWidget {
  const CameraCard(
      {super.key, required this.style, required this.selected, required this.locked, this.onTap, this.artHeight = 72});
  final CameraStyle style;
  final bool selected;
  final bool locked;
  final VoidCallback? onTap;

  /// Height of the cream product-shot area.
  final double artHeight;

  static const _pad = 5.0;
  static const _nameSize = 13.0;
  static const _nameHeight = 1.2;

  /// Product-shot height for a card of [cardWidth]: a bit wider than tall.
  static double artHeightFor(double cardWidth) => (cardWidth * 0.7).clamp(68.0, 112.0);

  /// Card height that fits the art and a one-line name at the given text scale.
  static double heightFor(double artHeight, TextScaler scaler) {
    final name = scaler.scale(_nameSize) * _nameHeight;
    // padding + border, art, gap, name, a little room below it
    return (_pad + 2) * 2 + artHeight + 6 + name + 3;
  }

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.style;
    final l = context.l10n;
    final selected = widget.selected;
    return Semantics(
      button: true,
      selected: selected,
      label: [s.name, s.description, if (widget.locked) l.cameraPickerUnlock, if (selected) l.cameraPickerSelected].join('. '),
      // the card is too small for the description: long-press shows it
      child: Tooltip(
        message: s.description,
        triggerMode: TooltipTriggerMode.longPress,
        excludeFromSemantics: true,
        preferBelow: false,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) => setState(() => _down = true),
          onTapCancel: () => setState(() => _down = false),
          onTapUp: (_) => setState(() => _down = false),
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _down ? 0.96 : (selected ? 1.0 : 0.985),
            duration: const Duration(milliseconds: 160),
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: CT.paper,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: selected ? CT.ink : CT.line, width: selected ? 2 : 1),
                boxShadow: selected ? CT.cardShadow : null,
              ),
              // border + padding stay 7pt together, so selecting does not shift the content
              padding: EdgeInsets.all(CameraCard._pad + (selected ? 0 : 1)),
              child: ExcludeSemantics(
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  SizedBox(
                    height: widget.artHeight,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: CT.cream, borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 6, 18, 10),
                            child: Opacity(opacity: widget.locked ? 0.82 : 1, child: CameraArt(s)),
                          ),
                        ),
                      ),
                      // a small print developed with this camera
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: Transform.rotate(
                          angle: 0.07,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(1.5, 1.5, 1.5, 4.5),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1.5), boxShadow: CT.printShadow),
                            child: SizedBox(width: 30, height: 23, child: StyleSample(s)),
                          ),
                        ),
                      ),
                      if (s.pro)
                        Positioned(left: 4, top: 4, child: _ProPill(locked: widget.locked)),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: AnimatedScale(
                          scale: selected ? 1 : 0,
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeOutBack,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: CT.paper, shape: BoxShape.circle),
                            child: Icon(Icons.check_circle_rounded, size: 18, color: CT.accent),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 6, 3, 0),
                    // long names (Turkish, Polish, large text) shrink a little instead of being cut off
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(s.name,
                          maxLines: 1,
                          softWrap: false,
                          style: CT.text(CameraCard._nameSize, weight: FontWeight.w700, height: CameraCard._nameHeight)),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProPill extends StatelessWidget {
  const _ProPill({required this.locked});
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 2, 6, 2),
      decoration: BoxDecoration(color: locked ? CT.ink : CT.paper, borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(locked ? Icons.lock_rounded : Icons.star_rounded, size: 10, color: locked ? Colors.white : CT.accent),
        const SizedBox(width: 2),
        // capped, so large text cannot push the pill into the check mark
        Text('Pro',
            textScaler: MediaQuery.textScalerOf(context).clamp(maxScaleFactor: 1.3),
            style: CT.text(9.5, weight: FontWeight.w700, color: locked ? Colors.white : CT.ink, height: 1.1)),
      ]),
    );
  }
}

/// Product shot of the camera behind a style.
class CameraArt extends StatelessWidget {
  const CameraArt(this.style, {super.key, this.fit = BoxFit.contain});
  final CameraStyle style;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) => Image.asset(
        style.art,
        fit: fit,
        filterQuality: FilterQuality.medium,
        errorBuilder: (_, _, _) => const Center(child: Icon(Icons.photo_camera_outlined, color: CT.muted)),
      );
}

/// [cameraPickerSamplePhoto] through a style's live-preview look: the same
/// colour matrix, light leak, vignette and grain as the viewfinder.
class StyleSample extends StatelessWidget {
  const StyleSample(this.style, {super.key, this.photo = cameraPickerSamplePhoto});
  final CameraStyle style;
  final String photo;

  @override
  Widget build(BuildContext context) {
    final s = style;
    return ClipRect(
      child: Stack(fit: StackFit.expand, children: [
        ColorFiltered(
          colorFilter: ColorFilter.matrix(s.matrix.m),
          child: Image.asset(photo, fit: BoxFit.cover, alignment: Alignment.topCenter, cacheWidth: 300),
        ),
        if (s.leak > 0)
          Opacity(opacity: s.leak.clamp(0, 1), child: Image.asset('assets/images/light_leak.png', fit: BoxFit.cover, cacheWidth: 200)),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 0.95,
              colors: [Colors.transparent, Colors.black.withValues(alpha: s.vignette * 0.75)],
              stops: const [0.5, 1],
            ),
          ),
        ),
        if (s.grain > 0)
          Opacity(
            opacity: (s.grain * 0.9).clamp(0, 1),
            child: Image.asset('assets/images/grain.png', repeat: ImageRepeat.repeat, fit: BoxFit.none, scale: 3),
          ),
      ]),
    );
  }
}

/// The "current camera" button in the camera screen: product shot + name.
class CameraPickerButton extends StatelessWidget {
  const CameraPickerButton({super.key, required this.style, required this.onTap});
  final CameraStyle style;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${context.l10n.cameraPickerChange}: ${style.name}',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap == null
            ? null
            : () {
                HapticFeedback.selectionClick();
                onTap!();
              },
        child: ExcludeSemantics(
          child: Container(
            key: const ValueKey('camera-picker-button'),
            constraints: const BoxConstraints(minHeight: 44),
            padding: const EdgeInsets.fromLTRB(6, 4, 12, 4),
            decoration: BoxDecoration(
              color: CT.paper,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: CT.line, width: 1.5),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 48,
                height: 36,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(color: CT.cream, borderRadius: BorderRadius.circular(9)),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: CameraArt(style, key: ValueKey(style.id)),
                ),
              ),
              const SizedBox(width: 9),
              // Flexible: the button sits between the flash and flip buttons
              // and must shrink (with an ellipsis) on narrow phones.
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
                  child: Text(style.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(14, weight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.expand_less_rounded, size: 20, color: CT.muted),
            ]),
          ),
        ),
      ),
    );
  }
}

/// A full-width "default camera" row for forms: product shot, name and look.
/// Tapping opens the camera picker.
class CameraSelectRow extends StatelessWidget {
  const CameraSelectRow({super.key, required this.style, required this.onTap});
  final CameraStyle style;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${context.l10n.cameraPickerChange}: ${style.name}. ${style.description}',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: ExcludeSemantics(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
            decoration: BoxDecoration(
              color: CT.paper,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: CT.line, width: 1.5),
            ),
            child: Row(children: [
              Container(
                width: 76,
                height: 58,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: CT.cream, borderRadius: BorderRadius.circular(11)),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: CameraArt(style, key: ValueKey(style.id)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(style.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(15, weight: FontWeight.w700, height: 1.25)),
                  const SizedBox(height: 2),
                  Text(style.description,
                      maxLines: 2, overflow: TextOverflow.ellipsis, style: CT.text(12.5, color: CT.muted, height: 1.3)),
                ]),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right_rounded, color: CT.muted),
            ]),
          ),
        ),
      ),
    );
  }
}
