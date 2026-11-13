import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import 'trip_location.dart';
import 'trip_map_controller.dart';

/// "Reiskaart" in the group settings: admins switch the map on or off for the
/// group (default off); while it is on, every member can change their answer
/// to "Deel waar je foto's gemaakt zijn ...?".
class TripMapSettingsSection extends ConsumerStatefulWidget {
  const TripMapSettingsSection({super.key, required this.group});
  final Group group;

  @override
  ConsumerState<TripMapSettingsSection> createState() => _TripMapSettingsSectionState();
}

class _TripMapSettingsSectionState extends ConsumerState<TripMapSettingsSection> {
  bool _busy = false;

  Future<void> _run(Future<void> Function() fn) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await fn();
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _setEnabled(bool on) async {
    final l = context.l10n;
    if (!on && !await confirm(context, title: l.tripMapDisableTitle, message: l.tripMapDisableMessage, ok: l.tripMapDisable, danger: true)) {
      return;
    }
    await _run(() => ref.read(tripMapActionsProvider).setEnabled(widget.group.id, on));
  }

  Future<void> _setSharing(bool on) async {
    final l = context.l10n;
    if (!on &&
        !await confirm(context, title: l.tripMapStopSharingTitle, message: l.tripMapStopSharingMessage, ok: l.tripMapStopSharing, danger: true)) {
      return;
    }
    if (!mounted) return;
    await _run(() => setTripMapConsent(context, ref, widget.group.id, on));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final g = widget.group;
    final tm = g.tripMap;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SectionLabel(l.tripMapTitle),
      if (g.isAdmin)
        SettingRow(
          title: l.tripMapTitle,
          subtitle: l.tripMapSettingSubtitle,
          trailing: Switch(key: const Key('tripmap-enabled'), value: tm.enabled, onChanged: _busy ? null : _setEnabled),
        ),
      if (tm.enabled)
        SettingRow(
          title: l.tripMapMySharing,
          subtitle: tm.myConsent == true ? l.tripMapMySharingOn : l.tripMapMySharingOff,
          trailing: Switch(key: const Key('tripmap-sharing'), value: tm.myConsent == true, onChanged: _busy ? null : _setSharing),
        ),
    ]);
  }
}
