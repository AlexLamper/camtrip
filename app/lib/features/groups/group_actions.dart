import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import 'groups_controller.dart';

/// Group management used by the albums list (long-press / swipe) and the
/// group settings screen, so both behave the same.
class GroupActions {
  GroupActions._();

  static Future<void> _run(BuildContext context, Future<void> Function() fn) async {
    try {
      await fn();
    } catch (e) {
      if (context.mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  /// Personal archive, with "Ongedaan maken".
  static Future<void> setArchived(BuildContext context, WidgetRef ref, Group g, bool archived) async {
    final ctrl = ref.read(groupsProvider.notifier);
    final messenger = ScaffoldMessenger.of(context);
    await _run(context, () async {
      await ctrl.setArchived(g.id, archived);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(archived ? '"${g.name}" gearchiveerd' : '"${g.name}" staat weer bij je albums'),
          duration: const Duration(seconds: 4),
          action: SnackBarAction(
            label: 'Ongedaan maken',
            textColor: const Color(0xFFFF8A73),
            onPressed: () => ctrl.setArchived(g.id, !archived).catchError((Object e) {
              messenger.showSnackBar(SnackBar(content: Text(ApiException.from(e).message)));
            }),
          ),
        ));
    });
  }

  static Future<void> rename(BuildContext context, WidgetRef ref, Group g) async {
    final name = await promptText(context, 'Naam van de groep', g.name);
    if (name == null || name.trim().isEmpty || name.trim() == g.name || !context.mounted) return;
    await _run(context, () => ref.read(groupsProvider.notifier).rename(g.id, name.trim()));
  }

  /// "Reis afronden": the end date becomes now.
  static Future<void> finishTrip(BuildContext context, WidgetRef ref, Group g) async {
    if (!await confirm(context,
        title: 'Reis afronden?',
        message: 'De einddatum wordt vandaag. Foto\'s toevoegen kan nog steeds; de recap staat klaar.',
        ok: 'Rond af')) {
      return;
    }
    if (!context.mounted) return;
    await _run(context, () async {
      await ref.read(groupsProvider.notifier).finishTrip(g.id);
      if (context.mounted) showMessage(context, 'Reis afgerond');
    });
  }

  /// Returns true when the user left (the caller navigates away).
  static Future<bool> leave(BuildContext context, WidgetRef ref, Group g) async {
    if (g.members.length <= 1) {
      showMessage(context, 'Je bent het laatste lid. Verwijder de groep in plaats daarvan.');
      return false;
    }
    if (!await confirm(context,
        title: '"${g.name}" verlaten?',
        message: 'Je foto\'s blijven in de groep voor de anderen. Je kunt later weer joinen met de code.',
        ok: 'Verlaat',
        danger: true)) {
      return false;
    }
    if (!context.mounted) return false;
    var ok = false;
    await _run(context, () async {
      await ref.read(groupsProvider.notifier).leave(g.id);
      ok = true;
    });
    return ok;
  }

  /// Owner/admin only. Asks to type the group name first.
  static Future<bool> delete(BuildContext context, WidgetRef ref, Group g) async {
    if (!await confirmDeleteGroup(context, g)) return false;
    if (!context.mounted) return false;
    var ok = false;
    await _run(context, () async {
      await ref.read(groupsProvider.notifier).deleteGroup(g.id);
      ok = true;
      if (context.mounted) showMessage(context, '"${g.name}" is verwijderd');
    });
    return ok;
  }

  /// Long-press menu on an album.
  static Future<void> showMenu(BuildContext context, WidgetRef ref, Group g) async {
    HapticFeedback.mediumImpact();
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 2),
            child: Text(g.name, style: CT.title(22), maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            child: Text(
              [Fmt.count(g.totalCount, 'foto', 'foto\'s'), Fmt.count(g.members.length, 'lid', 'leden'), if (g.isAdmin) 'jij bent beheerder'].join(' · '),
              style: CT.text(13, color: CT.muted),
            ),
          ),
          _item(c, 'open', Icons.photo_library_outlined, 'Openen'),
          g.archived
              ? _item(c, 'unarchive', Icons.unarchive_outlined, 'Terugzetten uit archief')
              : _item(c, 'archive', Icons.archive_outlined, 'Archiveren', subtitle: 'Alleen voor jou, de anderen merken er niets van'),
          if (g.isAdmin) _item(c, 'rename', Icons.edit_outlined, 'Naam wijzigen'),
          if (g.isAdmin && g.canFinishTrip) _item(c, 'finish', Icons.flag_outlined, 'Reis afronden'),
          if (g.members.length > 1) _item(c, 'leave', Icons.logout, 'Groep verlaten', danger: true),
          if (g.isAdmin) _item(c, 'delete', Icons.delete_outline, 'Groep verwijderen', danger: true, subtitle: 'Voor iedereen, met alle foto\'s'),
          const SizedBox(height: 6),
        ]),
      ),
    );
    if (choice == null || !context.mounted) return;
    switch (choice) {
      case 'open':
        context.push('/group/${g.id}');
      case 'archive':
        await setArchived(context, ref, g, true);
      case 'unarchive':
        await setArchived(context, ref, g, false);
      case 'rename':
        await rename(context, ref, g);
      case 'finish':
        await finishTrip(context, ref, g);
      case 'leave':
        await leave(context, ref, g);
      case 'delete':
        await delete(context, ref, g);
    }
  }

  static Widget _item(BuildContext c, String value, IconData icon, String title, {bool danger = false, String? subtitle}) => ListTile(
        key: Key('group-action-$value'),
        leading: Icon(icon, color: danger ? CT.accent : CT.ink),
        title: Text(title, style: CT.text(16, color: danger ? CT.accent : CT.ink, weight: FontWeight.w500)),
        subtitle: subtitle == null ? null : Text(subtitle, style: CT.text(12, color: CT.muted)),
        onTap: () => Navigator.pop(c, value),
      );
}

