import 'package:flutter/material.dart';

import '../../core/theme.dart';

/// Shutter colours, public so tests can check them.
class ShutterColors {
  ShutterColors._();

  /// Photo mode: classic black disc (the theme's ink).
  static const photo = CT.ink;

  /// Video mode and the recording stop square.
  static const video = CT.accent;

  static const ring = CT.paper;
}

/// The camera's shutter. Photo mode: an ink disc inside a white ring. Video
/// mode: a red disc, which morphs into a red rounded stop square while
/// recording. All state changes animate implicitly.
class ShutterButton extends StatelessWidget {
  const ShutterButton({
    super.key,
    required this.videoMode,
    required this.recording,
    required this.busy,
    this.elapsed = Duration.zero,
    this.onTap,
  });

  final bool videoMode;
  final bool recording;
  final bool busy;
  final Duration elapsed;
  final VoidCallback? onTap;

  static const _dur = Duration(milliseconds: 200);
  static const _outer = 84.0;
  static const _disc = 64.0;
  static const _stop = 32.0;

  static String formatElapsed(Duration d) => '${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final inner = videoMode ? ShutterColors.video : ShutterColors.photo;
    final size = recording ? _stop : _disc;
    final label = recording ? 'Stop opname' : (videoMode ? 'Start video-opname' : 'Maak foto');
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              key: const ValueKey('shutter-ring'),
              width: _outer,
              height: _outer,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ShutterColors.ring,
                border: Border.all(color: CT.ink, width: 3),
                boxShadow: CT.cardShadow,
              ),
              alignment: Alignment.center,
              child: AnimatedContainer(
                key: const ValueKey('shutter-disc'),
                duration: _dur,
                curve: Curves.easeOutCubic,
                width: size,
                height: size,
                decoration: BoxDecoration(color: inner, borderRadius: BorderRadius.circular(recording ? 8 : _disc / 2)),
                alignment: Alignment.center,
                // Only mounted while busy, so no spinner ticks in the background.
                child: AnimatedSwitcher(
                  duration: _dur,
                  child: busy && !recording
                      ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                      : const SizedBox.shrink(),
                ),
              ),
            ),
            // Fixed height so the row does not jump when the timer appears.
            SizedBox(
              height: 26,
              child: AnimatedOpacity(
                duration: _dur,
                opacity: recording ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(color: ShutterColors.video, borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      formatElapsed(elapsed),
                      key: const ValueKey('shutter-timer'),
                      style: CT
                          .text(12, color: Colors.white, weight: FontWeight.w700, height: 1.3)
                          .copyWith(fontFeatures: const [FontFeature.tabularFigures()]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// iOS-style "FOTO  VIDEO" mode switch shown above the shutter.
class CameraModeSwitch extends StatelessWidget {
  const CameraModeSwitch({super.key, required this.videoMode, required this.onChanged, this.enabled = true});

  final bool videoMode;
  final ValueChanged<bool> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    Widget item(String text, bool video) {
      final selected = videoMode == video;
      return Semantics(
        button: true,
        selected: selected,
        label: video ? 'Video' : 'Foto',
        excludeSemantics: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: enabled && !selected ? () => onChanged(video) : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 72, minHeight: 44),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: CT
                    .text(13, weight: FontWeight.w700, color: selected ? (video ? ShutterColors.video : CT.ink) : CT.muted)
                    .copyWith(letterSpacing: 1.2),
                child: Text(text),
              ),
            ),
          ),
        ),
      );
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: enabled ? 1 : 0.4,
      child: Row(mainAxisSize: MainAxisSize.min, children: [item('FOTO', false), item('VIDEO', true)]),
    );
  }
}
