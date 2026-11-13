import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';

/// Which photos are picked in the gallery's selection mode. Plain Dart so it
/// is easy to test; the screen calls setState around it.
class PhotoSelection {
  bool active = false;
  final Set<String> ids = {};

  int get count => ids.length;
  bool contains(String id) => ids.contains(id);

  /// Long-press: enter selection mode with this photo picked.
  void start(String id) {
    active = true;
    ids.add(id);
  }

  void toggle(String id) {
    if (!ids.remove(id)) ids.add(id);
  }

  /// "Alles selecteren" when not everything is picked, otherwise clears.
  void toggleAll(Iterable<String> all) {
    final list = all.toList();
    if (list.isNotEmpty && list.every(ids.contains)) {
      ids.clear();
    } else {
      ids.addAll(list);
    }
  }

  bool allSelected(Iterable<String> all) {
    final list = all.toList();
    return list.isNotEmpty && list.every(ids.contains);
  }

  void exit() {
    active = false;
    ids.clear();
  }

  /// Drops ids that are no longer in the gallery (deleted, hidden, refreshed).
  void retain(Iterable<String> present) => ids.retainAll(present.toSet());

  List<Photo> picked(List<Photo> photos) => photos.where((p) => ids.contains(p.id)).toList();

  /// Of the picked photos, the ones this user may delete.
  List<Photo> deletable(List<Photo> photos, String? me, Group? group) =>
      picked(photos).where((p) => p.canDelete(me, group)).toList();

  /// The "Favoriet" action marks everything, unless all are favorites already.
  bool favoriteTarget(List<Photo> photos) {
    final p = picked(photos);
    return p.isEmpty || !p.every((x) => x.isFavorite);
  }
}

/// Bottom bar in selection mode: Opslaan / Favoriet / Verbergen / Verwijderen.
class SelectionActionBar extends StatelessWidget {
  const SelectionActionBar({
    super.key,
    required this.count,
    required this.onSave,
    required this.onFavorite,
    required this.onHide,
    required this.onDelete,
    this.favoriteOn = true,
    this.busyLabel,
  });

  final int count;
  final VoidCallback? onSave;
  final VoidCallback? onFavorite;
  final VoidCallback? onHide;

  /// Null when none of the picked photos may be deleted by this user.
  final VoidCallback? onDelete;

  /// True: the favorite action adds; false: it removes.
  final bool favoriteOn;

  /// e.g. "Opslaan... 3/8" while a download runs.
  final String? busyLabel;

  @override
  Widget build(BuildContext context) {
    final enabled = count > 0 && busyLabel == null;
    final l = context.l10n;
    Widget action(Key key, IconData icon, String label, VoidCallback? onTap, {Color? color}) {
      final on = enabled && onTap != null;
      return Expanded(
        child: Opacity(
          opacity: on ? 1 : 0.35,
          child: InkWell(
            key: key,
            borderRadius: BorderRadius.circular(12),
            onTap: on ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(icon, color: color ?? Colors.white, size: 22),
                const SizedBox(height: 4),
                Text(label,
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(12, color: color ?? Colors.white, weight: FontWeight.w600)),
              ]),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(color: CT.ink, borderRadius: BorderRadius.circular(18), boxShadow: CT.printShadow),
      child: busyLabel != null
          ? SizedBox(
              height: 58,
              child: Center(child: Text(busyLabel!, style: CT.text(14, color: Colors.white, weight: FontWeight.w600))),
            )
          : Row(children: [
              action(const Key('sel-save'), Icons.download_rounded, l.save, onSave),
              action(const Key('sel-favorite'), favoriteOn ? Icons.star_outline_rounded : Icons.star_rounded, favoriteOn ? l.favorite : l.unfavorite,
                  onFavorite),
              action(const Key('sel-hide'), Icons.visibility_off_outlined, l.hide, onHide),
              action(const Key('sel-delete'), Icons.delete_outline, l.delete, onDelete, color: const Color(0xFFFF8A73)),
            ]),
    );
  }
}

/// Confirmation before deleting photos for the whole group.
/// [notAllowed] = picked photos of others that this user cannot delete.
Future<bool> confirmDeletePhotos(BuildContext context, {required int count, int notAllowed = 0}) async {
  final l = context.l10n;
  final r = await showDialog<bool>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(l.deletePhotosTitle(count), style: CT.title(20)),
      content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          l.deletePhotosMessage(count),
          style: CT.text(15, color: CT.muted),
        ),
        const SizedBox(height: 10),
        Text(l.deleteGroupOwnRoll, style: CT.text(14, color: CT.muted, weight: FontWeight.w500)),
        if (notAllowed > 0) ...[
          const SizedBox(height: 10),
          Text(
            l.deletePhotosNotAllowed(notAllowed),
            style: CT.text(13, color: CT.warn),
          ),
        ],
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(c, false), child: Text(l.cancel, style: CT.text(15, color: CT.muted))),
        TextButton(
          key: const Key('confirm-delete'),
          onPressed: () => Navigator.pop(c, true),
          child: Text(l.remove, style: CT.text(15, color: CT.accent, weight: FontWeight.w600)),
        ),
      ],
    ),
  );
  return r ?? false;
}

/// SnackBar with an "Ongedaan maken" button.
void showUndo(BuildContext context, String text, VoidCallback onUndo) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(label: context.l10n.undo, textColor: const Color(0xFFFF8A73), onPressed: onUndo),
    ));
}
