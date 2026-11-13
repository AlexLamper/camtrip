import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/api.dart';
import '../../core/theme.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import 'gallery_controller.dart';

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

/// Top row in selection mode: close, "3 geselecteerd", "Alles selecteren".
/// Shared by the album gallery and "Alle foto's".
class SelectionHeader extends StatelessWidget {
  const SelectionHeader({super.key, required this.count, required this.allSelected, required this.onClose, required this.onToggleAll});

  final int count;
  final bool allSelected;
  final VoidCallback onClose;

  /// Null when there is nothing to select.
  final VoidCallback? onToggleAll;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Row(children: [
      IconButton(key: const Key('sel-close'), tooltip: l.close, onPressed: onClose, icon: const Icon(Icons.close)),
      Expanded(
        child: Text(
          count == 0 ? l.choosePhotos : l.selectedCount(count),
          textAlign: TextAlign.center,
          style: CT.text(15, weight: FontWeight.w600),
        ),
      ),
      TextButton(
        key: const Key('sel-all'),
        onPressed: onToggleAll,
        child: Text(allSelected ? l.selectNone : l.selectAll, style: CT.text(14, color: CT.accent, weight: FontWeight.w600)),
      ),
    ]);
  }
}

/// Bottom bar in selection mode: Opslaan / Delen / Favoriet / Verbergen /
/// Verwijderen. Icons with small labels in one shared size; a long label
/// ("Geen favoriet") wraps to two lines, and only when a single word does
/// not fit (long words, large text) do all labels get smaller.
class SelectionActionBar extends StatelessWidget {
  const SelectionActionBar({
    super.key,
    required this.count,
    required this.onSave,
    required this.onShare,
    required this.onFavorite,
    required this.onHide,
    required this.onDelete,
    this.favoriteOn = true,
    this.busyLabel,
    this.onMove,
  });

  final int count;
  final VoidCallback? onSave;
  final VoidCallback? onShare;
  final VoidCallback? onFavorite;
  final VoidCallback? onHide;

  /// Null when none of the picked photos may be deleted by this user.
  final VoidCallback? onDelete;

  /// Only in my personal roll ("Mijn rolletje"): "Naar album" takes the place
  /// of "Verbergen" (hiding your own private photos from yourself makes no sense).
  final VoidCallback? onMove;

  /// True: the favorite action adds; false: it removes.
  final bool favoriteOn;

  /// e.g. "Opslaan... 3/8" while a download runs.
  final String? busyLabel;

  static const height = 58.0;

  static const _labelSize = 11.5;
  static const _slotPadding = 4.0; // horizontal, both sides together

  /// One font size for all labels: the largest (at most [_labelSize], with
  /// the user's text scale) at which every label fits its slot in at most two
  /// lines, without breaking a word.
  static double labelSize(BuildContext context, List<String> labels, double slotWidth) {
    final scaler = MediaQuery.textScalerOf(context);
    final base = DefaultTextStyle.of(context).style; // what Text merges in
    final room = slotWidth - _slotPadding;
    bool fits(double size) {
      final style = base.merge(CT.text(size, weight: FontWeight.w600, height: 1.2));
      TextPainter painter(String text, int lines, double width) =>
          TextPainter(text: TextSpan(text: text, style: style), textDirection: TextDirection.ltr, textScaler: scaler, maxLines: lines)
            ..layout(maxWidth: width);
      for (final label in labels) {
        // Every word on one line ...
        for (final word in label.split(' ')) {
          final tp = painter(word, 1, double.infinity);
          final ok = tp.width <= room;
          tp.dispose();
          if (!ok) return false;
        }
        // ... and the whole label in two lines at most.
        final tp = painter(label, 2, room);
        final ok = !tp.didExceedMaxLines;
        tp.dispose();
        if (!ok) return false;
      }
      return true;
    }

    var size = _labelSize;
    while (size > 7 && !fits(size)) {
      size -= 0.25;
    }
    return size;
  }

