import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';
import 'camera_settings.dart';
import 'flash_control.dart';

/// Whether the camera may flip between front and back right now: never while
/// recording, during a self-timer countdown, during a capture or while the
/// previous flip is still starting the camera.
bool canFlipCamera({required int cameras, required bool recording, required bool countingDown, required bool busy, bool switching = false}) =>
    cameras > 1 && !recording && !countingDown && !busy && !switching;

/// The camera a flip goes to: the first one facing the other way, so a phone
/// with several back lenses still flips to the selfie camera. Falls back to
/// the next camera in the list.
int flipTargetIndex(List<CameraDescription> cameras, int current) {
  if (cameras.length < 2) return current;
  final from = cameras[current].lensDirection;
  final want = from == CameraLensDirection.front ? CameraLensDirection.back : CameraLensDirection.front;
  final other = cameras.indexWhere((c) => c.lensDirection == want);
  return other >= 0 ? other : (current + 1) % cameras.length;
}

/// The camera screen from top to bottom: top bar, viewfinder, the controls
/// row ([flash] [current camera] [flip]), an optional hint, FOTO | VIDEO and
/// the shutter row ([last shot] [shutter] [timer]).
class CameraScreenLayout extends StatelessWidget {
  const CameraScreenLayout({
    super.key,
    required this.topBar,
    required this.viewfinder,
    required this.controls,
    required this.modeSwitch,
    required this.lastShot,
    required this.shutter,
    this.hint,
    this.timer,
  });

  final Widget topBar;
  final Widget viewfinder;
  final Widget controls;
  final Widget? hint;
  final Widget modeSwitch;
  final Widget lastShot;
  final Widget shutter;

  /// Right of the shutter, mirroring [lastShot]: the quick self-timer.
  final Widget? timer;

  /// Width of the slots left and right of the shutter, so it stays centred.
  static const sideSlot = 64.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      topBar,
      Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: viewfinder)),
      Padding(padding: const EdgeInsets.fromLTRB(24, 12, 24, 2), child: controls),
      if (hint != null) Padding(padding: const EdgeInsets.fromLTRB(20, 2, 20, 0), child: hint),
      modeSwitch,
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 6),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // The shutter carries a 26pt timer line under its ring; the side
          // slots line up with the ring, not with the whole column.
          SizedBox(width: sideSlot, height: 84, child: Center(child: lastShot)),
          Expanded(child: Center(child: shutter)),
          SizedBox(width: sideSlot, height: 84, child: timer == null ? null : Center(child: timer)),
        ]),
      ),
    ]);
  }
}

/// Close, the group picker in the middle and the "..." settings.
class CameraTopBar extends StatelessWidget {
  const CameraTopBar({super.key, required this.groupPill, required this.onClose, required this.onSettings});
  final Widget groupPill;
  final VoidCallback? onClose;
  final VoidCallback? onSettings;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Row(children: [
        IconButton(key: const ValueKey('camera-close-button'), tooltip: l.close, onPressed: onClose, icon: const Icon(Icons.close)),
        // Centred between the two buttons; shrinks (with an ellipsis) when a
        // long group name leaves less room.
        Expanded(child: Center(child: groupPill)),
        IconButton(
          key: const ValueKey('camera-settings-button'),
          tooltip: l.cameraSettingsMore,
          onPressed: onSettings,
          icon: const Icon(Icons.more_horiz_rounded),
        ),
      ]),
    );
  }
}

/// "● Group · 4 v" in the top bar; opens the group picker. A soft pill without
/// an outline that darkens a little while pressed; uses all the room between
/// close and "...", long names end in an ellipsis.
class CameraGroupPill extends StatefulWidget {
  const CameraGroupPill({super.key, required this.label, required this.onTap, this.semanticsLabel, this.personal = false});
  final String label;
  final VoidCallback onTap;
  final String? semanticsLabel;

  /// Shooting into my personal roll ("Mijn rolletje"): a small lock instead of the dot.
  final bool personal;

  /// Resting and pressed fill.
  static const fill = Color(0x0F1D1D1B);
  static const fillPressed = Color(0x211D1D1B);

  @override
  State<CameraGroupPill> createState() => _CameraGroupPillState();
}

class _CameraGroupPillState extends State<CameraGroupPill> {
  bool _down = false;

