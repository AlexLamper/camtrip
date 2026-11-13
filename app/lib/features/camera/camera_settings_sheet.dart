import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';
import 'camera_settings.dart';

/// Opens the camera's "..." settings as an iOS-style grouped bottom sheet.
/// Every change is saved right away through [store] and reported to
/// [onChanged].
Future<void> showCameraSettingsSheet(
  BuildContext context, {
  required CameraSettingsStore store,
  required CameraSettings settings,
  required ValueChanged<CameraSettings> onChanged,
}) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CameraSettingsSheet(store: store, initial: settings, onChanged: onChanged),
    );

class CameraSettingsSheet extends StatefulWidget {
  const CameraSettingsSheet({super.key, required this.store, required this.initial, required this.onChanged});

  final CameraSettingsStore store;
  final CameraSettings initial;
  final ValueChanged<CameraSettings> onChanged;

  @override
  State<CameraSettingsSheet> createState() => _CameraSettingsSheetState();
}

class _CameraSettingsSheetState extends State<CameraSettingsSheet> {
  late CameraSettings _s = widget.initial;

  void _set(CameraSettings next) {
    if (next == _s) return;
    HapticFeedback.selectionClick();
    setState(() => _s = next);
    widget.store.write(next);
    widget.onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final maxH = MediaQuery.sizeOf(context).height * 0.85;
    return Container(
      constraints: BoxConstraints(maxHeight: maxH),
      decoration: const BoxDecoration(
        color: Color(0xFFF2F1EC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: SafeArea(
        top: false,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 5,
            decoration: BoxDecoration(color: CT.muted.withValues(alpha: 0.35), borderRadius: BorderRadius.circular(3)),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 8, 4),
            child: Row(children: [
              Expanded(child: Semantics(header: true, child: Text(l.cameraSettingsTitle, style: CT.title(20)))),
              IconButton(
                tooltip: l.close,
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.close_rounded),
                constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
              ),
            ]),
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              children: [
                _Group(children: [
                  _SwitchRow(
                    key: const ValueKey('cam-setting-grid'),
                    icon: Icons.grid_3x3_rounded,
                    label: l.cameraSettingsGrid,
                    value: _s.grid,
                    onChanged: (v) => _set(_s.copyWith(grid: v)),
                  ),
                  _SwitchRow(
                    key: const ValueKey('cam-setting-stamp'),
                    icon: Icons.date_range_rounded,
                    label: l.cameraSettingsDateStamp,
                    value: _s.dateStamp,
                    onChanged: (v) => _set(_s.copyWith(dateStamp: v)),
                  ),
                  _SwitchRow(
                    key: const ValueKey('cam-setting-mirror'),
                    icon: Icons.flip_rounded,
                    label: l.cameraSettingsMirror,
                    value: _s.mirrorSelfies,
                    onChanged: (v) => _set(_s.copyWith(mirrorSelfies: v)),
                  ),
                ]),
                _Group(children: [
                  _SwitchRow(
                    key: const ValueKey('cam-setting-haptics'),
                    icon: Icons.vibration_rounded,
                    label: l.cameraSettingsHaptics,
                    value: _s.haptics,
                    onChanged: (v) => _set(_s.copyWith(haptics: v)),
                  ),
                  _SwitchRow(
                    key: const ValueKey('cam-setting-sound'),
                    icon: Icons.volume_up_rounded,
                    label: l.cameraSettingsSound,
                    subtitle: l.cameraSettingsSoundHint,
                    value: _s.sound,
                    onChanged: (v) => _set(_s.copyWith(sound: v)),
                  ),
                ]),
                _Group(children: [
                  _SegmentRow<ShutterTimer>(
                    key: const ValueKey('cam-setting-timer'),
                    icon: Icons.timer_outlined,
                    label: l.cameraSettingsTimer,
                    value: _s.timer,
                    options: {
                      ShutterTimer.off: l.cameraSettingsTimerOff,
                      ShutterTimer.three: l.cameraSettingsTimerSeconds(3),
                      ShutterTimer.ten: l.cameraSettingsTimerSeconds(10),
                    },
                    onChanged: (v) => _set(_s.copyWith(timer: v)),
                  ),
                  _SegmentRow<CaptureQuality>(
                    key: const ValueKey('cam-setting-quality'),
                    icon: Icons.high_quality_outlined,
                    label: l.cameraSettingsQuality,
                    value: _s.quality,
                    options: {
                      CaptureQuality.standard: l.cameraSettingsQualityStandard,
                      CaptureQuality.high: l.cameraSettingsQualityHigh,
                    },
                    onChanged: (v) => _set(_s.copyWith(quality: v)),
                  ),
                ]),
                _Group(children: [
                  _SwitchRow(
                    key: const ValueKey('cam-setting-roll'),
                    icon: Icons.photo_library_outlined,
                    label: l.cameraSettingsSaveToRoll,
                    value: _s.saveToRoll,
                    onChanged: (v) => _set(_s.copyWith(saveToRoll: v)),
                  ),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

/// White rounded card with hairline separators, like iOS inset-grouped lists.
class _Group extends StatelessWidget {
  const _Group({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) rows.add(const Divider(height: 1, thickness: 0.5, indent: 52, color: CT.line));
      rows.add(children[i]);
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      child: Column(mainAxisSize: MainAxisSize.min, children: rows),
    );
  }
}

class _RowIcon extends StatelessWidget {
  const _RowIcon(this.icon);
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(color: CT.cream, borderRadius: BorderRadius.circular(7)),
        child: Icon(icon, size: 17, color: CT.ink),
      );
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({super.key, required this.icon, required this.label, required this.value, required this.onChanged, this.subtitle});

  final IconData icon;
  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: InkWell(
        onTap: () => onChanged(!value),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 52),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Row(children: [
              _RowIcon(icon),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Text(label, style: CT.text(15, weight: FontWeight.w500)),
                  if (subtitle != null) Text(subtitle!, style: CT.text(12, color: CT.muted)),
                ]),
              ),
              const SizedBox(width: 8),
              CupertinoSwitch(value: value, activeTrackColor: CT.success, onChanged: onChanged),
            ]),
          ),
        ),
      ),
    );
  }
}

class _SegmentRow<T extends Object> extends StatelessWidget {
  const _SegmentRow({super.key, required this.icon, required this.label, required this.value, required this.options, required this.onChanged});

  final IconData icon;
  final String label;
  final T value;
  final Map<T, String> options;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          _RowIcon(icon),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: CT.text(15, weight: FontWeight.w500))),
        ]),
        const SizedBox(height: 10),
        Semantics(
          label: label,
          container: true,
          child: CupertinoSlidingSegmentedControl<T>(
            groupValue: value,
            onValueChanged: (v) {
              if (v != null) onChanged(v);
            },
            children: {
              for (final e in options.entries)
                e.key: Semantics(
                  button: true,
                  selected: e.key == value,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 36),
                    child: Center(
                      child: Text(e.value,
                          key: ValueKey('segment-${e.key}'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CT.text(13, weight: e.key == value ? FontWeight.w700 : FontWeight.w500)),
                    ),
                  ),
                ),
            },
          ),
        ),
      ]),
    );
  }
}