  @override
  Widget build(BuildContext context) {
    final enabled = count > 0 && busyLabel == null;
    final l = context.l10n;
    final favoriteLabel = favoriteOn ? l.favorite : l.unfavorite;
    final labels = [l.save, l.share, favoriteLabel, onMove != null ? l.personalRollMove : l.hide, l.delete];

    Widget bar(double size) {
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
                padding: const EdgeInsets.symmetric(horizontal: _slotPadding / 2, vertical: 8),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(icon, color: color ?? Colors.white, size: 22),
                  const SizedBox(height: 4),
                  Text(label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CT.text(size, color: color ?? Colors.white, weight: FontWeight.w600, height: 1.2)),
                ]),
              ),
            ),
          ),
        );
      }

      return Row(children: [
        action(const Key('sel-save'), Icons.download_rounded, l.save, onSave),
        action(const Key('sel-share'), Icons.ios_share, l.share, onShare),
        action(const Key('sel-favorite'), favoriteOn ? Icons.star_outline_rounded : Icons.star_rounded, favoriteLabel, onFavorite),
        if (onMove != null)
          action(const Key('sel-move'), Icons.drive_file_move_outline, l.personalRollMove, onMove)
        else
          action(const Key('sel-hide'), Icons.visibility_off_outlined, l.hide, onHide),
        action(const Key('sel-delete'), Icons.delete_outline, l.delete, onDelete, color: const Color(0xFFFF8A73)),
      ]);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(color: CT.ink, borderRadius: BorderRadius.circular(18), boxShadow: CT.printShadow),
      child: busyLabel != null
          ? SizedBox(
              key: const Key('sel-busy'),
              height: height,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
                      const SizedBox(width: 10),
                      Text(busyLabel!, maxLines: 1, style: CT.text(14, color: Colors.white, weight: FontWeight.w600)),
                    ]),
                  ),
                ),
              ),
            )
          : LayoutBuilder(builder: (context, c) => bar(labelSize(context, labels, c.maxWidth / labels.length))),
    );
  }
}

/// Text for the busy action bar: "Opslaan... 3/8", "Voorbereiden... 2/5"
/// (one item: "Voorbereiden..."), or null when nothing runs.
String? busyLabel(BuildContext context, {DownloadProgress? saving, DownloadProgress? sharing}) {
  final l = context.l10n;
  if (saving != null) return l.savingProgress(saving.done, saving.total);
  if (sharing != null) return sharing.total > 1 ? l.sharingProgress(sharing.done, sharing.total) : l.sharePreparing;
  return null;
}

/// Shares picked photos/videos through the system share sheet. Override the
/// provider in tests.
final photoShareProvider = Provider<PhotoShare>((ref) => PhotoShare(ref.read(apiProvider)));

class PhotoShare {
  PhotoShare(this.api);
  final Api api;

  /// Downloads [photos] (any albums mixed; display or original quality like
  /// "Opslaan") to temp files and opens the share sheet. Photos that fail
  /// are left out; throws only when nothing could be prepared.
  /// [origin] anchors the sheet on iPad.
  Future<void> share(List<Photo> photos, {void Function(DownloadProgress)? onProgress, Rect? origin}) async {
    if (photos.isEmpty) return;
    final dir = Directory('${(await getTemporaryDirectory()).path}/share');
    try {
      if (dir.existsSync()) await dir.delete(recursive: true); // files of the previous share
    } catch (_) {}
    await dir.create(recursive: true);

    final byGroup = <String, List<String>>{};
    for (final p in photos) {
      byGroup.putIfAbsent(p.groupId, () => []).add(p.id);
    }
    final files = <XFile>[];
    var done = 0;
    Object? error;
    for (final e in byGroup.entries) {
      try {
        final got = await Downloader.toFiles(api, e.key, e.value, dir, onFile: () => onProgress?.call(DownloadProgress(++done, photos.length)));
        files.addAll(got.map((f) => XFile(f.path, mimeType: f.mime)));
      } catch (err) {
        error = err;
      }
    }
    if (files.isEmpty) throw error ?? ApiException(L10n.current.shareFailed);
    await SharePlus.instance.share(ShareParams(files: files, sharePositionOrigin: origin));
  }
}

/// Where the share sheet points from on iPad: the middle of the action bar.
Rect shareOrigin(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final bottom = MediaQuery.paddingOf(context).bottom;
  return Rect.fromLTWH(size.width / 2 - 1, size.height - bottom - 12 - SelectionActionBar.height, 2, 2);
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
