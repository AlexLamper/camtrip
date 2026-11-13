import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../groups/groups_controller.dart';
import '../upload/upload_queue.dart';
import 'premium_controller.dart';

/// Why the paywall opened. It changes the header, and whether the Trip Pass
/// is offered (only with a group to buy it for).
enum PaywallReason {
  /// Settings, the Pro badge, ...: no special context.
  general('general'),

  /// The free roll (24 per person per trip) is full.
  rollFull('roll_full'),

  /// A Pro camera was picked.
  camera('camera'),

  /// A recap without watermark.
  watermark('watermark'),

  /// The free trip is about to be deleted.
  deletion('deletion');

  const PaywallReason(this.id);
  final String id;

  static PaywallReason parse(String? id) => values.firstWhere((r) => r.id == id, orElse: () => general);
}

/// The paywall's route, e.g. /pro?reason=roll_full&group=abc.
String paywallLocation({PaywallReason reason = PaywallReason.general, String? groupId}) {
  final query = {
    if (reason != PaywallReason.general) 'reason': reason.id,
    'group': ?groupId,
  };
  return Uri(path: '/pro', queryParameters: query.isEmpty ? null : query).toString();
}

/// Opens the paywall for [reason] in [group] (if any).
Future<void> openPaywall(BuildContext context, {PaywallReason reason = PaywallReason.general, Group? group}) =>
    context.push(paywallLocation(reason: reason, groupId: group?.id));

/// My free roll in one group: [used] of [limit] shots.
class RollState {
  const RollState({required this.used, required this.limit});
  final int used;
  final int limit;

  bool get full => used >= limit;

  /// From 20 of 24 the counter turns orange.
  bool get almostFull => used >= limit - 4;
  int get left => (limit - used).clamp(0, limit);
}

/// Computes the roll from the group (as last loaded), the newest count the
/// upload queue heard from the server, and shots still waiting in the queue
/// without a reservation. Pure, for tests.
RollState? computeRoll({
  required Group? group,
  required bool unlocked,
  required List<UploadItem> queue,
  RollSeen? seen,
}) {
  if (group == null || unlocked) return null;
  var limit = group.rollLimit;
  var used = group.rollUsed;
  if (seen != null && seen.at.isAfter(group.fetchedAt)) {
    // The server answered an upload after this group was loaded.
    if (seen.limit == null) return null; // e.g. someone bought a Trip Pass meanwhile
    limit = seen.limit;
    used = seen.used;
  }
  if (limit == null) return null;
  // Shots taken but not reserved yet (offline, waiting for wifi) use the roll too.
  final unreserved = queue
      .where((i) => group.isId(i.groupId) && i.photoId == null && i.status != UploadStatus.held)
      .length;
  return RollState(used: used + unreserved, limit: limit);
}

/// My roll in the group with app id [groupId]; null = no limit (Pro, Pro group, Trip Pass).
final rollProvider = Provider.family<RollState?, String>((ref, groupId) {
  final group = ref.watch(groupProvider(groupId));
  final queue = ref.watch(uploadQueueProvider);
  final notifier = ref.read(uploadQueueProvider.notifier);
  final seen = group == null ? null : (notifier.rollSeen[group.id] ?? notifier.rollSeen[group.serverId]);
  final unlocked = ref.watch(isProProvider) || (group?.isProGroup ?? false);
  return computeRoll(group: group, unlocked: unlocked, queue: queue, seen: seen);
});

/// "18/24": the free roll counter in the camera. Orange from 20 shots.
class RollCounterPill extends StatelessWidget {
  const RollCounterPill({super.key, required this.roll, this.onTap});
  final RollState roll;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final warn = roll.almostFull;
    final color = warn ? CT.warn : CT.muted;
    return Semantics(
      label: context.l10n.rollCounterSemantics(roll.used.clamp(0, roll.limit), roll.limit),
      button: onTap != null,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          key: const ValueKey('roll-counter'),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
          decoration: BoxDecoration(
            color: warn ? CT.warnBg : CT.paper,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: warn ? CT.warn : CT.line, width: 1.2),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.camera_roll_outlined, size: 13, color: color),
            const SizedBox(width: 4),
            Text('${roll.used.clamp(0, roll.limit)}/${roll.limit}',
                style: CT.text(12, color: warn ? CT.warn : CT.ink, weight: FontWeight.w700, height: 1.2)),
          ]),
        ),
      ),
    );
  }
}

/// Whole days until a free trip is deleted, or null when that is more than
/// [window] away (or it is not going to be deleted). At least 1 while it exists.
int? daysUntilDeletion(Group group, {DateTime? now, int window = 7}) {
  final until = group.deleteAfter;
  if (until == null || group.isProGroup || group.isPersonal) return null;
  final left = until.difference(now ?? DateTime.now());
  if (left.isNegative || left > Duration(days: window)) return null;
  return (left.inHours / 24).ceil().clamp(1, window);
}

/// A gentle card that leads to the paywall: "Bewaar je reis - nog 7 dagen",
/// or "3 foto's passen niet meer op je rolletje".
class PaywallNudge extends StatelessWidget {
  const PaywallNudge({super.key, required this.icon, required this.title, required this.body, required this.onTap});
  final IconData icon;
  final String title;
  final String body;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
          decoration: BoxDecoration(color: CT.warnBg, borderRadius: BorderRadius.circular(14), border: Border.all(color: CT.warn, width: 1.2)),
          child: Row(children: [
            Icon(icon, color: CT.warn, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: CT.text(14, weight: FontWeight.w700, height: 1.25)),
                const SizedBox(height: 1),
                Text(body, style: CT.text(12.5, color: CT.muted, height: 1.3)),
              ]),
            ),
            const Icon(Icons.chevron_right_rounded, color: CT.muted),
          ]),
        ),
      ),
    );
  }
}
