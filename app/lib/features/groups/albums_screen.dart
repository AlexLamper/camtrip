import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../gallery/all_photos_controller.dart';
import '../gallery/all_photos_screen.dart';
import '../gallery/photo_actions.dart';
import '../upload/upload_queue.dart';
import 'group_actions.dart';
import 'groups_controller.dart';
import 'join_sheet.dart';

/// The two tabs of the home screen.
enum HomeTab { albums, photos }

/// Home. Tab "Albums": all groups as instant prints, the active one marked.
/// Long-press an album for Archiveren / Verlaten / Verwijderen. Groups the
/// user archived sit collapsed under "Gearchiveerd" at the bottom; swipe one
/// to put it back. Tab "Alle foto's": every photo the user made, as a grid
/// ([AllPhotosView]). /photos opens the home on that tab.
class AlbumsScreen extends ConsumerStatefulWidget {
  const AlbumsScreen({super.key, this.initialTab = HomeTab.albums, this.photoThumbBuilder});

  final HomeTab initialTab;

  /// Draws a tile in "Alle foto's". Null = the cached network thumbnail. For previews/tests.
  @visibleForTesting
  final Widget Function(Photo photo)? photoThumbBuilder;

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen> {
  bool _showArchived = false;
  late HomeTab _tab = widget.initialTab;
  final _sel = PhotoSelection();

  /// The photos tab is built the first time it is shown, then kept (scroll position too).
  late bool _photosBuilt = _tab == HomeTab.photos;

  @override
  void didUpdateWidget(AlbumsScreen old) {
    super.didUpdateWidget(old);
    // A link to /photos (or back to /) while the home is already open.
    if (widget.initialTab != old.initialTab) _setTab(widget.initialTab);
  }

  void _setTab(HomeTab tab) => setState(() {
        _tab = tab;
        if (tab == HomeTab.photos) _photosBuilt = true;
        _sel.exit();
      });

  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(groupsProvider);
    final mine = (groups.value ?? const <Group>[]).where((g) => !g.archived);
    final canShoot = mine.any((g) => !g.isClosed);
    final l = context.l10n;
    final selecting = _sel.active && _tab == HomeTab.photos;

    return PopScope(
      // Back first leaves selection mode, then goes back to the albums tab.
      canPop: !selecting && _tab == HomeTab.albums,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (selecting) {
          setState(_sel.exit);
        } else {
          _setTab(HomeTab.albums);
        }
      },
      child: Scaffold(
        body: Column(children: [
          SafeArea(bottom: false, child: _titleRow()),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
            child: SizedBox(
              height: 44,
              child: selecting
                  ? _selectionHeader()
                  : Center(
                      child: CTSegmented<HomeTab>(
                        segments: [
                          (HomeTab.albums, l.homeTabAlbums, const Key('home-tab-albums')),
                          (HomeTab.photos, l.allPhotosTitle, const Key('home-tab-photos')),
                        ],
                        selected: _tab,
                        onChanged: (t) => t == _tab ? null : _setTab(t),
                      ),
                    ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _tab.index,
              sizing: StackFit.expand,
              children: [
                _albums(groups),
                if (_photosBuilt)
                  AllPhotosView(selection: _sel, onSelectionChanged: () => setState(() {}), thumbBuilder: widget.photoThumbBuilder)
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !canShoot || selecting
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: CTButton(l.camera, kind: CTButtonKind.primary, icon: Icons.photo_camera, onTap: () => context.push('/camera')),
              ),
      ),
    );
  }

  /// Title (follows the tab), on the photos tab the "Selecteer" chip, upload
  /// queue and the avatar that opens Instellingen.
  ///
  /// Long titles ("Toutes les photos") first get a bit smaller (down to 80%);
  /// if that is not enough, the chip shows only its icon.
  Widget _titleRow() {
    final user = ref.watch(authProvider).value;
    final selecting = _sel.active && _tab == HomeTab.photos;
    final pending = ref.watch(uploadQueueProvider).length;
    final l = context.l10n;
    final title = _tab == HomeTab.albums ? l.yourAlbums : l.allPhotosTitle;
    final chipLabel = selecting ? l.done : l.select;
    const titleSize = 30.0, minScale = 0.8, chipGap = 8.0, chipEnd = 10.0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 14, 16, 0),
      child: LayoutBuilder(builder: (context, c) {
        final scaler = MediaQuery.textScalerOf(context);
        final tp = TextPainter(text: TextSpan(text: title, style: CT.title(titleSize)), textDirection: TextDirection.ltr, textScaler: scaler, maxLines: 1)
          ..layout();
        final natural = tp.width;
        tp.dispose();
        final fixed = 36.0 + (pending > 0 ? 48 : 0); // avatar, queue button
        var room = c.maxWidth - fixed;
        var compactChip = false;
        if (_tab == HomeTab.photos) {
          final full = room - chipGap - chipEnd - CTChip.widthOf(context, chipLabel, icon: true);
          compactChip = natural * minScale > full;
          room = compactChip ? room - chipGap - chipEnd - CTChip.widthOf(context, '', icon: true) : full;
        }
        final scale = natural <= room ? 1.0 : (room / natural).clamp(minScale, 1.0);

        final chip = CTChip(
          compactChip ? '' : chipLabel,
          key: const Key('home-select'),
          icon: Icons.check_circle_outline,
          selected: selecting,
          onTap: () => setState(() => selecting ? _sel.exit() : _sel.active = true),
        );
        return Row(children: [
          Expanded(
            child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.title((titleSize * scale).floorToDouble())),
          ),
          if (_tab == HomeTab.photos) ...[
            const SizedBox(width: chipGap),
            // Same chip as "Selecteer" in an album; long-press on a photo works too.
            compactChip ? Tooltip(message: chipLabel, child: Semantics(button: true, label: chipLabel, child: chip)) : chip,
            const SizedBox(width: chipEnd),
          ],
          if (pending > 0)
            IconButton(
              tooltip: l.uploadQueue,
              onPressed: () => context.push('/queue'),
              icon: Badge(label: Text('$pending'), backgroundColor: CT.accent, child: const Icon(Icons.cloud_upload_outlined)),
            ),
          GestureDetector(
            onTap: () => context.push('/settings'),
            child: user == null || user.name.isEmpty
                ? const CircleAvatar(radius: 17, backgroundColor: CT.cream, child: Icon(Icons.person, size: 18, color: CT.muted))
                : Avatar(initial: user.initial, color: user.color, size: 36),
          ),
        ]);
      }),
    );
  }

