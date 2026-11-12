import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../camera/styles.dart';
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
    if (g == null) return Scaffold(appBar: AppBar());
    final ctrl = ref.read(groupsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Groep')),
      body: ListView(padding: const EdgeInsets.fromLTRB(22, 0, 22, 40), children: [
        Text(g.name, style: CT.title(28)),
        const SizedBox(height: 4),
        Text(
          [
            switch (g.type) { GroupType.vacation => 'Vakantie', GroupType.event => 'Event', GroupType.permanent => 'Altijd open' },
            if (g.startDate != null) Fmt.range(g.startDate, g.endDate),
            'code ${g.code}',
          ].join(' · '),
          style: CT.text(14, color: CT.muted),
        ),
        if (g.isAdmin) ...[
          const SectionLabel('Beheer'),
          SettingRow(
            title: 'Naam wijzigen',
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final name = await _prompt(context, 'Naam van de groep', g.name);
              if (name != null && name.trim().isNotEmpty && context.mounted) await _run(context, () => ctrl.updateGroup(g.id, {'name': name.trim()}));
            },
          ),
          if (g.type != GroupType.permanent)
            SettingRow(
              title: 'Datum wijzigen',
              subtitle: Fmt.range(g.startDate, g.endDate),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final now = DateTime.now();
                final r = await showDateRangePicker(
                  context: context,
                  firstDate: now.subtract(const Duration(days: 365)),
                  lastDate: now.add(const Duration(days: 730)),
                  initialDateRange: g.startDate != null && g.endDate != null ? DateTimeRange(start: g.startDate!, end: g.endDate!) : null,
                  locale: const Locale('nl'),
                );
                if (r != null) {
                  final end = DateTime(r.end.year, r.end.month, r.end.day, 23, 59);
                  if (context.mounted) {
                    await _run(context, () => ctrl.updateGroup(g.id, {'startDate': r.start.toIso8601String(), 'endDate': end.toIso8601String()}));
                  }
                }
              },
            ),
          SettingRow(
            title: 'Standaard camerastijl',
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
            title: g.isArchived ? 'Groep heropenen' : 'Groep afsluiten',
            subtitle: g.isArchived ? 'Leden kunnen weer foto\'s toevoegen' : 'Niemand kan nog foto\'s toevoegen; alles blijft te bekijken',
            onTap: () => _run(context, () => ctrl.updateGroup(g.id, {'status': g.isArchived ? 'active' : 'archived'})),
          ),
        ],
        SectionLabel('Leden (${g.members.length}${g.memberLimit != null ? ' / ${g.memberLimit}' : ''})'),
        for (final m in g.members)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(children: [
              Avatar.member(m, size: 36),
              const SizedBox(width: 12),
              Expanded(
                child: Text('${m.name}${m.id == me ? ' (jij)' : ''}', style: CT.text(15, weight: FontWeight.w500)),
              ),
              if (m.isAdmin) Text('beheerder', style: CT.text(12, color: CT.muted)),
              if (g.isAdmin && m.id != me && m.id != g.ownerId)
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_horiz, color: CT.muted),
                  onSelected: (v) async {
                    if (v == 'remove') {
                      if (await confirm(context, title: '${m.name} verwijderen?', message: 'Hun foto\'s blijven in de groep.', ok: 'Verwijder', danger: true)) {
                        if (context.mounted) await _run(context, () => ctrl.removeMember(g.id, m.id));
                      }
                    } else {
                      await _run(context, () => ctrl.setRole(g.id, m.id, m.isAdmin ? 'member' : 'admin'));
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(value: 'role', child: Text(m.isAdmin ? 'Maak gewoon lid' : 'Maak beheerder')),
                    const PopupMenuItem(value: 'remove', child: Text('Verwijder uit groep')),
                  ],
                ),
            ]),
          ),
        const SizedBox(height: 8),
        CTButton('Vrienden uitnodigen', kind: CTButtonKind.ghost, icon: Icons.person_add_alt_1, onTap: () => context.push('/group/${g.id}/invite')),
        const SectionLabel('Jij'),
        if (g.members.length > 1)
          SettingRow(
            title: 'Groep verlaten',
            color: CT.accent,
            onTap: () async {
              if (!await confirm(context, title: 'Groep verlaten?', message: 'Je foto\'s blijven in de groep voor de anderen.', ok: 'Verlaat', danger: true)) return;
              if (context.mounted) {
                await _run(context, () async {
                  await ctrl.leave(g.id);
                  if (context.mounted) context.go('/');
                });
              }
            },
          ),
        if (g.isAdmin)
          SettingRow(
            title: 'Groep verwijderen',
            subtitle: 'Alle foto\'s worden voor iedereen verwijderd',
            color: CT.accent,
            divider: false,
            onTap: () async {
              if (!await confirm(context,
                  title: 'Groep verwijderen?', message: 'Alle ${g.totalCount} foto\'s en video\'s verdwijnen voor iedereen. Dit kan niet ongedaan.', ok: 'Verwijder', danger: true)) {
                return;
              }
              if (context.mounted) {
                await _run(context, () async {
                  await ctrl.deleteGroup(g.id);
                  if (context.mounted) context.go('/');
                });
              }
            },
          ),
      ]),
    );
  }
}

Future<String?> _prompt(BuildContext context, String title, String initial) {
  final c = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (d) => AlertDialog(
      title: Text(title, style: CT.title(20)),
      content: TextField(controller: c, autofocus: true, maxLength: 60),
      actions: [
        TextButton(onPressed: () => Navigator.pop(d), child: const Text('Annuleer')),
        TextButton(onPressed: () => Navigator.pop(d, c.text), child: const Text('Opslaan')),
      ],
    ),
  );
}
