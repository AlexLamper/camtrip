import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme.dart';
import 'pro_gate.dart';

/// Small "Pro via Sanne" pill for a group header. Only shown when the group is
/// Pro thanks to another member (not my own Pro). Tapping explains the rule.
class ProViaBadge extends ConsumerWidget {
  const ProViaBadge(this.groupId, {super.key});
  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final label = ref.watch(proGateProvider(groupId)).viaLabel;
    if (label == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: GestureDetector(
        onTap: () => context.push('/pro'),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(color: CT.cream, borderRadius: BorderRadius.circular(20)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.star_rounded, size: 14, color: CT.accent),
            const SizedBox(width: 4),
            Text(label, style: CT.text(12, weight: FontWeight.w600)),
          ]),
        ),
      ),
    );
  }
}