  /// Same top row as an album gallery in selection mode.
  Widget _selectionHeader() {
    final ids = ref.watch(allPhotosProvider.select((s) => s.photos)).map((p) => p.id);
    return SelectionHeader(
      count: _sel.count,
      allSelected: _sel.allSelected(ids),
      onClose: () => setState(_sel.exit),
      onToggleAll: ids.isEmpty ? null : () => setState(() => _sel.toggleAll(ids)),
    );
  }

  Widget _albums(AsyncValue<List<Group>> groups) {
    final activeId = ref.watch(activeGroupIdProvider);
    final list = groups.value ?? const <Group>[];
    // Open groups first, then ones an admin closed; my archived ones apart.
    final mine = list.where((g) => !g.archived).toList();
    final active = [...mine.where((g) => !g.isClosed), ...mine.where((g) => g.isClosed)];
    final archived = list.where((g) => g.archived).toList();
    final l = context.l10n;

    return RefreshIndicator(
      color: CT.ink,
      onRefresh: () => ref.read(groupsProvider.notifier).reload(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (groups.isLoading && list.isEmpty)
            const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: CT.ink)))
          else if (groups.hasError && list.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyState(
                title: l.noConnection,
                message: l.albumsOfflineMessage,
                action: SizedBox(width: 200, child: CTButton(l.retry, onTap: () => ref.read(groupsProvider.notifier).reload())),
              ),
            )
          else if (list.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyState(
                title: l.noAlbumsTitle,
                message: l.noAlbumsMessage,
                action: Column(children: [
                  SizedBox(width: 240, child: CTButton(l.newGroup, kind: CTButtonKind.primary, onTap: () => context.push('/new'))),
                  const SizedBox(height: 10),
                  SizedBox(width: 240, child: CTButton(l.haveCode, kind: CTButtonKind.outline, onTap: () => showJoinSheet(context))),
                ]),
              ),
            )
          else ...[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              sliver: _grid(context, ref, [...active, null], activeId),
            ),
            if (archived.isNotEmpty) ...[
              SliverToBoxAdapter(child: _archivedHeader(archived.length)),
              if (_showArchived)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
                  sliver: SliverList.list(children: [for (final g in archived) _archivedRow(g)]),
                ),
            ],
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
                child: GestureDetector(
                  onTap: () => showJoinSheet(context),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFD5D2CB), width: 1.5),
                    ),
                    child: Row(children: [
                      const Icon(Icons.qr_code_scanner),
                      const SizedBox(width: 12),
                      Expanded(child: Text(l.joinWithCode, style: CT.text(15, weight: FontWeight.w600))),
                      const Icon(Icons.chevron_right),
                    ]),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ],
      ),
    );
  }

  Widget _archivedHeader(int count) => Padding(
        padding: const EdgeInsets.fromLTRB(14, 22, 14, 0),
        child: InkWell(
          key: const Key('archived-toggle'),
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => _showArchived = !_showArchived),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(children: [
              const Icon(Icons.archive_outlined, size: 18, color: CT.muted),
              const SizedBox(width: 8),
              Expanded(child: Text('${context.l10n.archivedSection.toUpperCase()} ($count)', style: CT.label)),
              AnimatedRotation(
                turns: _showArchived ? 0.5 : 0,
                duration: const Duration(milliseconds: 180),
                child: const Icon(Icons.expand_more, color: CT.muted),
              ),
            ]),
          ),
        ),
      );

  /// Compact row; swipe to the left (or long-press) to put it back.
  Widget _archivedRow(Group g) => Dismissible(
        key: ValueKey('archived-${g.id}'),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(color: CT.ink, borderRadius: BorderRadius.circular(14)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.unarchive_outlined, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(context.l10n.restore, style: CT.text(14, color: Colors.white, weight: FontWeight.w600)),
          ]),
        ),
        onDismissed: (_) => GroupActions.setArchived(context, ref, g, false),
        child: GestureDetector(
          onTap: () => context.push('/group/${g.id}'),
          onLongPress: () => GroupActions.showMenu(context, ref, g),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(14), boxShadow: CT.cardShadow),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: g.coverUrl == null
                      ? Container(color: CT.cream, child: const Icon(Icons.photo_camera_outlined, size: 18, color: CT.muted))
                      : NetPhoto(g.coverUrl!, cacheKey: 'cover_${g.id}_${g.photoCount}'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(g.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(15, weight: FontWeight.w600)),
                  Text(
                    [if (g.startDate != null) Fmt.range(g.startDate, g.endDate), context.l10n.photosCount(g.totalCount)].join(' · '),
                    style: CT.text(12, color: CT.muted),
                  ),
                ]),
              ),
              IconButton(
                tooltip: context.l10n.more,
                onPressed: () => GroupActions.showMenu(context, ref, g),
                icon: const Icon(Icons.more_horiz, color: CT.muted),
              ),
            ]),
          ),
        ),
      );

  Widget _grid(BuildContext context, WidgetRef ref, List<Group?> items, String? activeId) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 20,
        childAspectRatio: 0.78,
      ),
      delegate: SliverChildBuilderDelegate((_, i) {
        final g = items[i];
        if (g == null) {
          return GestureDetector(
            onTap: () => context.push('/new'),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFD5D2CB), width: 2),
              ),
              alignment: Alignment.center,
              child: Text('+ ${context.l10n.newAlbum}', style: CT.text(15, color: CT.muted, weight: FontWeight.w600)),
            ),
          );
        }
        final isActive = g.id == activeId && !g.isArchived;
        return GestureDetector(
          key: ValueKey('album-${g.id}'),
          onTap: () => context.push('/group/${g.id}'),
          onLongPress: () => GroupActions.showMenu(context, ref, g),
          child: Opacity(
            opacity: g.isArchived ? 0.6 : 1,
            child: InstantPrint(
              rotation: i.isEven ? -2 : 2,
              bottom: 44,
              caption: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Flexible(child: Text(g.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(13, weight: FontWeight.w600))),
                    if (isActive) ...[const SizedBox(width: 5), const Icon(Icons.circle, size: 8, color: CT.accent)],
                  ]),
                  Text(
                    g.isArchived
                        ? '${context.l10n.closedTag} · ${g.totalCount}'
                        : [if (isActive) context.l10n.activeTag, if (g.startDate != null) Fmt.range(g.startDate, g.endDate), '${g.totalCount}'].join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CT.text(10.5, color: CT.muted),
                  ),
                ]),
              ),
              child: g.coverUrl == null
                  ? Container(color: CT.cream, child: const Icon(Icons.photo_camera_outlined, color: CT.muted))
                  : ColorFiltered(
                      colorFilter: g.isArchived
                          ? const ColorFilter.matrix([0.5, 0.4, 0.1, 0, 0, 0.3, 0.6, 0.1, 0, 0, 0.3, 0.4, 0.3, 0, 0, 0, 0, 0, 1, 0])
                          : const ColorFilter.mode(Colors.transparent, BlendMode.dst),
                      child: NetPhoto(g.coverUrl!, cacheKey: 'cover_${g.id}_${g.photoCount}'),
                    ),
            ),
          ),
        );
      }, childCount: items.length),
    );
  }
}