  void _set(bool down) {
    if (_down != down) setState(() => _down = down);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.semanticsLabel ?? widget.label,
      excludeSemantics: true,
      child: GestureDetector(
        key: const ValueKey('camera-group-pill'),
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _set(true),
        onTapUp: (_) => _set(false),
        onTapCancel: () => _set(false),
        onTap: widget.onTap,
        child: Container(
          // 44pt tall hit target around the visible pill
          constraints: const BoxConstraints(minHeight: 44),
          alignment: Alignment.center,
          child: AnimatedContainer(
            key: const ValueKey('camera-group-pill-body'),
            duration: const Duration(milliseconds: 120),
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.fromLTRB(14, 8, 10, 8),
            decoration: BoxDecoration(
              color: _down ? CameraGroupPill.fillPressed : CameraGroupPill.fill,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              if (widget.personal)
                const Icon(Icons.lock_person_outlined, key: ValueKey('camera-group-pill-personal'), size: 16, color: CT.ink)
              else
                const Icon(Icons.circle, size: 8, color: CT.accent),
              SizedBox(width: widget.personal ? 6 : 8),
              Flexible(
                child: Text(widget.label, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(14, weight: FontWeight.w600, height: 1.2)),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.expand_more_rounded, size: 20, color: CT.muted),
            ]),
          ),
        ),
      ),
    );
  }
}

/// [flash] [current camera] [flip]: equal slots on both sides, so the camera
/// selector sits exactly in the middle.
class CameraControlsRow extends StatelessWidget {
  const CameraControlsRow({super.key, required this.flash, required this.selector, required this.flip});
  final Widget flash;
  final Widget selector;
  final Widget flip;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: CameraScreenLayout.sideSlot, child: Center(child: flash)),
      Expanded(child: Center(child: selector)),
      SizedBox(width: CameraScreenLayout.sideSlot, child: Center(child: flip)),
    ]);
  }
}

/// Borderless 48pt round button that flips between the front and back
/// camera. The icon turns half a turn with each flip.
class CameraFlipButton extends StatelessWidget {
  const CameraFlipButton({super.key, required this.front, required this.onPressed});

