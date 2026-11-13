import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';

/// Rule-of-thirds lines over the viewfinder.
class GridOverlay extends StatelessWidget {
  const GridOverlay({super.key});

  @override
  Widget build(BuildContext context) =>
      const IgnorePointer(child: RepaintBoundary(child: CustomPaint(painter: _ThirdsPainter(), size: Size.infinite)));
}

class _ThirdsPainter extends CustomPainter {
  const _ThirdsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final shadow = Paint()
      ..color = Colors.black.withValues(alpha: 0.18)
      ..strokeWidth = 1.6;
    final line = Paint()
      ..color = Colors.white.withValues(alpha: 0.6)
      ..strokeWidth = 0.8;
    for (final p in [shadow, line]) {
      for (var i = 1; i < 3; i++) {
        final x = size.width * i / 3;
        final y = size.height * i / 3;
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), p);
        canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
      }
    }
  }

  @override
  bool shouldRepaint(_ThirdsPainter oldDelegate) => false;
}

/// "Weinig licht - zet de flits aan" pill at the top of the viewfinder.
/// Tapping it turns the flash on.
class LowLightPill extends StatelessWidget {
  const LowLightPill({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = context.l10n.cameraLowLightHint;
    return Semantics(
      button: true,
      liveRegion: true,
      label: text,
      excludeSemantics: true,
      child: GestureDetector(
        key: const ValueKey('low-light-pill'),
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.62),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.flash_on_rounded, size: 16, color: Color(0xFFFFD60A)),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CT.text(13, color: Colors.white, weight: FontWeight.w600)),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

/// Big self-timer number in the middle of the viewfinder.
class CountdownOverlay extends StatelessWidget {
  const CountdownOverlay({super.key, required this.seconds});
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Semantics(
        liveRegion: true,
        label: '${context.l10n.cameraSettingsTimerSeconds(seconds)}. ${context.l10n.cameraSettingsTimerCancelHint}',
        excludeSemantics: true,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, a) => FadeTransition(
              opacity: a,
              child: ScaleTransition(scale: Tween(begin: 1.4, end: 1.0).animate(a), child: child),
            ),
            child: Text(
              '$seconds',
              key: ValueKey('countdown-$seconds'),
              style: CT.title(96, color: Colors.white).copyWith(
                shadows: const [Shadow(color: Color(0x80000000), blurRadius: 16)],
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The 3:4 photo area, as a rounded card, or inside an instant print (with
/// [caption] on its bottom band) when that style is chosen.
class ViewfinderFrame extends StatelessWidget {
  const ViewfinderFrame({super.key, required this.instant, required this.child, this.caption});
  final bool instant;
  final Widget child;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      final printPadding = instant ? 12.0 : 0.0;
      final bottomBand = instant ? 56.0 : 0.0;
      var photoW = box.maxWidth - printPadding * 2;
      var photoH = photoW * 4 / 3;
      if (photoH + printPadding + bottomBand > box.maxHeight) {
        photoH = box.maxHeight - printPadding - bottomBand;
        photoW = photoH * 3 / 4;
      }
      return Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: EdgeInsets.fromLTRB(printPadding, printPadding, printPadding, bottomBand),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(instant ? 3 : 18),
            boxShadow: instant ? CT.printShadow : null,
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(instant ? 0 : 18),
              child: SizedBox(width: photoW, height: photoH, child: child),
            ),
            if (instant && caption != null)
              Positioned(
                left: 4,
                right: 4,
                bottom: -40,
                child: Text(caption!, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(14, color: CT.muted, weight: FontWeight.w500)),
              ),
          ]),
        ),
      );
    });
  }
}

/// Double-tap on the viewfinder flips the camera; each change of [flips]
/// plays a quick 3D half-turn of the viewfinder card. [onDoubleTap] null
/// (recording, countdown, one camera) leaves out the double-tap recognizer
/// entirely, so single taps inside (focus, the date stamp) are not delayed.
class ViewfinderFlip extends StatefulWidget {
  const ViewfinderFlip({super.key, required this.flips, required this.child, this.onDoubleTap, this.onTap});

  /// Bumped by the screen on every flip; a change starts the animation.
  final int flips;
  final VoidCallback? onDoubleTap;

  /// Single tap (e.g. focus); never a capture.
  final VoidCallback? onTap;
  final Widget child;

  static const duration = Duration(milliseconds: 380);

  @override
  State<ViewfinderFlip> createState() => _ViewfinderFlipState();
}

class _ViewfinderFlipState extends State<ViewfinderFlip> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: ViewfinderFlip.duration, value: 1);

  @override
  void didUpdateWidget(ViewfinderFlip old) {
    super.didUpdateWidget(old);
    if (widget.flips != old.flips) _c.forward(from: 0);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final semantics = context.l10n.cameraFlipHint;
    return Semantics(
      hint: widget.onDoubleTap != null ? semantics : null,
      child: GestureDetector(
        key: const ValueKey('viewfinder-gestures'),
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        onDoubleTap: widget.onDoubleTap,
        child: AnimatedBuilder(
          animation: _c,
          child: widget.child,
          builder: (context, child) {
            final t = Curves.easeInOutCubic.transform(_c.value);
            if (t >= 1) return child!;
            // 0 -> 90 degrees (edge-on, the camera switches), then -90 -> 0.
            final angle = (t < 0.5 ? t : t - 1) * math.pi;
            final scale = 1 - 0.06 * math.sin(t * math.pi);
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0012)
                ..rotateY(angle)
                ..scaleByDouble(scale, scale, 1, 1),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
