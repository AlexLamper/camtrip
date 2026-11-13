import 'dart:async';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage, CachedNetworkImageProvider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../groups/groups_controller.dart';
import 'all_photos_controller.dart';
import 'gallery_controller.dart';
import 'photo_actions.dart';

/// "Alle foto's": every photo the user made, from every album, as a black
/// edge-to-edge camera-roll grid (3 square tiles per row, thin gaps). The pill
/// at the top switches to an album; the month of the top row floats under it.
/// Tap opens the photo in its album (swipe works there); long-press or the
/// select button picks photos to save or share.
class AllPhotosScreen extends ConsumerStatefulWidget {
  const AllPhotosScreen({super.key, this.thumbBuilder});

  /// Draws a tile's image. Null = the cached network thumbnail. For previews/tests.
  final Widget Function(Photo photo)? thumbBuilder;

  static const columns = 3;
  static const gap = 1.5;
  static const background = Colors.black;
  static const surface = Color(0xFF1C1C1E);

  @override
  ConsumerState<AllPhotosScreen> createState() => _AllPhotosScreenState();
}

class _AllPhotosScreenState extends ConsumerState<AllPhotosScreen> {
  final _scroll = ScrollController();
  final _sel = PhotoSelection();
  final _topIndex = ValueNotifier<int>(0);
  final _pillKey = GlobalKey();
  final _precached = <String>{};
  String? _opening;
  DownloadProgress? _saving;
  bool _sharing = false;

