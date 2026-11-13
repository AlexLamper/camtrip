import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../camera/styles.dart';
import 'group_actions.dart';
import 'groups_controller.dart';

class GroupSettingsScreen extends ConsumerWidget {
  const GroupSettingsScreen({super.key, required this.groupId});
  final String groupId;

  Future<void> _run(BuildContext context, Future<void> Function() fn) async {
    try {
      await fn();
    } on ApiException catch (e) {
      if (context.mounted) showMessage(context, e.message);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = ref.watch(groupProvider(groupId));
    final me = ref.watch(authProvider).value?.id;
    final blocked = ref.watch(authProvider).value?.blockedUserIds ?? const <String>[];
    if (g == null) return Scaffold(appBar: AppBar());
    final ctrl = ref.read(groupsProvider.notifier);
    final l = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l.group)),
      body: ListView(padding: const EdgeInsets.fromLTRB(22, 0, 22, 40), children: [
        Text(g.name, style: CT.title(28)),
        const SizedBox(height: 4),
        Text(
          [
            switch (g.type) { GroupType.vacation => l.groupTypeVacation, GroupType.event => l.groupTypeEvent, GroupType.permanent => l.groupTypePermanent },
            if (g.startDate != null) Fmt.range(g.startDate, g.endDate),
            l.groupCode(g.code),
          ].join(' · '),
          style: CT.text(14, color: CT.muted),
        ),
        if (g.isAdmin) ...[
          SectionLabel(l.manage),
          SettingRow(
            title: l.rename,
            trailing: const Icon(Icons.chevron_right),
            subtitle: g.name,
            onTap: () => GroupActions.rename(context, ref, g),
          ),
          if (g.type != GroupType.permanent)
            SettingRow(
              title: l.changeDates,
              subtitle: Fmt.range(g.startDate, g.endDate),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final now = DateTime.now();
                final r = await showDateRangePicker(
                  context: context,
                  firstDate: now.subtract(const Duration(days: 365)),
                  lastDate: now.add(const Duration(days: 730)),
                  initialDateRange: g.startDate != null && g.endDate != null ? DateTimeRange(start: g.startDate!, end: g.endDate!) : null,
                );
                if (r != null) {
                  final end = DateTime(r.end.year, r.end.month, r.end.day, 23, 59);
                  if (context.mounted) {
                    await _run(context, () => ctrl.updateGroup(g.id, {'startDate': r.start.toIso8601String(), 'endDate': end.toIso8601String()}));
                  }
                }
              },
            ),
          if (g.canFinishTrip)
            SettingRow(
              title: l.finishTrip,
              subtitle: l.finishTripSubtitle,
              trailing: const Icon(Icons.flag_outlined, color: CT.muted),
              onTap: () => GroupActions.finishTrip(context, ref, g),
            ),
          SettingRow(
            title: l.defaultCameraStyle,
            subtitle: CameraStyle.byId(g.defaultStyle).name,
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final s = await showModalBottomSheet<String>(
                context: context,
                builder: (c) => SafeArea(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    for (final s in CameraStyle.all.where((s) => !s.pro || g.isProGroup))
                      ListTile(title: Text(s.name), subtitle: Text(s.description), onTap: () => Navigator.pop(c, s.id)),
                  ]),
                ),
              );
              if (s != null && context.mounted) await _run(context, () => ctrl.updateGroup(g.id, {'defaultStyle': s}));
            },
          ),
          SettingRow(
            title: g.isArchived ? l.reopenGroup : l.closeGroup,
            subtitle: g.isArchived ? l.reopenGroupSubtitle : l.closeGroupSubtitle,
            onTap: () => _run(context, () => ctrl.updateGroup(g.id, {'status': g.isArchived ? 'active' : 'archived'})),
          ),
        ],
        SectionLabel('${l.members} (${g.members.length}${g.memberLimit != null ? ' / ${g.memberLimit}' : ''})'),
        for (final m in g.members)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(children: [
              Avatar.member(m, size: 36),
              const SizedBox(width: 12),
              Expanded(
                child: Text('${m.id == me ? l.memberYou(m.name) : m.name}${blocked.contains(m.id) ? ' · ${l.blockedTag}' : ''}',
                    style: CT.text(15, weight: FontWeight.w500)),
              ),
              if (m.isAdmin) Text(l.adminTag, style: CT.text(12, color: CT.muted)),
              if (m.id != me)
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_horiz, color: CT.muted),
                  onSelected: (v) async {
                    switch (v) {
                      case 'remove':
                        if (await confirm(context, title: l.removeMemberTitle(m.name), message: l.removeMemberMessage, ok: l.removeMember, danger: true)) {
                          if (context.mounted) await _run(context, () => ctrl.removeMember(g.id, m.id));
                        }
                      case 'role':
                        await _run(context, () => ctrl.setRole(g.id, m.id, m.isAdmin ? 'member' : 'admin'));
                      case 'block':
                        if (await confirm(context,
                            title: l.blockTitle(m.name),
                            message: l.blockMessage(m.name),
                            ok: l.block,
                            danger: true)) {
                          if (context.mounted) {
                            await _run(context, () => ref.read(authProvider.notifier).block(m.id));
                          }
                        }
                      case 'unblock':
                        await _run(context, () => ref.read(authProvider.notifier).unblock(m.id));
                    }
                  },
                  itemBuilder: (_) => [
                    if (g.isAdmin && m.id != g.ownerId) ...[
                      PopupMenuItem(value: 'role', child: Text(m.isAdmin ? l.makeMember : l.makeAdmin)),
                      PopupMenuItem(value: 'remove', child: Text(l.removeFromGroup)),
                    ],
                    blocked.contains(m.id)
                        ? PopupMenuItem(value: 'unblock', child: Text(l.unblock))
                        : PopupMenuItem(value: 'block', child: Text(l.block)),
                  ],
                ),
            ]),
          ),
        const SizedBox(height: 8),
        CTButton(l.inviteFriendsButton, kind: CTButtonKind.ghost, icon: Icons.person_add_alt_1, onTap: () => context.push('/group/${g.id}/invite')),
        SectionLabel(l.you),
        SettingRow(
          title: g.archived ? l.unarchive : l.archive,
          subtitle: g.archived ? l.unarchiveSubtitle : l.archiveSubtitle(l.archivedSection),
          trailing: Icon(g.archived ? Icons.unarchive_outlined : Icons.archive_outlined, color: CT.muted),
          onTap: () => GroupActions.setArchived(context, ref, g, !g.archived),
        ),
        if (g.hiddenCount > 0)
          SettingRow(
            title: '${l.hiddenPhotos} (${g.hiddenCount})',
            subtitle: l.hiddenPhotosSubtitle,
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/group/${g.id}/hidden'),
          ),
        if (g.members.length > 1)
          SettingRow(
            title: l.leaveGroup,
            subtitle: l.leaveGroupSubtitle,
            color: CT.accent,
            divider: g.isAdmin,
            onTap: () async {
              if (await GroupActions.leave(context, ref, g) && context.mounted) context.go('/');
            },
          ),
        if (g.isAdmin)
          SettingRow(
            title: l.deleteGroup,
            subtitle: l.deleteGroupSubtitle,
            color: CT.accent,
            divider: false,
            onTap: () async {
              if (await GroupActions.delete(context, ref, g) && context.mounted) context.go('/');
            },
          ),
      ]),
    );
  }
}
