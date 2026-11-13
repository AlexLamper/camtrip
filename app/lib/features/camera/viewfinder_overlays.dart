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
