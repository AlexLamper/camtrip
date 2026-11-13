import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';

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
/// the shutter row ([last shot] [shutter] [spacer]).
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
  });

  final Widget topBar;
  final Widget viewfinder;
  final Widget controls;
  final Widget? hint;
  final Widget modeSwitch;
  final Widget lastShot;
  final Widget shutter;

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
          const SizedBox(width: sideSlot, height: 84),
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
  const CameraGroupPill({super.key, required this.label, required this.onTap, this.semanticsLabel});
  final String label;
  final VoidCallback onTap;
  final String? semanticsLabel;

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
              const Icon(Icons.circle, size: 8, color: CT.accent),
              const SizedBox(width: 8),
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

/// The last shot as a small tilted print, with the number of shots still
/// uploading. Opens the group.
class LastShotThumb extends StatelessWidget {
  const LastShotThumb({super.key, required this.thumb, required this.pending, this.onTap});
  final Uint8List? thumb;
  final int pending;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const ValueKey('camera-last-shot'),
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: 56,
        height: 60,
        child: Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Transform.rotate(
            angle: -0.1,
            child: Container(
              width: 48,
              height: 54,
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 9),
              decoration: BoxDecoration(color: Colors.white, boxShadow: CT.printShadow, borderRadius: BorderRadius.circular(2)),
              child: thumb == null
                  ? Container(color: CT.cream, child: const Icon(Icons.photo_library_outlined, size: 18, color: CT.muted))
                  : Image.memory(thumb!, fit: BoxFit.cover),
            ),
          ),
          if (pending > 0)
            Positioned(
              right: -2,
              top: -4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(10)),
                child: Text('$pending', style: CT.text(11, color: Colors.white, weight: FontWeight.w700)),
              ),
            ),
        ]),
      ),
    );
  }
}
