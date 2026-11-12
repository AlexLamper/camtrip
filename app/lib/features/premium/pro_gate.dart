import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import '../groups/groups_controller.dart';
import 'premium_controller.dart';

/// Pro gating for one group: my own Pro OR the group's Pro.
/// One Pro in the group = Pro for everyone in that group (the server decides
/// which groups are Pro; see Group.isProGroup).
class ProGate {
  const ProGate({required this.personal, this.group});

  /// My own Pro (subscription, gift from CamTrip or admin).
  final bool personal;

  /// The group the feature is used in, if any.
  final Group? group;

  bool get unlocked => personal || (group?.isProGroup ?? false);

  /// Unlocked only because someone else in the group has Pro.
  bool get viaGroup => !personal && (group?.isProGroup ?? false);

  /// Whether a camera style can be used here.
  bool canUseStyle({required bool styleIsPro}) => !styleIsPro || unlocked;

  /// Original quality downloads and a recap without watermark.
  bool get originalQuality => unlocked;
  bool get watermark => !unlocked;

  /// "Pro via Sanne" when the group's Pro comes from another member, else null.
  String? get viaLabel {
    if (!viaGroup) return null;
    final name = group?.proByName?.trim();
    return name == null || name.isEmpty ? 'Pro via de groep' : 'Pro via $name';
  }

  /// Short hint shown under the camera styles when a Pro style is unlocked by the group.
  String? get cameraHint {
    final via = viaLabel;
    if (via == null) return null;
    final name = group?.proByName?.trim();
    return name == null || name.isEmpty
        ? 'Pro-stijlen in deze groep zijn gratis voor jou dankzij een Pro-lid'
        : 'Pro-stijlen in deze groep: gratis voor jou dankzij $name';
  }
}

/// Gate for a group by id (looked up in the loaded groups).
final proGateProvider = Provider.family<ProGate, String?>((ref, groupId) {
  final personal = ref.watch(isProProvider);
  if (groupId == null) return ProGate(personal: personal);
  return ProGate(personal: personal, group: ref.watch(groupProvider(groupId)));
});

/// Gate for the group the camera shoots into.
final activeProGateProvider = Provider<ProGate>((ref) {
  return ProGate(personal: ref.watch(isProProvider), group: ref.watch(activeGroupProvider));
});
