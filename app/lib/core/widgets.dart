import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../models/models.dart';
import 'theme.dart';

/// Full-width button: orange (primary), black (dark) or outlined.
class CTButton extends StatelessWidget {
  const CTButton(this.label, {super.key, this.onTap, this.kind = CTButtonKind.dark, this.icon, this.loading = false, this.compact = false});

  final String label;
  final VoidCallback? onTap;
  final CTButtonKind kind;
  final IconData? icon;
  final bool loading;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, border) = switch (kind) {
      CTButtonKind.primary => (CT.accent, Colors.white, null),
      CTButtonKind.dark => (CT.ink, Colors.white, null),
      CTButtonKind.outline => (CT.paper, CT.ink, Border.all(color: CT.ink, width: 1.5)),
      CTButtonKind.ghost => (CT.paper, CT.ink, Border.all(color: CT.line, width: 1.5)),
    };
    final disabled = onTap == null || loading;
    return Opacity(
      opacity: disabled && !loading ? 0.5 : 1,
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: disabled ? null : onTap,
          child: Container(
            height: compact ? 46 : 54,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: border),
            alignment: Alignment.center,
            child: loading
                ? SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: fg))
                : Row(mainAxisSize: MainAxisSize.min, children: [
                    if (icon != null) ...[Icon(icon, color: fg, size: 20), const SizedBox(width: 8)],
                    Flexible(
                      child: Text(label,
                          maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(15, color: fg, weight: FontWeight.w600)),
                    ),
                  ]),
          ),
        ),
      ),
    );
  }
}

enum CTButtonKind { primary, dark, outline, ghost }

/// Selectable pill, e.g. the camera style picker and gallery filters.
/// Filter/action chip. An empty [label] with an [icon] gives an icon-only chip.
class CTChip extends StatelessWidget {
  const CTChip(this.label, {super.key, this.selected = false, this.onTap, this.dashed = false, this.icon});

  /// The chip's width for [label] (with the context's text scale), for layouts
  /// that pick between a full and an icon-only chip.
  static double widthOf(BuildContext context, String label, {bool icon = false}) {
    var w = 13.0 * 2 + 1.5 * 2;
    if (icon) w += 15;
    if (icon && label.isNotEmpty) w += 5;
    if (label.isNotEmpty) {
      final tp = TextPainter(
        text: TextSpan(text: label, style: DefaultTextStyle.of(context).style.merge(CT.text(13, weight: FontWeight.w600))),
        textDirection: TextDirection.ltr,
        textScaler: MediaQuery.textScalerOf(context),
        maxLines: 1,
      )..layout();
      w += tp.width;
      tp.dispose();
    }
    return w.ceilToDouble();
  }

  final String label;
  final bool selected;
  final bool dashed;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? CT.ink : CT.paper,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? CT.ink : (dashed ? const Color(0xFFD5D2CB) : CT.line), width: 1.5),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) Icon(icon, size: 15, color: selected ? Colors.white : (dashed ? CT.muted : CT.ink)),
          if (icon != null && label.isNotEmpty) const SizedBox(width: 5),
          if (label.isNotEmpty) Text(label, style: CT.text(13, color: selected ? Colors.white : (dashed ? CT.muted : CT.ink), weight: FontWeight.w600)),
        ]),
      ),
    );
  }
}

/// Two or three equal segments with a sliding white thumb, e.g. the home
/// switch "Albums | Alle foto's".
class CTSegmented<T> extends StatelessWidget {
  const CTSegmented({super.key, required this.segments, required this.selected, required this.onChanged});

  /// Value, label and an optional key for each segment.
  final List<(T, String, Key?)> segments;
  final T selected;
  final ValueChanged<T> onChanged;

  static const track = Color(0xFFEFECE5);

  @override
  Widget build(BuildContext context) {
    final n = segments.length;
    final i = math.max(0, segments.indexWhere((s) => s.$1 == selected));
    return Container(
      height: 40,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(color: track, borderRadius: BorderRadius.circular(12)),
      child: Stack(children: [
        AnimatedAlign(
          alignment: Alignment(n == 1 ? 0 : -1 + 2 * i / (n - 1), 0),
          duration: const Duration(milliseconds: 220),
          curve: CT.transitionCurve,
          child: FractionallySizedBox(
            widthFactor: 1 / n,
            heightFactor: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: CT.paper,
                borderRadius: BorderRadius.circular(9),
                boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 1))],
              ),
            ),
          ),
        ),
        Row(children: [
          for (final (value, label, key) in segments)
            Expanded(
              child: Semantics(
                button: true,
                selected: value == selected,
                child: GestureDetector(
                  key: key,
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onChanged(value),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 160),
                      style: CT.text(14, color: value == selected ? CT.ink : CT.muted, weight: FontWeight.w600, height: 1.2),
                      child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ),
            ),
        ]),
      ]),
    );
  }
}

