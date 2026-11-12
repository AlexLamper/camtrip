import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../camera/processor.dart';
import '../groups/groups_controller.dart';
import '../premium/pro_badge.dart';
import '../upload/upload_queue.dart';
import 'gallery_controller.dart';
import 'photo_actions.dart';

class GalleryScreen extends ConsumerStatefulWidget {
  const GalleryScreen({super.key, required this.groupId});
  final String groupId;

  @override
  ConsumerState<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends ConsumerState<GalleryScreen> {
  final _scroll = ScrollController();
  final _sel = PhotoSelection();
  bool get _selecting => _sel.active;
  DownloadProgress? _download;
  String? _groupError;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 600) {
        ref.read(galleryProvider(widget.groupId).notifier).loadMore();
      }
    });
    Future.microtask(_refreshGroup);
  }

  /// Also covers opening a group from a push or link that is not in the list (yet).
  Future<void> _refreshGroup() async {
    try {
      await ref.read(groupsProvider.notifier).refreshOne(widget.groupId);
      if (mounted && _groupError != null) setState(() => _groupError = null);
    } on ApiException catch (e) {
      if (mounted) setState(() => _groupError = e.status == 404 ? 'Deze groep bestaat niet meer, of je bent geen lid meer.' : e.message);
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _saveAll(Group group) async {
    final ids = _selecting ? _sel.ids.toList() : <String>[];
    if (_selecting && ids.isEmpty) return;
    setState(() => _download = DownloadProgress(0, ids.isEmpty ? group.totalCount : ids.length));
    try {
      final n = await Downloader.save(ref.read(apiProvider), group, ids, onProgress: (p) => mounted ? setState(() => _download = p) : null);
      if (!mounted) return;
      showMessage(context, '$n ${n == 1 ? 'foto' : 'foto\'s'} opgeslagen in "CamTrip - ${group.name}"');
      setState(_sel.exit);
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _download = null);
    }
  }

  List<Photo> get _photos => ref.read(galleryProvider(widget.groupId)).photos;
  GalleryController get _ctrl => ref.read(galleryProvider(widget.groupId).notifier);

  /// Deletes the picked photos this user may delete, for the whole group.
  Future<void> _deleteSelected(Group group) async {
    final me = ref.read(authProvider).value?.id;
    final picked = _sel.picked(_photos);
    final allowed = _sel.deletable(_photos, me, group);
    if (allowed.isEmpty) return;
    if (!await confirmDeletePhotos(context, count: allowed.length, notAllowed: picked.length - allowed.length)) return;
    setState(_sel.exit);
    try {
      final r = await _ctrl.deletePhotos(allowed.map((p) => p.id).toList());
      if (!mounted) return;
      final done = '${Fmt.count(r.deleted, 'foto', 'foto\'s')} verwijderd';
      showMessage(context, r.forbidden > 0 ? '$done, ${r.forbidden} overgeslagen' : done);
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  /// "Verbergen voor mij", with "Ongedaan maken" in the SnackBar.
  Future<void> _hideSelected() async {
    final ids = _sel.ids.toList();
    if (ids.isEmpty) return;
    setState(_sel.exit);
    try {
      final hidden = await _ctrl.hide(ids);
      if (!mounted) return;
      showUndo(context, '${Fmt.count(hidden.length, 'foto', 'foto\'s')} verborgen voor jou', () {
        _ctrl.unhide(hidden).catchError((Object e) {
          if (mounted) showMessage(context, ApiException.from(e).message);
        });
      });
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  Future<void> _favoriteSelected() async {
    final target = _sel.favoriteTarget(_photos);
    final ids = _sel.ids.toList();
    setState(_sel.exit);
    try {
      await _ctrl.setFavorite(ids, target);
      if (mounted) showMessage(context, target ? 'Toegevoegd aan favorieten' : 'Uit favorieten gehaald');
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  Future<void> _uploadFromRoll(Group group) async {
    final List<XFile> files;
    try {
      files = await ImagePicker().pickMultiImage(imageQuality: 95, limit: 50);
    } catch (_) {
      if (mounted) showMessage(context, 'Geef CamTrip toegang tot je foto\'s in Instellingen');
      return;
    }
    if (files.isEmpty) return;
    if (mounted) showMessage(context, '${Fmt.count(files.length, 'foto wordt', 'foto\'s worden')} toegevoegd');
    var failed = 0;
    for (final f in files) {
      try {
        await _enqueueRoll(group, f);
      } catch (e) {
        debugPrint('roll upload failed: $e');
        failed++;
      }
    }
    if (failed > 0 && mounted) showMessage(context, '${Fmt.count(failed, 'foto kon', 'foto\'s konden')} niet worden gelezen');
  }

  Future<void> _enqueueRoll(Group group, XFile f) async {
    final bytes = await f.readAsBytes();
    final processed = await processPhoto(bytes, styleId: 'none', applyStyle: false);
    DateTime takenAt;
    try {
      takenAt = await f.lastModified();
    } catch (_) {
      takenAt = DateTime.now();
    }
    await ref.read(uploadQueueProvider.notifier).enqueue(
          groupId: group.id,
          kind: 'photo',
          style: 'roll',
          mime: 'image/jpeg',
          takenAt: takenAt,
          fromRoll: true,
          width: processed.width,
          height: processed.height,
          original: processed.original,
          display: processed.display,
          thumb: processed.thumb,
        );
  }

  @override
  Widget build(BuildContext context) {
    final group = ref.watch(groupProvider(widget.groupId));
    final gallery = ref.watch(galleryProvider(widget.groupId));
    final pending = ref.watch(uploadQueueProvider).where((i) => i.groupId == widget.groupId).length;

    if (group == null) {
      return Scaffold(
        appBar: AppBar(),
        body: _groupError == null
            ? const Center(child: CircularProgressIndicator(color: CT.ink))
            : EmptyState(
                title: 'Groep niet geladen',
                message: _groupError!,
                action: SizedBox(
                  width: 200,
                  child: CTButton('Opnieuw', onTap: () {
                    setState(() => _groupError = null);
                    _refreshGroup();
                  }),
                ),
              ),
      );
    }

    if (_selecting) _sel.retain(gallery.photos.map((p) => p.id));

    return PopScope(
      // Back first leaves selection mode, like the system photo apps.
      canPop: !_selecting,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _selecting) setState(_sel.exit);
      },
      child: Scaffold(
        body: Stack(children: [
          RefreshIndicator(
            color: CT.ink,
            onRefresh: () async {
              await ref.read(galleryProvider(widget.groupId).notifier).refresh();
              await _refreshGroup();
            },
            child: CustomScrollView(
              controller: _scroll,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverSafeArea(bottom: false, sliver: SliverToBoxAdapter(child: _header(group, pending))),
                if (gallery.photos.isEmpty && !gallery.loading)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyState(
                      title: gallery.filter.favorites ? 'Nog geen favorieten' : 'Nog geen foto\'s',
                      message: gallery.error ??
                          (gallery.filter.favorites
                              ? 'Tik op het sterretje bij een foto om hem hier te zetten.'
                              : 'Maak de eerste foto. Iedereen in de groep ziet hem meteen.'),
                      action: gallery.filter.favorites
                          ? null
                          : SizedBox(width: 220, child: CTButton('Open de camera', kind: CTButtonKind.primary, onTap: () => _openCamera(group))),
                    ),
                  ),
                for (final (day, photos) in gallery.byDay) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 18, 22, 12),
                      child: Text(Fmt.day(day), style: CT.title(16)),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.84,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (_, i) => _tile(group, photos[i], photos),
                        childCount: photos.length,
                      ),
                    ),
                  ),
                ],
                if (gallery.loading && gallery.photos.isNotEmpty)
                  const SliverToBoxAdapter(
                    child: Padding(padding: EdgeInsets.all(20), child: Center(child: CircularProgressIndicator(color: CT.ink))),
                  ),
                if (gallery.loading && gallery.photos.isEmpty)
                  const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: CT.ink))),
                const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: _selecting ? _selectionBar(group) : _bottomBar(group)),
        ]),
      ),
    );
  }

  Widget _selectionBar(Group group) {
    final me = ref.watch(authProvider).value?.id;
    final photos = ref.watch(galleryProvider(widget.groupId)).photos;
    final d = _download;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 12 + MediaQuery.of(context).padding.bottom),
      child: SelectionActionBar(
        count: _sel.count,
        busyLabel: d == null ? null : 'Opslaan... ${d.done}/${d.total}',
        favoriteOn: _sel.favoriteTarget(photos),
        onSave: () => _saveAll(group),
        onFavorite: _favoriteSelected,
        onHide: _hideSelected,
        onDelete: _sel.deletable(photos, me, group).isEmpty ? null : () => _deleteSelected(group),
      ),
    );
  }

  /// Replaces the top row while selecting: close, count, "Alles selecteren".
  Widget _selectionHeader(List<Photo> photos) {
    final all = _sel.allSelected(photos.map((p) => p.id));
    return Row(children: [
      IconButton(key: const Key('sel-close'), onPressed: () => setState(_sel.exit), icon: const Icon(Icons.close)),
      Expanded(
        child: Text(
          _sel.count == 0 ? 'Kies foto\'s' : '${_sel.count} geselecteerd',
          textAlign: TextAlign.center,
          style: CT.text(15, weight: FontWeight.w600),
        ),
      ),
      TextButton(
        key: const Key('sel-all'),
        onPressed: photos.isEmpty ? null : () => setState(() => _sel.toggleAll(photos.map((p) => p.id))),
        child: Text(all ? 'Niets selecteren' : 'Alles selecteren', style: CT.text(14, color: CT.accent, weight: FontWeight.w600)),
      ),
    ]);
  }

  void _openCamera(Group group) {
    ref.read(activeGroupIdProvider.notifier).set(group.id);
    context.push('/camera');
  }

  Widget _header(Group group, int pending) {
    final gallery = ref.watch(galleryProvider(widget.groupId));
    final ctrl = ref.read(galleryProvider(widget.groupId).notifier);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (_selecting)
          _selectionHeader(gallery.photos)
        else
          Row(children: [
            IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
            Expanded(
              child: Text(
                [group.code, Fmt.range(group.startDate, group.endDate)].where((s) => s.isNotEmpty).join(' · '),
                textAlign: TextAlign.center,
                style: CT.text(12, color: CT.muted, weight: FontWeight.w500),
              ),
            ),
            IconButton(
              onPressed: () => context.push('/group/${group.id}/settings'),
              icon: const Icon(Icons.more_horiz),
            ),
          ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(group.name, style: CT.title(30)),
            ProViaBadge(group.id),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => context.push('/group/${group.id}/invite'),
              child: Row(children: [
                AvatarStack(group.members),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    '${Fmt.count(group.photoCount, 'foto', 'foto\'s')}${group.videoCount > 0 ? ' · ${Fmt.count(group.videoCount, 'video', 'video\'s')}' : ''}',
                    style: CT.text(13, color: CT.muted),
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.person_add_alt_1_outlined, size: 18, color: CT.muted),
              ]),
            ),
            if (pending > 0) ...[
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => context.push('/queue'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(color: CT.warnBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: CT.warn)),
                  child: Row(children: [
                    const Icon(Icons.cloud_upload_outlined, size: 18, color: CT.warn),
                    const SizedBox(width: 8),
                    Expanded(child: Text('${Fmt.count(pending, 'foto wacht', 'foto\'s wachten')} om gedeeld te worden', style: CT.text(13, weight: FontWeight.w500))),
                    const Icon(Icons.chevron_right, size: 18),
                  ]),
                ),
              ),
            ],
            if (group.hasEnded && group.photoCount >= 3) ...[
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () => context.push('/group/${group.id}/recap'),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(14), boxShadow: CT.cardShadow),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(width: 46, height: 46, child: group.coverUrl == null ? Container(color: CT.cream) : NetPhoto(group.coverUrl!)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Je recap is klaar', style: CT.text(14, weight: FontWeight.w600)),
                        Text('Video met muziek van jullie trip', style: CT.text(12, color: CT.muted)),
                      ]),
                    ),
                    Text('Bekijk ▶', style: CT.text(13, color: CT.accent, weight: FontWeight.w600)),
                  ]),
                ),
              ),
            ] else if (group.photoCount >= 3) ...[
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => context.push('/group/${group.id}/recap'),
                child: Text('🎞️  Maak nu een recap-video', style: CT.text(13, color: CT.accent, weight: FontWeight.w600)),
              ),
            ],
            if (group.deleteAfter != null && group.hasEnded) ...[
              const SizedBox(height: 10),
              Text(
                'Gratis groep: foto\'s blijven tot ${Fmt.shortYear(group.deleteAfter!)}. Sla ze op of neem Pro.',
                style: CT.text(12, color: CT.muted),
              ),
            ],
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                CTChip('Alles', selected: !gallery.filter.favorites && gallery.filter.userId == null, onTap: () => ctrl.setFilter(const GalleryFilter.all())),
                const SizedBox(width: 8),
                CTChip('Favorieten', icon: Icons.star_rounded, selected: gallery.filter.favorites, onTap: () => ctrl.setFilter(const GalleryFilter.favorites())),
                const SizedBox(width: 8),
                CTChip(
                  gallery.filter.userId == null ? 'Per persoon' : (group.member(gallery.filter.userId!)?.name ?? 'Persoon'),
                  icon: Icons.person_outline,
                  selected: gallery.filter.userId != null,
                  onTap: () => _pickPerson(group),
                ),
                const SizedBox(width: 8),
                CTChip(_selecting ? 'Klaar' : 'Selecteer', icon: Icons.check_circle_outline, selected: _selecting, onTap: () {
                  setState(() => _selecting ? _sel.exit() : _sel.active = true);
                }),
                if (group.hiddenCount > 0) ...[
                  const SizedBox(width: 8),
                  CTChip(
                    'Verborgen (${group.hiddenCount})',
                    icon: Icons.visibility_off_outlined,
                    dashed: true,
                    onTap: () => context.push('/group/${group.id}/hidden'),
                  ),
                ],
              ]),
            ),
          ]),
        ),
      ]),
    );
  }

  void _pickPerson(Group group) {
    showModalBottomSheet<void>(
      context: context,
      builder: (c) => SafeArea(
        child: ListView(shrinkWrap: true, padding: const EdgeInsets.fromLTRB(20, 0, 20, 16), children: [
          Text('Foto\'s van...', style: CT.title(22)),
          const SizedBox(height: 8),
          for (final m in group.members)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Avatar.member(m, size: 34),
              title: Text(m.name, style: CT.text(16, weight: FontWeight.w500)),
              onTap: () {
                ref.read(galleryProvider(widget.groupId).notifier).setFilter(GalleryFilter.person(m.id));
                Navigator.pop(c);
              },
            ),
        ]),
      ),
    );
  }

  Widget _tile(Group group, Photo p, List<Photo> dayPhotos) {
    final m = group.member(p.userId);
    final selected = _sel.contains(p.id);
    return GestureDetector(
      onTap: () {
        if (_selecting) {
          setState(() => _sel.toggle(p.id));
        } else {
          final all = ref.read(galleryProvider(widget.groupId)).photos;
          context.push('/group/${group.id}/photo/${p.id}', extra: all.indexOf(p));
        }
      },
      onLongPress: () {
        HapticFeedback.selectionClick();
        setState(() => _selecting ? _sel.toggle(p.id) : _sel.start(p.id));
      },
      child: Stack(clipBehavior: Clip.none, children: [
        AnimatedScale(
          scale: selected ? 0.93 : 1,
          duration: const Duration(milliseconds: 140),
          child: InstantPrint(
            rotation: tiltFor(p.id),
            padding: 6,
            bottom: 26,
            caption: Row(children: [
              if (m != null) Avatar.member(m, size: 17),
              const SizedBox(width: 5),
              Text(Fmt.dm(p.takenAt), style: CT.text(10, color: CT.muted)),
              if (p.fromRoll) ...[const SizedBox(width: 4), Text('· geüpload', style: CT.text(10, color: CT.muted))],
              const Spacer(),
              if (p.isFavorite) const Icon(Icons.star_rounded, size: 13, color: CT.warn),
              if (p.heartCount > 0) ...[
                const SizedBox(width: 2),
                Text('${p.reactions.first.emoji} ${p.heartCount}', style: CT.text(10, weight: FontWeight.w600)),
              ],
            ]),
            child: Stack(fit: StackFit.expand, children: [
              NetPhoto(p.thumbUrl, cacheKey: 'thumb_${p.id}'),
              if (p.isVideo)
                const Center(child: CircleAvatar(radius: 16, backgroundColor: Colors.black45, child: Icon(Icons.play_arrow, color: Colors.white))),
              if (selected) Container(color: Colors.white.withValues(alpha: 0.18)),
            ]),
          ),
        ),
        if (_selecting)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 6)]),
              child: Icon(
                selected ? Icons.check_circle : Icons.radio_button_unchecked,
                key: Key('sel-mark-${p.id}'),
                color: selected ? CT.accent : Colors.white,
                size: 26,
              ),
            ),
          ),
      ]),
    );
  }

  Widget _bottomBar(Group group) {
    final d = _download;
    return Container(
      padding: EdgeInsets.fromLTRB(18, 14, 18, 14 + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [CT.bg.withValues(alpha: 0), CT.bg, CT.bg], stops: const [0, 0.3, 1]),
      ),
      child: Row(children: [
        Expanded(
          child: CTButton(
            d != null
                ? 'Opslaan... ${d.done}/${d.total}'
                : 'Alles opslaan',
            icon: Icons.download_rounded,
            onTap: d != null || group.totalCount == 0 ? null : () => _saveAll(group),
          ),
        ),
        const SizedBox(width: 10),
        if (!group.isArchived) ...[
          SizedBox(
            width: 58,
            child: Material(
              color: CT.paper,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () => _uploadFromRoll(group),
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(color: CT.line, width: 1.5)),
                  child: const Icon(Icons.add_photo_alternate_outlined),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 58,
            child: Material(
              color: CT.accent,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () => _openCamera(group),
                child: const SizedBox(height: 54, child: Icon(Icons.photo_camera, color: Colors.white)),
              ),
            ),
          ),
        ],
      ]),
    );
  }
}
