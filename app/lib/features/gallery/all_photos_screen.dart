import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage, CachedNetworkImageProvider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../groups/groups_controller.dart';
import 'all_photos_controller.dart';
import 'gallery_controller.dart';
import 'photo_actions.dart';

/// "Alle foto's", the second tab of the home screen: every photo the user
/// made, from every album, newest first, as an edge-to-edge grid of square
/// tiles (3 per row, thin gaps). Tap opens the photo in its album's viewer;
/// long-press starts the same selection mode as an album gallery.
///
/// The home screen owns [selection] (its top row turns into the selection
/// header and the camera button hides); this view calls [onSelectionChanged]
/// after every change.
class AllPhotosView extends ConsumerStatefulWidget {
  const AllPhotosView({super.key, required this.selection, required this.onSelectionChanged, this.thumbBuilder});

  final PhotoSelection selection;
  final VoidCallback onSelectionChanged;

  /// Draws a tile's image. Null = the cached network thumbnail. For previews/tests.
  final Widget Function(Photo photo)? thumbBuilder;

  static const columns = 3;
  static const gap = 2.0;

  @override
  ConsumerState<AllPhotosView> createState() => _AllPhotosViewState();
}

class _AllPhotosViewState extends ConsumerState<AllPhotosView> {
  final _scroll = ScrollController();
  final _precached = <String>{};
  String? _opening;
  DownloadProgress? _download;