/// A photo shown as an instant print: white frame, wider bottom, soft shadow.
class InstantPrint extends StatelessWidget {
  const InstantPrint({
    super.key,
    required this.child,
    this.rotation = 0,
    this.padding = 7,
    this.bottom = 28,
    this.caption,
    this.aspectRatio = 1,
  });

  final Widget child;
  final double rotation; // degrees
  final double padding;
  final double bottom;
  final Widget? caption;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation * math.pi / 180,
      child: Container(
        padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
        decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(3), boxShadow: CT.printShadow),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AspectRatio(aspectRatio: aspectRatio, child: ClipRect(child: child)),
          SizedBox(height: bottom, child: caption == null ? null : Align(alignment: AlignmentDirectional.centerStart, child: caption)),
        ]),
      ),
    );
  }
}

/// Deterministic small tilt per photo, so the grid looks hand-laid but stable.
double tiltFor(String id, {double max = 2.5}) {
  final h = id.codeUnits.fold<int>(7, (a, c) => (a * 31 + c) & 0x7fffffff);
  return ((h % 1000) / 1000 * 2 - 1) * max;
}

class NetPhoto extends StatelessWidget {
  const NetPhoto(this.url, {super.key, this.cacheKey, this.fit = BoxFit.cover});
  final String url;
  final String? cacheKey;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      cacheKey: cacheKey, // signed URLs change; the photo id does not
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 180),
      placeholder: (_, _) => Container(color: CT.cream),
      errorWidget: (_, _, _) => Container(color: CT.cream, child: const Icon(Icons.broken_image_outlined, color: CT.muted)),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.initial, required this.color, this.size = 26, this.border = Colors.white});
  final String initial;
  final Color color;
  final double size;
  final Color border;

  factory Avatar.member(Member m, {double size = 26, Color border = Colors.white}) =>
      Avatar(initial: m.initial, color: m.color, size: size, border: border);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: border, width: 2)),
      alignment: Alignment.center,
      child: Text(initial, style: CT.text(size * 0.42, color: Colors.white, weight: FontWeight.w700, height: 1)),
    );
  }
}

class AvatarStack extends StatelessWidget {
  const AvatarStack(this.members, {super.key, this.size = 26, this.max = 6, this.border = CT.bg});
  final List<Member> members;
  final double size;
  final int max;
  final Color border;

  @override
  Widget build(BuildContext context) {
    final shown = members.take(max).toList();
    final extra = members.length - shown.length;
    final overlap = size * 0.3;
    final count = shown.length + (extra > 0 ? 1 : 0);
    return SizedBox(
      height: size,
      width: count == 0 ? 0 : size + (count - 1) * (size - overlap),
      child: Stack(children: [
        for (var i = 0; i < shown.length; i++) PositionedDirectional(start: i * (size - overlap), child: Avatar.member(shown[i], size: size, border: border)),
        if (extra > 0)
          PositionedDirectional(
            start: shown.length * (size - overlap),
            child: Avatar(initial: '+$extra', color: CT.muted, size: size, border: border),
          ),
      ]),
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.only(top: 18, bottom: 6), child: Text(text.toUpperCase(), style: CT.label));
}

class SettingRow extends StatelessWidget {
  const SettingRow({super.key, required this.title, this.subtitle, this.trailing, this.onTap, this.color, this.divider = true});
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? color;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(border: divider ? const Border(bottom: BorderSide(color: Color(0xFFEEEEEE))) : null),
        child: Row(children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: CT.text(15, weight: FontWeight.w500, color: color ?? CT.ink)),
              if (subtitle != null) Text(subtitle!, style: CT.text(12, color: CT.muted)),
            ]),
          ),
          ?trailing,
        ]),
      ),
    );
  }
}

void showMessage(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}

Future<bool> confirm(BuildContext context, {required String title, required String message, String? ok, bool danger = false}) async {
  final l = context.l10n;
  final r = await showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(title, style: CT.title(20)),
      content: Text(message, style: CT.text(15, color: CT.muted)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(c, false), child: Text(l.cancel, style: CT.text(15, color: CT.muted))),
        TextButton(
          onPressed: () => Navigator.pop(c, true),
          child: Text(ok ?? l.yes, style: CT.text(15, color: danger ? CT.accent : CT.ink, weight: FontWeight.w600)),
        ),
      ],
    ),
  );
  return r ?? false;
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.title, required this.message, this.action});
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.photo_camera_outlined, size: 40, color: CT.muted),
          const SizedBox(height: 12),
          Text(title, style: CT.title(22), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          Text(message, style: CT.text(15, color: CT.muted), textAlign: TextAlign.center),
          if (action != null) ...[const SizedBox(height: 20), action!],
        ]),
      ),
    );
  }
}
