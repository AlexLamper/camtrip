import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../upload/upload_queue.dart';
import 'groups_controller.dart';
import 'join_sheet.dart';

/// Home: all groups as instant prints, the active one marked.
class AlbumsScreen extends ConsumerWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(groupsProvider);
    final user = ref.watch(authProvider).value;
    final activeId = ref.watch(activeGroupIdProvider);
    final pending = ref.watch(uploadQueueProvider).length;

    final list = groups.value ?? const <Group>[];
    final active = list.where((g) => !g.isArchived).toList();
    final archived = list.where((g) => g.isArchived).toList();

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
                sliver: _grid(context, ref, [...active, if (active.isNotEmpty) null], activeId, showNew: true),
              ),
              if (archived.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(padding: const EdgeInsets.fromLTRB(24, 28, 24, 4), child: Text('ARCHIEF', style: CT.label)),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  sliver: _grid(context, ref, archived, activeId),
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
      floatingActionButton: active.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: CTButton('Camera', kind: CTButtonKind.primary, icon: Icons.photo_camera, onTap: () => context.push('/camera')),
            ),
    );
  }

  Widget _grid(BuildContext context, WidgetRef ref, List<Group?> items, String? activeId, {bool showNew = false}) {
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
          onTap: () => context.push('/group/${g.id}'),
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
                        ? 'archief · ${g.totalCount}'
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