  /// The selfie camera is showing.
  final bool front;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final enabled = onPressed != null;
    return Tooltip(
      message: l.cameraFlip,
      triggerMode: TooltipTriggerMode.longPress,
      child: Semantics(
        button: true,
        enabled: enabled,
        label: l.cameraFlip,
        excludeSemantics: true,
        child: InkResponse(
          key: const ValueKey('camera-flip-button'),
          onTap: onPressed,
          radius: 26,
          child: SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: AnimatedRotation(
                turns: front ? 0.5 : 0,
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeOutCubic,
                child: Icon(Icons.cameraswitch_rounded, size: 26, color: enabled ? CT.ink : CT.muted.withValues(alpha: 0.6)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// One picture the last-shot thumb could show: the shot just taken, one still
/// in the upload queue, or the newest one from the gallery.
@immutable
class LastShotCandidate {
  const LastShotCandidate({required this.image, required this.takenAt, this.local = false});
  final ImageProvider image;
  final DateTime takenAt;

  /// On this phone (processor output or upload-queue file). Wins a near tie
  /// with the uploaded copy of the same shot, so the thumb does not reload.
  final bool local;
}

/// The newest of [candidates], or null when there is none (empty state).
LastShotCandidate? newestShot(Iterable<LastShotCandidate?> candidates) {
  LastShotCandidate? best;
  DateTime rank(LastShotCandidate c) => c.local ? c.takenAt.add(const Duration(seconds: 2)) : c.takenAt;
  for (final c in candidates) {
    if (c == null) continue;
    if (best == null || rank(c).isAfter(rank(best))) best = c;
  }
  return best;
}

/// The last shot as a small tilted print, with the number of shots still
/// uploading. Shows [image] (the newest photo of the group) or, when there is
/// none, an empty print with a gallery icon. Each new [shotKey] (a capture)
/// pops the print. Opens the group.
class LastShotThumb extends StatefulWidget {
  const LastShotThumb({super.key, this.image, this.thumb, required this.pending, this.onTap, this.shotKey, this.semanticsLabel});

  final ImageProvider? image;

  /// Raw JPEG bytes; used when [image] is null.
  final Uint8List? thumb;
  final int pending;
  final VoidCallback? onTap;

  /// Changes with every capture; the print pops when it does.
  final Object? shotKey;
  final String? semanticsLabel;

  @override
  State<LastShotThumb> createState() => _LastShotThumbState();
}

class _LastShotThumbState extends State<LastShotThumb> with SingleTickerProviderStateMixin {
  late final AnimationController _pop = AnimationController(vsync: this, duration: const Duration(milliseconds: 380), value: 1);
  late final Animation<double> _scale = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 0.55, end: 1.12).chain(CurveTween(curve: Curves.easeOutCubic)), weight: 55),
    TweenSequenceItem(tween: Tween(begin: 1.12, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 45),
  ]).animate(_pop);

  @override
  void didUpdateWidget(LastShotThumb old) {
    super.didUpdateWidget(old);
    if (widget.shotKey != null && widget.shotKey != old.shotKey) _pop.forward(from: 0);
  }

  @override
  void dispose() {
    _pop.dispose();
    super.dispose();
  }

  ImageProvider? get _provider => widget.image ?? (widget.thumb == null ? null : MemoryImage(widget.thumb!));

  static Widget _empty() => Container(
        key: const ValueKey('camera-last-shot-empty'),
        color: CT.cream,
        child: const Icon(Icons.photo_library_outlined, size: 18, color: CT.muted),
      );

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = _provider;
    return Semantics(
      button: widget.onTap != null,
      label: widget.semanticsLabel ?? (provider == null ? l.cameraLastShotEmpty : l.cameraLastShotOpen),
      excludeSemantics: true,
      child: GestureDetector(
        key: const ValueKey('camera-last-shot'),
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: SizedBox(
          width: 56,
          height: 60,
          child: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
            ScaleTransition(
              scale: _scale,
              child: Transform.rotate(
                angle: -0.1,
                child: Container(
                  width: 48,
                  height: 54,
                  padding: const EdgeInsets.fromLTRB(3, 3, 3, 9),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: CT.printShadow, borderRadius: BorderRadius.circular(2)),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    layoutBuilder: (current, previous) => Stack(fit: StackFit.expand, children: [...previous, ?current]),
                    child: provider == null
                        ? _empty()
                        : Image(
                            key: ValueKey(provider),
                            image: provider,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                            // cream while it loads, the empty print when it cannot
                            frameBuilder: (_, child, frame, sync) => sync || frame != null ? child : const ColoredBox(color: CT.cream),
                            errorBuilder: (_, _, _) => _empty(),
                          ),
                  ),
                ),
              ),
            ),
            if (widget.pending > 0)
              Positioned(
                right: -2,
                top: -4,
                child: Container(
                  key: const ValueKey('camera-last-shot-pending'),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(10)),
                  child: Text('${widget.pending}', style: CT.text(11, color: Colors.white, weight: FontWeight.w700)),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}

/// The quick self-timer cycles Off -> 3 s -> 10 s -> Off, the same choice as
/// "Zelfontspanner" in the "..." sheet.
ShutterTimer nextQuickTimer(ShutterTimer t) => switch (t) {
      ShutterTimer.off => ShutterTimer.three,
      ShutterTimer.three => ShutterTimer.ten,
      ShutterTimer.ten => ShutterTimer.off,
    };

/// Borderless 48pt self-timer button right of the shutter. A timer icon,
/// amber with a small "3" / "10" badge while a timer is set.
class CameraTimerButton extends StatelessWidget {
  const CameraTimerButton({super.key, required this.timer, required this.onPressed});
  final ShutterTimer timer;
  final VoidCallback? onPressed;

  /// Icon and badge colour while a timer is set (the flash's amber).
  static const active = FlashColors.on;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final enabled = onPressed != null;
    final on = timer != ShutterTimer.off;
    final state = on ? l.cameraSettingsTimerSeconds(timer.seconds) : l.cameraSettingsTimerOff;
    final fg = !enabled ? CT.muted.withValues(alpha: 0.6) : (on ? active : CT.ink);
    return Tooltip(
      message: l.cameraSettingsTimer,
      triggerMode: TooltipTriggerMode.longPress,
      child: Semantics(
        button: true,
        enabled: enabled,
        label: l.cameraTimerButton(state),
        hint: enabled ? l.cameraTimerCycleHint : null,
        excludeSemantics: true,
        child: InkResponse(
          key: const ValueKey('camera-timer-button'),
          onTap: onPressed,
          radius: 26,
          child: SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: on && enabled ? FlashColors.onFill : Colors.transparent, shape: BoxShape.circle),
                child: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
                  Icon(on ? Icons.timer_rounded : Icons.timer_outlined, key: ValueKey('camera-timer-icon-${timer.name}'), size: 24, color: fg),
                  if (on)
                    Positioned(
                      right: -3,
                      bottom: -1,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 160),
                        transitionBuilder: (child, a) => ScaleTransition(scale: a, child: child),
                        child: Container(
                          key: ValueKey('camera-timer-badge-${timer.seconds}'),
                          constraints: const BoxConstraints(minWidth: 16),
                          height: 16,
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: fg, borderRadius: BorderRadius.circular(8), border: Border.all(color: CT.bg, width: 1.5)),
                          child: Text('${timer.seconds}', style: CT.text(9.5, color: Colors.white, weight: FontWeight.w800, height: 1)),
                        ),
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