  PhotoSelection get _sel => widget.selection;
  AllPhotosController get _ctrl => ref.read(allPhotosProvider.notifier);

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
    super.dispose();
  }

  void _change(VoidCallback fn) {
    fn();
    widget.onSelectionChanged();
  }

  double get _tile => (MediaQuery.sizeOf(context).width - AllPhotosView.gap * (AllPhotosView.columns - 1)) / AllPhotosView.columns;

  void _onScroll() {
    final p = _scroll.position;
    // Load the next page well before the end (about two screens ahead).
    if (p.maxScrollExtent - p.pixels < p.viewportDimension * 2) _ctrl.loadMore();
  }

  /// A short list may not fill the screen (no scrolling = no trigger): load on.
  void _fillScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scroll.hasClients) return;
      final p = _scroll.position;
      if (p.maxScrollExtent - p.pixels < p.viewportDimension * 2) _ctrl.loadMore();
    });
  }

  /// Warms the image cache for a newly loaded page, so tiles appear without a flash.
  void _prefetch(List<Photo> photos) {
    if (widget.thumbBuilder != null) return;
    final width = (_tile * MediaQuery.devicePixelRatioOf(context)).round();
    for (final p in photos.take(AllPhotosController.pageSize * 2)) {
      if (!_precached.add(p.id) || p.thumbUrl.isEmpty) continue;
      final provider = ResizeImage(CachedNetworkImageProvider(p.thumbUrl, cacheKey: 'thumb_${p.id}'), width: width, policy: ResizeImagePolicy.fit);
      unawaited(precacheImage(provider, context, onError: (_, _) {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(allPhotosProvider);
    final l = context.l10n;

    ref.listen(allPhotosProvider, (prev, next) {
      if (prev?.photos.length != next.photos.length) {
        if (_sel.active) _change(() => _sel.retain(next.photos.map((p) => p.id)));
        _prefetch(next.photos);
        _fillScreen();
      }
    });

    final Widget body;
    if (state.photos.isEmpty && !state.loaded) {
      body = const Center(child: CircularProgressIndicator(color: CT.ink));
    } else {
      body = RefreshIndicator(
        color: CT.ink,
        onRefresh: () => _ctrl.refresh(),
        child: CustomScrollView(
          controller: _scroll,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            if (state.photos.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: state.error != null
                    ? EmptyState(
                        title: l.allPhotosLoadFailed,
                        message: state.error!,
                        action: SizedBox(width: 200, child: CTButton(l.retry, onTap: () => _ctrl.refresh())),
                      )
                    : EmptyState(title: l.allPhotosEmptyTitle, message: l.allPhotosEmptyMessage),
              )
            else ...[
              SliverGrid(
                key: const Key('all-photos-grid'),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: AllPhotosView.columns,
                  crossAxisSpacing: AllPhotosView.gap,
                  mainAxisSpacing: AllPhotosView.gap,
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
                  height: 120,
                  child: state.loading && state.hasMore
                      ? const Align(
                          alignment: Alignment(0, -0.5),
                          child: SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: CT.ink, strokeWidth: 2)),
                        )
                      : null,
                ),
              ),
            ],
          ],
        ),
      );
    }

    return Stack(children: [
      Positioned.fill(child: body),
      if (_sel.active) Positioned(left: 0, right: 0, bottom: 0, child: _selectionBar(state.photos)),
    ]);
  }

  // ---------------------------------------------------------------- grid

  Widget _tileFor(Photo p) {
    final selected = _sel.contains(p.id);
    final dpr = MediaQuery.devicePixelRatioOf(context);
    return GestureDetector(
      key: ValueKey(p.id),
      onTap: () {
        if (_sel.active) {
          _change(() => _sel.toggle(p.id));
        } else {
          _open(p);
        }
      },
      onLongPress: () {
        HapticFeedback.selectionClick();
        _change(() => _sel.active ? _sel.toggle(p.id) : _sel.start(p.id));
      },
      child: Stack(fit: StackFit.expand, children: [
        widget.thumbBuilder?.call(p) ??
            CachedNetworkImage(
              imageUrl: p.thumbUrl,
              cacheKey: 'thumb_${p.id}', // same cache as the album grid
              memCacheWidth: (_tile * dpr).round(),
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 120),
              placeholder: (_, _) => const ColoredBox(color: CT.cream),
              errorWidget: (_, _, _) => const ColoredBox(
                color: CT.cream,
                child: Icon(Icons.broken_image_outlined, color: CT.muted),
              ),
            ),
        if (p.isVideo)
          Positioned(
            right: 6,
            bottom: 5,
            child: Row(key: Key('video-badge-${p.id}'), mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 16, shadows: [Shadow(color: Color(0x99000000), blurRadius: 4)]),
              Text(
                formatDuration(p.durationMs),
                style: CT
                    .text(12, color: Colors.white, weight: FontWeight.w600, height: 1)
                    .copyWith(shadows: const [Shadow(color: Color(0x99000000), blurRadius: 4)]),
              ),
            ]),
          ),
        if (selected) ColoredBox(color: Colors.white.withValues(alpha: 0.3)),
        if (_sel.active)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 6)]),
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
            child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))),
          ),
      ]),
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

  // ---------------------------------------------------------------- selection

  Widget _selectionBar(List<Photo> photos) {
    final me = ref.watch(authProvider).value?.id;
    final d = _download;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 12 + MediaQuery.paddingOf(context).bottom),
      child: SelectionActionBar(
        count: _sel.count,
        busyLabel: d == null ? null : context.l10n.savingProgress(d.done, d.total),
        favoriteOn: _sel.favoriteTarget(photos),
        onSave: () => _save(photos),
        onFavorite: () => _favorite(photos),
        onHide: () => _hide(photos),
        onDelete: _deletable(photos, me).isEmpty ? null : () => _delete(photos, me),
      ),
    );
  }

  /// The picked photos per album, since every album action goes to its own group.
  Map<String, List<Photo>> _byGroup(List<Photo> photos) {
    final out = <String, List<Photo>>{};
    for (final p in photos) {
      out.putIfAbsent(p.groupId, () => []).add(p);
    }
    return out;
  }

  List<Photo> _deletable(List<Photo> photos, String? me) =>
      _sel.picked(photos).where((p) => p.canDelete(me, ref.read(groupProvider(p.groupId)))).toList();

  /// Saves the picked photos into each album's own phone album ("CamTrip - groep").
  Future<void> _save(List<Photo> photos) async {
    final picked = _sel.picked(photos);
    if (picked.isEmpty) return;
    setState(() => _download = DownloadProgress(0, picked.length));
    try {
      var offset = 0;
      for (final e in _byGroup(picked).entries) {
        final group = ref.read(groupProvider(e.key));
        if (group == null) continue;
        final base = offset;
        await Downloader.save(
          ref.read(apiProvider),
          group,
          e.value.map((p) => p.id).toList(),
          onProgress: (d) => mounted ? setState(() => _download = DownloadProgress(base + d.done, picked.length)) : null,
        );
        offset += e.value.length;
      }
      if (!mounted) return;
      _change(_sel.exit);
      showMessage(context, context.l10n.savedToAlbum);
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _download = null);
    }
  }

  Future<void> _favorite(List<Photo> photos) async {
    final picked = _sel.picked(photos);
    final target = _sel.favoriteTarget(photos);
    final changed = picked.where((p) => p.isFavorite != target).map((p) => p.id).toSet();
    _change(_sel.exit);
    _ctrl.setFavoriteLocal(changed, target);
    try {
      for (final e in _byGroup(picked).entries) {
        await ref.read(galleryProvider(e.key).notifier).setFavorite(e.value.map((p) => p.id).toList(), target);
      }
      if (mounted) showMessage(context, target ? context.l10n.addedToFavorites : context.l10n.removedFromFavorites);
    } catch (e) {
      _ctrl.setFavoriteLocal(changed, !target);
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  /// "Verbergen voor mij", with "Ongedaan maken" in the SnackBar.
  Future<void> _hide(List<Photo> photos) async {
    final picked = _sel.picked(photos);
    if (picked.isEmpty) return;
    _change(_sel.exit);
    final removed = _ctrl.removeLocal(picked.map((p) => p.id).toSet());
    final groups = _byGroup(removed);
    try {
      for (final e in groups.entries) {
        await ref.read(galleryProvider(e.key).notifier).hide(e.value.map((p) => p.id).toList());
      }
      if (!mounted) return;
      showUndo(context, context.l10n.photosHiddenForYou(removed.length), () async {
        _ctrl.restoreLocal(removed);
        try {
          for (final e in groups.entries) {
            await ref.read(galleryProvider(e.key).notifier).unhide(e.value);
          }
        } catch (e) {
          if (mounted) showMessage(context, ApiException.from(e).message);
          unawaited(_ctrl.refresh());
        }
      });
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
      unawaited(_ctrl.refresh());
    }
  }

  /// Deletes the picked photos this user may delete, for the whole album.
  Future<void> _delete(List<Photo> photos, String? me) async {
    final picked = _sel.picked(photos);
    final allowed = _deletable(photos, me);
    if (allowed.isEmpty) return;
    if (!await confirmDeletePhotos(context, count: allowed.length, notAllowed: picked.length - allowed.length)) return;
    _change(_sel.exit);
    _ctrl.removeLocal(allowed.map((p) => p.id).toSet());
    var deleted = 0, forbidden = 0;
    try {
      for (final e in _byGroup(allowed).entries) {
        final r = await ref.read(galleryProvider(e.key).notifier).deletePhotos(e.value.map((p) => p.id).toList());
        deleted += r.deleted;
        forbidden += r.forbidden;
      }
      if (forbidden > 0) unawaited(_ctrl.refresh());
      if (!mounted) return;
      final l = context.l10n;
      showMessage(context, forbidden > 0 ? l.photosDeletedSkipped(deleted, forbidden) : l.photosDeleted(deleted));
    } catch (e) {
      unawaited(_ctrl.refresh());
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }
}
