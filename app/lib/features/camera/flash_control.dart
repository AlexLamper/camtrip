import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';

/// The flash choice next to the camera selector. Cycles Off -> On -> Auto -> Off.
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

/// Flash colours, public so tests can check them.
class FlashColors {
  FlashColors._();

  /// Bolt when the flash is on: amber, dark enough to read on the cream page.
  static const on = Color(0xFFE29A00);

  /// Soft amber disc behind the bolt when on. A fill, never an outline.
  static const onFill = Color(0x33FFC53D);
}

/// Borderless 48pt flash button next to the camera selector. The icon shows
/// the state: a slashed bolt (off), an amber bolt on a soft amber disc (on),
/// a bolt with an "A" (auto). [hasFlash] false greys it out with a tooltip
/// explaining why.
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
    final fg = active ? FlashColors.on : (enabled ? CT.ink : CT.muted.withValues(alpha: 0.6));
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
          child: SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: AnimatedContainer(
                key: const ValueKey('flash-disc'),
                duration: const Duration(milliseconds: 180),
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: active ? FlashColors.onFill : Colors.transparent, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 160),
                  transitionBuilder: (child, a) => ScaleTransition(scale: Tween(begin: 0.7, end: 1.0).animate(a), child: FadeTransition(opacity: a, child: child)),
                  child: Icon(
                    hasFlash ? setting.icon : Icons.flash_off_rounded,
                    key: ValueKey('flash-icon-${hasFlash ? setting.name : 'none'}'),
                    size: 26,
                    color: fg,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