  static const _barHeight = 52.0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _prefetch(ref.read(allPhotosProvider).photos);
      _fillScreen();
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    _topIndex.dispose();
    super.dispose();
  }

  double get _tile => (MediaQuery.sizeOf(context).width - AllPhotosScreen.gap * (AllPhotosScreen.columns - 1)) / AllPhotosScreen.columns;

  double get _gridTop => MediaQuery.paddingOf(context).top + 8 + _barHeight + 12;

  void _onScroll() {
    final p = _scroll.position;
    // Load the next page well before the end (about two screens ahead).
    if (p.maxScrollExtent - p.pixels < p.viewportDimension * 2) ref.read(allPhotosProvider.notifier).loadMore();
    // Fixed row height, so the top row follows from the offset alone.
    final row = math.max(0, ((p.pixels) / (_tile + AllPhotosScreen.gap)).floor());
    _topIndex.value = row * AllPhotosScreen.columns;
  }

  /// A short list may not fill the screen (no scrolling = no trigger): load on.
  void _fillScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scroll.hasClients) return;
      final p = _scroll.position;
      if (p.maxScrollExtent - p.pixels < p.viewportDimension * 2) ref.read(allPhotosProvider.notifier).loadMore();
    });
  }

  /// Warms the image cache for a newly loaded page, so tiles appear without a flash.
  void _prefetch(List<Photo> photos) {
    if (widget.thumbBuilder != null) return;
    final width = (_tile * MediaQuery.devicePixelRatioOf(context)).round();
    for (final p in photos.take(AllPhotosController.pageSize * 2)) {
      if (!_precached.add(p.id) || p.thumbUrl.isEmpty) continue;
      final provider = ResizeImage(
        CachedNetworkImageProvider(p.thumbUrl, cacheKey: 'thumb_${p.id}'),
        width: width,
        policy: ResizeImagePolicy.fit,
      );
      unawaited(precacheImage(provider, context, onError: (_, _) {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(allPhotosProvider);
    final groups = ref.watch(groupsProvider).value ?? const <Group>[];
    final canShoot = groups.any((g) => !g.archived && !g.isClosed);

    ref.listen(allPhotosProvider, (prev, next) {
      if (prev?.photos.length != next.photos.length) {
        _sel.retain(next.photos.map((p) => p.id));
        _prefetch(next.photos);
        _fillScreen();
      }
    });

    final Widget body;
    if (state.photos.isEmpty && !state.loaded) {
      body = const Center(child: CircularProgressIndicator(color: Colors.white54, strokeWidth: 2.4));
    } else if (state.photos.isEmpty) {
      body = _empty(state, canShoot);
    } else {
      body = RefreshIndicator(
        color: CT.ink,
        edgeOffset: _gridTop,
        onRefresh: () => ref.read(allPhotosProvider.notifier).refresh(),
        child: CustomScrollView(
          controller: _scroll,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(padding: EdgeInsets.only(top: _gridTop)),
            SliverGrid(
              key: const Key('all-photos-grid'),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AllPhotosScreen.columns,
                crossAxisSpacing: AllPhotosScreen.gap,
                mainAxisSpacing: AllPhotosScreen.gap,
              ),
              delegate: SliverChildBuilderDelegate(
                (_, i) => _tileFor(state.photos[i]),
                childCount: state.photos.length,
                findChildIndexCallback: (key) {
                  final id = (key as ValueKey<String>).value;
                  final i = state.photos.indexWhere((p) => p.id == id);
                  return i < 0 ? null : i;
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 140 + MediaQuery.paddingOf(context).bottom,
                child: state.loading && state.hasMore
                    ? const Align(
                        alignment: Alignment(0, -0.6),
                        child: SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white38, strokeWidth: 2)),
                      )
                    : null,
              ),
            ),
          ],
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AllPhotosScreen.background,
        body: Stack(
          children: [
            Positioned.fill(child: body),
            Positioned(left: 0, right: 0, top: 0, child: _topBar(state, groups)),
            if (state.photos.isNotEmpty) _monthLabel(state.photos),
            Positioned(
              left: 20,
              right: 20,
              bottom: 16 + MediaQuery.paddingOf(context).bottom,
              child: _sel.active ? _selectionBar(state) : _cameraRow(canShoot && state.photos.isNotEmpty),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------- top

  Widget _topBar(AllPhotosState state, List<Group> groups) {
    final l = context.l10n;
    final top = MediaQuery.paddingOf(context).top;
    return Container(
      padding: EdgeInsets.fromLTRB(16, top + 8, 16, 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Color(0xE6000000), Color(0x00000000)],
          stops: [0, 0.75, 1],
        ),
      ),
      child: SizedBox(
        height: _barHeight,
        child: Row(
          children: [
            _roundButton(
              key: const Key('all-photos-settings'),
              icon: _sel.active ? Icons.close_rounded : Icons.settings_rounded,
              tooltip: _sel.active ? l.cancel : l.settings,
              onTap: _sel.active ? () => setState(_sel.exit) : () => context.push('/settings'),
            ),
            Expanded(
              child: Center(
                child: _sel.active
                    ? Text(
                        l.selectedCount(_sel.count),
                        style: CT.text(17, color: Colors.white, weight: FontWeight.w600),
                      )
                    : _pill(groups),
              ),
            ),
            _roundButton(
              key: const Key('all-photos-select'),
              icon: _sel.active
                  ? (_sel.allSelected(state.photos.map((p) => p.id)) ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded)
                  : Icons.check_box_outlined,
              tooltip: _sel.active ? l.selectAll : l.select,
              onTap: state.photos.isEmpty
                  ? null
                  : () => setState(() {
                      if (_sel.active) {
                        _sel.toggleAll(state.photos.map((p) => p.id));
                      } else {
                        _sel.active = true;
                      }
                    }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundButton({required Key key, required IconData icon, required String tooltip, VoidCallback? onTap}) => Tooltip(
    message: tooltip,
    child: Material(
      key: key,
      color: AllPhotosScreen.surface,
      shape: const CircleBorder(side: BorderSide(color: Color(0x1FFFFFFF))),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: _barHeight,
          height: _barHeight,
          child: Icon(icon, color: onTap == null ? Colors.white30 : Colors.white, size: 26),
        ),
      ),
    ),
  );

  Widget _pill(List<Group> groups) => Semantics(
    button: true,
    label: context.l10n.allPhotosChooseAlbum,
    child: Material(
      key: _pillKey,
      color: AllPhotosScreen.surface,
      shape: const StadiumBorder(side: BorderSide(color: Color(0x1FFFFFFF))),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: const Key('all-photos-pill'),
        onTap: () => _chooseAlbum(groups),
        child: Container(
          height: _barHeight,
          constraints: const BoxConstraints(minWidth: 150),
          padding: const EdgeInsets.only(left: 22, right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  context.l10n.allPhotosTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CT.text(17, color: Colors.white, weight: FontWeight.w600, height: 1.2),
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 24),
            ],
          ),
        ),
      ),
    ),
  );

  /// Dropdown under the pill: "Alle foto's" (here) or one of the albums.
  Future<void> _chooseAlbum(List<Group> groups) async {
    final box = _pillKey.currentContext?.findRenderObject() as RenderBox?;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    if (box == null) return;
    final topLeft = box.localToGlobal(Offset(0, box.size.height + 6), ancestor: overlay);
    final ordered = [...groups.where((g) => !g.archived), ...groups.where((g) => g.archived)];
    final picked = await showMenu<String>(
      context: context,
      color: AllPhotosScreen.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      constraints: BoxConstraints(minWidth: box.size.width, maxWidth: math.max(box.size.width, 280)),
      position: RelativeRect.fromRect(topLeft & Size(box.size.width, 0), Offset.zero & overlay.size),
      items: [
        PopupMenuItem<String>(
          value: '',
          height: 48,
          child: Row(
            children: [
              const Icon(Icons.photo_library_rounded, color: Colors.white, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.l10n.allPhotosTitle,
                  style: CT.text(15, color: Colors.white, weight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.check_rounded, color: CT.accent, size: 20),
            ],
          ),
        ),
        if (ordered.isNotEmpty) const PopupMenuDivider(height: 8),
        for (final g in ordered)
          PopupMenuItem<String>(
            value: g.id,
            height: 52,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: g.coverUrl == null
                        ? Container(
                            color: const Color(0xFF2C2C2E),
                            child: const Icon(Icons.photo_camera_outlined, size: 16, color: Colors.white54),
                          )
                        : NetPhoto(g.coverUrl!, cacheKey: 'cover_${g.id}_${g.photoCount}'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    g.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CT.text(15, color: Colors.white, weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(width: 8),
                Text('${g.totalCount}', style: CT.text(13, color: Colors.white54)),
              ],
            ),
          ),
      ],
    );
    if (picked == null || picked.isEmpty || !mounted) return;
    context.push('/group/$picked');
  }

  /// Floating month of the top row ("juli 2027"), like a camera roll.
  Widget _monthLabel(List<Photo> photos) => Positioned(
    left: 12,
    top: _gridTop + 8,
    child: IgnorePointer(
      child: ValueListenableBuilder<int>(
        valueListenable: _topIndex,
        builder: (_, i, _) {
          final p = photos[i.clamp(0, photos.length - 1)];
          final label = DateFormat.yMMMM(L10n.intlLocale).format(p.takenAt.toLocal());
          return Container(
            key: const Key('all-photos-month'),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: const Color(0x99000000), borderRadius: BorderRadius.circular(20)),
            child: Text(
              label,
              style: CT.text(12.5, color: Colors.white, weight: FontWeight.w600, height: 1.2),
            ),
          );
        },
      ),
    ),
  );

  // ---------------------------------------------------------------- grid

  Widget _tileFor(Photo p) {
    final selected = _sel.contains(p.id);
    final dpr = MediaQuery.devicePixelRatioOf(context);
    return GestureDetector(
      key: ValueKey(p.id),
      onTap: () {
        if (_sel.active) {
          setState(() => _sel.toggle(p.id));
        } else {
          _open(p);
        }
      },
      onLongPress: () {
        HapticFeedback.selectionClick();
        setState(() => _sel.active ? _sel.toggle(p.id) : _sel.start(p.id));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget.thumbBuilder?.call(p) ??
              CachedNetworkImage(
                imageUrl: p.thumbUrl,
                cacheKey: 'thumb_${p.id}', // same cache as the album grid
                memCacheWidth: (_tile * dpr).round(),
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 120),
                placeholder: (_, _) => const ColoredBox(color: Color(0xFF161616)),
                errorWidget: (_, _, _) => const ColoredBox(
                  color: Color(0xFF161616),
                  child: Icon(Icons.broken_image_outlined, color: Colors.white24),
                ),
              ),
          if (p.isVideo)
            Positioned(
              right: 6,
              bottom: 5,
              child: Row(
                key: Key('video-badge-${p.id}'),
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 16,
                    shadows: [Shadow(color: Color(0x99000000), blurRadius: 4)],
                  ),
                  Text(
                    formatDuration(p.durationMs),
                    style: CT
                        .text(12, color: Colors.white, weight: FontWeight.w600, height: 1)
                        .copyWith(shadows: const [Shadow(color: Color(0x99000000), blurRadius: 4)]),
                  ),
                ],
              ),
            ),
          if (selected) const ColoredBox(color: Color(0x40FFFFFF)),
          if (_sel.active)
            Positioned(
              right: 6,
              bottom: p.isVideo ? null : 6,
              top: p.isVideo ? 6 : null,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? Colors.white : const Color(0x33000000),
                  boxShadow: const [BoxShadow(color: Color(0x40000000), blurRadius: 4)],
                ),
                child: Icon(
                  selected ? Icons.check_circle : Icons.radio_button_unchecked,
                  key: Key('sel-mark-${p.id}'),
                  color: selected ? CT.accent : Colors.white,
                  size: 24,
                ),
              ),
            ),
          if (_opening == p.id)
            const ColoredBox(
              color: Color(0x66000000),
              child: Center(
                child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
              ),
            ),
        ],
      ),
    );
  }

  /// Opens the photo in its own album's viewer (swipe works there). That
  /// viewer reads the album's gallery, so make sure the photo is loaded in it.
  Future<void> _open(Photo p) async {
    if (_opening != null) return;
    final gid = p.groupId;
    setState(() => _opening = p.id);
    try {
      final gallery = ref.read(galleryProvider(gid).notifier);
      await _untilIdle(gid);
      if (ref.read(galleryProvider(gid)).filter != const GalleryFilter.all()) await gallery.setFilter(const GalleryFilter.all());
      for (var i = 0; i < 25; i++) {
        final s = ref.read(galleryProvider(gid));
        if (s.photos.any((x) => x.id == p.id) || !s.hasMore || s.error != null) break;
        await gallery.loadMore();
        await _untilIdle(gid);
      }
      if (!mounted) return;
      final photos = ref.read(galleryProvider(gid)).photos;
      final index = photos.indexWhere((x) => x.id == p.id);
      if (index >= 0) {
        unawaited(context.push('/group/$gid/photo/${p.id}', extra: index));
      } else {
        unawaited(context.push('/group/$gid'));
      }
    } finally {
      if (mounted) setState(() => _opening = null);
    }
  }

  Future<void> _untilIdle(String gid) async {
    if (!ref.read(galleryProvider(gid)).loading) return;
    final done = Completer<void>();
    final sub = ref.listenManual(galleryProvider(gid), (_, s) {
      if (!s.loading && !done.isCompleted) done.complete();
    });
    try {
      await done.future.timeout(const Duration(seconds: 20));
    } on TimeoutException {
      // Open anyway; the viewer shows what it has.
    } finally {
      sub.close();
    }
  }

  // ---------------------------------------------------------------- bottom

  Widget _cameraRow(bool show) => Align(
    alignment: Alignment.centerLeft,
    child: !show
        ? const SizedBox.shrink()
        : Tooltip(
            message: context.l10n.camera,
            child: Material(
              key: const Key('all-photos-camera'),
              color: const Color(0xFFE6E6E6),
              shape: const CircleBorder(),
              elevation: 2,
              shadowColor: Colors.black54,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => context.push('/camera'),
                child: const SizedBox(width: 76, height: 76, child: Icon(Icons.photo_camera_rounded, color: Colors.black, size: 32)),
              ),
            ),
          ),
  );

  Widget _selectionBar(AllPhotosState state) {
    final l = context.l10n;
    final enabled = _sel.count > 0 && _saving == null && !_sharing;
    Widget action(Key key, IconData icon, String label, VoidCallback onTap) => Expanded(
      child: Opacity(
        opacity: enabled ? 1 : 0.35,
        child: InkWell(
          key: key,
          borderRadius: BorderRadius.circular(12),
          onTap: enabled ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 22),
                const SizedBox(height: 4),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CT.text(12, color: Colors.white, weight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    final saving = _saving;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AllPhotosScreen.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: saving != null || _sharing
          ? SizedBox(
              height: 58,
              child: Center(
                child: saving != null
                    ? Text(
                        l.savingProgress(saving.done, saving.total),
                        style: CT.text(14, color: Colors.white, weight: FontWeight.w600),
                      )
                    : const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
              ),
            )
          : Row(
              children: [
                action(const Key('sel-save'), Icons.download_rounded, l.save, () => _save(state)),
                action(const Key('sel-share'), Icons.ios_share, l.share, () => _share(state)),
              ],
            ),
    );
  }

  /// Saves the picked photos into each album's own phone album ("CamTrip - groep").
  Future<void> _save(AllPhotosState state) async {
    final picked = _sel.picked(state.photos);
    if (picked.isEmpty) return;
    final byGroup = <String, List<String>>{};
    for (final p in picked) {
      byGroup.putIfAbsent(p.groupId, () => []).add(p.id);
    }
    setState(() => _saving = DownloadProgress(0, picked.length));
    try {
      var offset = 0;
      for (final e in byGroup.entries) {
        final group = ref.read(groupProvider(e.key));
        if (group == null) continue;
        final base = offset;
        await Downloader.save(
          ref.read(apiProvider),
          group,
          e.value,
          onProgress: (d) => mounted ? setState(() => _saving = DownloadProgress(base + d.done, picked.length)) : null,
        );
        offset += e.value.length;
      }
      if (!mounted) return;
      setState(_sel.exit);
      showMessage(context, context.l10n.savedToAlbum);
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _saving = null);
    }
  }

  Future<void> _share(AllPhotosState state) async {
    final picked = _sel.picked(state.photos);
    if (picked.isEmpty) return;
    setState(() => _sharing = true);
    try {
      final tmp = await getTemporaryDirectory();
      final files = <XFile>[];
      for (final p in picked) {
        final url = p.isVideo ? p.videoUrl : p.displayUrl;
        if (url == null || url.isEmpty) continue;
        final path = '${tmp.path}/share_${p.id}.${p.isVideo ? 'mp4' : 'jpg'}';
        await Api.download(url, path);
        files.add(XFile(path));
      }
      if (files.isEmpty) throw ApiException(L10n.current.shareFailed);
      await SharePlus.instance.share(ShareParams(files: files));
    } catch (_) {
      if (mounted) showMessage(context, context.l10n.shareFailed);
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  // ---------------------------------------------------------------- empty

  Widget _empty(AllPhotosState state, bool canShoot) {
    final l = context.l10n;
    final failed = state.error != null;
    return RefreshIndicator(
      color: CT.ink,
      edgeOffset: _gridTop,
      onRefresh: () => ref.read(allPhotosProvider.notifier).refresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(failed ? Icons.cloud_off_rounded : Icons.photo_camera_outlined, size: 44, color: Colors.white54),
                    const SizedBox(height: 14),
                    Text(
                      failed ? l.allPhotosLoadFailed : l.allPhotosEmptyTitle,
                      textAlign: TextAlign.center,
                      style: CT.title(24, color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      failed ? state.error! : l.allPhotosEmptyMessage,
                      textAlign: TextAlign.center,
                      style: CT.text(15, color: Colors.white60),
                    ),
                    const SizedBox(height: 22),
                    if (failed)
                      SizedBox(
                        width: 220,
                        child: CTButton(l.retry, kind: CTButtonKind.ghost, onTap: () => ref.read(allPhotosProvider.notifier).refresh()),
                      )
                    else if (canShoot)
                      SizedBox(
                        width: 240,
                        child: CTButton(
                          l.allPhotosOpenCamera,
                          kind: CTButtonKind.primary,
                          icon: Icons.photo_camera,
                          onTap: () => context.push('/camera'),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Entry on the albums screen: a dark full-width card with a small mosaic of
/// the newest own photos. Opens /photos.
class AllPhotosEntryCard extends ConsumerWidget {
  const AllPhotosEntryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(allPhotosProvider.select((s) => s.photos.take(4).toList()));
    final l = context.l10n;
    Widget cell(int i) => i < photos.length
        ? NetPhoto(photos[i].thumbUrl, cacheKey: 'thumb_${photos[i].id}')
        : const ColoredBox(color: Color(0xFF2C2C2E));
    return Material(
      key: const Key('all-photos-entry'),
      color: CT.ink,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/photos'),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 62,
                height: 62,
                child: Column(children: [
                  Expanded(child: Row(children: [Expanded(child: cell(0)), const SizedBox(width: 1.5), Expanded(child: cell(1))])),
                  const SizedBox(height: 1.5),
                  Expanded(child: Row(children: [Expanded(child: cell(2)), const SizedBox(width: 1.5), Expanded(child: cell(3))])),
                ]),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.allPhotosTitle, style: CT.text(17, color: Colors.white, weight: FontWeight.w600, height: 1.2)),
                const SizedBox(height: 3),
                Text(l.allPhotosSubtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: CT.text(12.5, color: Colors.white60, height: 1.3)),
              ]),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.white70),
          ]),
        ),
      ),
    );
  }
}