/// Strong confirmation: the red button only works after typing the group name.
Future<bool> confirmDeleteGroup(BuildContext context, Group g) async {
  final input = TextEditingController();
  bool matches() => input.text.trim().toLowerCase() == g.name.trim().toLowerCase();
  final r = await showDialog<bool>(
    context: context,
    builder: (d) => StatefulBuilder(
      builder: (d, setState) => AlertDialog(
        title: Text('Groep verwijderen?', style: CT.title(20)),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Alle ${Fmt.count(g.totalCount, 'foto en video', 'foto\'s en video\'s')} in "${g.name}" verdwijnen voor alle '
              '${Fmt.count(g.members.length, 'lid', 'leden')}. Dit kan niet ongedaan worden.',
              style: CT.text(15, color: CT.muted),
            ),
            const SizedBox(height: 8),
            Text('Je eigen fotorol blijft ongewijzigd.', style: CT.text(14, color: CT.muted, weight: FontWeight.w500)),
            const SizedBox(height: 14),
            Text('Typ de naam van de groep om te bevestigen:', style: CT.text(13, weight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextField(
              key: const Key('delete-group-name'),
              controller: input,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(hintText: g.name),
              onChanged: (_) => setState(() {}),
            ),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(d, false), child: Text('Annuleer', style: CT.text(15, color: CT.muted))),
          FilledButton(
            key: const Key('delete-group-confirm'),
            style: FilledButton.styleFrom(backgroundColor: CT.accent, disabledBackgroundColor: CT.accent.withValues(alpha: 0.3)),
            onPressed: matches() ? () => Navigator.pop(d, true) : null,
            child: Text('Verwijder voor iedereen', style: CT.text(14, color: Colors.white, weight: FontWeight.w600)),
          ),
        ],
      ),
    ),
  );
  return r ?? false;
}

Future<String?> promptText(BuildContext context, String title, String initial) async {
  final c = TextEditingController(text: initial);
  final r = await showDialog<String>(
    context: context,
    builder: (d) => AlertDialog(
      title: Text(title, style: CT.title(20)),
      content: TextField(controller: c, autofocus: true, maxLength: 60, textCapitalization: TextCapitalization.sentences),
      actions: [
        TextButton(onPressed: () => Navigator.pop(d), child: Text('Annuleer', style: CT.text(15, color: CT.muted))),
        TextButton(onPressed: () => Navigator.pop(d, c.text), child: Text('Opslaan', style: CT.text(15, weight: FontWeight.w600))),
      ],
    ),
  );
  return r;
}
