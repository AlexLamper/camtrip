import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../upload/upload_queue.dart';
import 'group_actions.dart';
import 'groups_controller.dart';
import 'join_sheet.dart';

/// Home: all groups as instant prints, the active one marked. Long-press an
/// album for Archiveren / Verlaten / Verwijderen. Groups the user archived sit
/// collapsed under "Gearchiveerd" at the bottom; swipe one to put it back.
class AlbumsScreen extends ConsumerStatefulWidget {
  const AlbumsScreen({super.key});

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen> {
  bool _showArchived = false;

  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(groupsProvider);
    final user = ref.watch(authProvider).value;
    final activeId = ref.watch(activeGroupIdProvider);
    final pending = ref.watch(uploadQueueProvider).length;

    final list = groups.value ?? const <Group>[];
    // Open groups first, then ones an admin closed; my archived ones apart.
    final mine = list.where((g) => !g.archived).toList();
    final active = [...mine.where((g) => !g.isClosed), ...mine.where((g) => g.isClosed)];
    final archived = list.where((g) => g.archived).toList();
    final canShoot = mine.any((g) => !g.isClosed);

    return Scaffold(
      body: RefreshIndicator(
        color: CT.ink,
        onRefresh: () => ref.read(groupsProvider.notifier).reload(),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverSafeArea(
              bottom: false,
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 14, 16, 0),
                  child: Row(children: [
                    Expanded(child: Text('Je albums', style: CT.title(30))),
                    if (pending > 0)
                      IconButton(
                        onPressed: () => context.push('/queue'),
                        icon: Badge(label: Text('$pending'), backgroundColor: CT.accent, child: const Icon(Icons.cloud_upload_outlined)),
                      ),
                    GestureDetector(
                      onTap: () => context.push('/settings'),
                      child: user == null || user.name.isEmpty
                          ? const CircleAvatar(radius: 17, backgroundColor: CT.cream, child: Icon(Icons.person, size: 18, color: CT.muted))
                          : Avatar(initial: user.initial, color: user.color, size: 36),
                    ),
                  ]),
                ),
              ),
            ),
            if (groups.isLoading && list.isEmpty)
              const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: CT.ink)))
            else if (groups.hasError && list.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyState(
                  title: 'Geen verbinding',
                  message: 'Je albums laden zodra je weer internet hebt. De camera werkt gewoon.',
                  action: SizedBox(width: 200, child: CTButton('Opnieuw', onTap: () => ref.read(groupsProvider.notifier).reload())),
                ),
              )
            else if (list.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyState(
                  title: 'Nog geen albums',
                  message: 'Maak een groep voor je volgende trip, of join die van een vriend met de code.',
                  action: Column(children: [
                    SizedBox(width: 240, child: CTButton('Nieuwe groep', kind: CTButtonKind.primary, onTap: () => context.push('/new'))),
                    const SizedBox(height: 10),
                    SizedBox(width: 240, child: CTButton('Ik heb een code', kind: CTButtonKind.outline, onTap: () => showJoinSheet(context))),
                  ]),
                ),
              )
            else ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
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
                        Expanded(child: Text('Join met een code of QR-code', style: CT.text(15, weight: FontWeight.w600))),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !canShoot
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: CTButton('Camera', kind: CTButtonKind.primary, icon: Icons.photo_camera, onTap: () => context.push('/camera')),
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
              Expanded(child: Text('GEARCHIVEERD ($count)', style: CT.label)),
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
            Text('Terugzetten', style: CT.text(14, color: Colors.white, weight: FontWeight.w600)),
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
                    [if (g.startDate != null) Fmt.range(g.startDate, g.endDate), Fmt.count(g.totalCount, 'foto', 'foto\'s')].join(' · '),
                    style: CT.text(12, color: CT.muted),
                  ),
                ]),
              ),
              IconButton(
                tooltip: 'Meer',
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
              child: Text('+ Nieuw', style: CT.text(15, color: CT.muted, weight: FontWeight.w600)),
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
                        ? 'afgesloten · ${g.totalCount}'
                        : [if (isActive) 'actief', if (g.startDate != null) Fmt.range(g.startDate, g.endDate), '${g.totalCount}'].join(' · '),
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
