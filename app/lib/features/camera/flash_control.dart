import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';

/// The flash choice in the top bar. Cycles Off -> On -> Auto -> Off.
enum FlashSetting {
  off,
  on,
  auto;

  FlashSetting get next => switch (this) { off => on, on => auto, auto => off };

  IconData get icon => switch (this) { off => Icons.flash_off_rounded, on => Icons.flash_on_rounded, auto => Icons.flash_auto_rounded };

  String label(AppLocalizations l) => switch (this) { off => l.flashOff, on => l.flashOn, auto => l.flashAuto };

  /// The controller's flash mode. Video has no "auto" flash: "on" lights the
  /// torch for the whole clip.
  FlashMode controllerMode({required bool video}) => video
      ? (this == on ? FlashMode.torch : FlashMode.off)
      : switch (this) { off => FlashMode.off, on => FlashMode.always, auto => FlashMode.auto };

  /// Whether a front-camera photo should get the white screen flash.
  bool wantsScreenFlash({required bool lowLight}) => this == on || (this == auto && lowLight);
}

/// Remembered while the app runs, not across launches: a flash left on from
/// last night's party should not fire at breakfast.
class FlashSession {
  FlashSession._();
  static FlashSetting? current;
}

/// Round 44pt flash button: icon plus short state label ("Aan" / "Uit" / "Auto").
/// [hasFlash] false greys it out with a tooltip explaining why.
class FlashButton extends StatelessWidget {
  const FlashButton({super.key, required this.setting, required this.onPressed, this.hasFlash = true, this.screenFlash = false});

  final FlashSetting setting;
  final VoidCallback? onPressed;
  final bool hasFlash;

  /// Front camera: the button drives the white screen flash.
  final bool screenFlash;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final enabled = hasFlash && onPressed != null;
    final active = enabled && setting == FlashSetting.on;
    final fg = enabled ? CT.ink : CT.muted;
    final tooltip = !hasFlash ? l.cameraFlashUnavailable : (screenFlash ? l.cameraFlashScreen : l.flash);
    final state = hasFlash ? setting.label(l) : l.flashOff;
    return Tooltip(
      message: tooltip,
      triggerMode: enabled ? TooltipTriggerMode.longPress : TooltipTriggerMode.tap,
      child: Semantics(
        button: true,
        enabled: enabled,
        label: '${l.flash}: $state',
        hint: enabled ? l.cameraFlashCycleHint : tooltip,
        excludeSemantics: true,
        child: InkResponse(
          key: const ValueKey('flash-button'),
          onTap: enabled ? onPressed : null,
          radius: 26,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                decoration: BoxDecoration(
                  color: active ? const Color(0xFFFFD60A) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: active ? const Color(0xFFFFD60A) : fg.withValues(alpha: enabled ? 0.9 : 0.4), width: 1.5),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(hasFlash ? setting.icon : Icons.flash_off_rounded, size: 18, color: fg),
                  const SizedBox(width: 3),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 52),
                    child: Text(state,
                        key: const ValueKey('flash-label'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CT.text(12, weight: FontWeight.w700, color: fg)),
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
