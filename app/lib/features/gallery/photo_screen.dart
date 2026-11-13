import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../groups/groups_controller.dart';
import 'all_photos_controller.dart' show formatDuration;
import 'gallery_controller.dart';
import 'photo_actions.dart';

const reactionEmojis = ['❤️', '😂', '🔥', '😍', '😮', '👏'];

/// Hero tag of a photo: a grid tile wrapped in `Hero(tag: photoHeroTag(id))`
/// flies into (and back out of) the full-screen viewer.
String photoHeroTag(String photoId) => 'photo-$photoId';

/// Builds the picture of a photo in the viewer (tests and previews: no network).
typedef PhotoImageBuilder = Widget Function(Photo photo);

/// Full-screen photo viewer (route /group/:id/photo/:photoId): the picture
/// edge to edge on black, swipe between photos, pinch or double-tap to zoom,
/// swipe down to close, a tap hides the bars (and the status bar).
/// Reads the photos from [galleryProvider] of [groupId], so it works for any
/// gallery that keeps its photos there (album, "Alle foto's", own roll).
class PhotoScreen extends ConsumerStatefulWidget {
  const PhotoScreen({super.key, required this.groupId, required this.photoId, this.initialIndex, this.imageBuilder});
  final String groupId;
  final String photoId;
  final int? initialIndex;
  final PhotoImageBuilder? imageBuilder;

  /// Shows (false) or hides (true) the status and navigation bars. Tests replace it.
  @visibleForTesting
  static void Function(bool hidden) setSystemBars = _setSystemBars;

  static void _setSystemBars(bool hidden) {
    SystemChrome.setEnabledSystemUIMode(hidden ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge).catchError((Object _) {});
  }

  /// Height of the bottom action bar (without the safe area).
  static const barHeight = 64.0;

  /// Height of the compact reactions row above it.
  static const reactionsHeight = 44.0;

  @override
  ConsumerState<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends ConsumerState<PhotoScreen> with TickerProviderStateMixin {
  PageController? _pages;
  late int _index;
  bool _located = false;

  /// Bars visible (false = immersive).
  bool _chrome = true;

  /// One zoom per photo; the others are reset when the page changes.
  final Map<String, TransformationController> _zoom = {};
  bool _zoomed = false;
  Offset _doubleTapAt = Offset.zero;
  late final AnimationController _zoomAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 220));
  Animation<Matrix4>? _zoomTween;
  TransformationController? _zoomTarget;

  /// Swipe-down-to-close offset.
  double _drag = 0;
  late final AnimationController _dragAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  double _dragFrom = 0;

  bool _saving = false;
  bool _sharing = false;
  bool _deleting = false;

  GalleryController get _gallery => ref.read(galleryProvider(widget.groupId).notifier);

  @override
  void initState() {
    super.initState();
    final photos = ref.read(galleryProvider(widget.groupId)).photos;
    final i = photos.indexWhere((p) => p.id == widget.photoId);
    _located = i >= 0;
    _index = i < 0 ? (widget.initialIndex ?? 0) : i;
    _zoomAnim.addListener(() {
      final t = _zoomTween;
      if (t != null) _zoomTarget?.value = t.value;
    });
    _dragAnim.addListener(() => setState(() => _drag = _dragFrom * (1 - Curves.easeOut.transform(_dragAnim.value))));
    WidgetsBinding.instance.addPostFrameCallback((_) => _precacheAround(_index));
  }

  @override
  void dispose() {
    if (!_chrome) PhotoScreen.setSystemBars(false);
    _pages?.dispose();
    _zoomAnim.dispose();
    _dragAnim.dispose();
    for (final c in _zoom.values) {
      c.dispose();
    }
    super.dispose();
  }

  // ---------------------------------------------------------------- chrome

  void _toggleChrome() {
    setState(() => _chrome = !_chrome);
    PhotoScreen.setSystemBars(!_chrome);
  }

  void _close() => Navigator.of(context).maybePop();

  // ---------------------------------------------------------------- zoom

  TransformationController _zoomFor(String id) => _zoom.putIfAbsent(id, () {
        final c = TransformationController();
        c.addListener(() => _onZoom(id, c));
        return c;
      });

  void _onZoom(String id, TransformationController c) {
    final photos = ref.read(galleryProvider(widget.groupId)).photos;
    if (photos.isEmpty || photos[_index.clamp(0, photos.length - 1)].id != id) return;
    final zoomed = c.value.getMaxScaleOnAxis() > 1.01;
    if (zoomed != _zoomed) setState(() => _zoomed = zoomed);
  }

  void _resetZoom({String? except}) {
    _zoomAnim.stop();
    for (final e in _zoom.entries) {
      if (e.key != except) e.value.value = Matrix4.identity();
    }
  }

  /// Double tap: zoom in 2.5x around the tap, or back out when zoomed.
  void _doubleTap(String id) {
    final c = _zoomFor(id);
    final zoomedIn = c.value.getMaxScaleOnAxis() > 1.01;
    const s = 2.5;
    final p = _doubleTapAt;
    final target = zoomedIn ? Matrix4.identity() : (Matrix4.diagonal3Values(s, s, 1)..setTranslationRaw(-p.dx * (s - 1), -p.dy * (s - 1), 0));
    _zoomTarget = c;
    _zoomTween = Matrix4Tween(begin: c.value.clone(), end: target).animate(CurvedAnimation(parent: _zoomAnim, curve: Curves.easeOutCubic));
    _zoomAnim.forward(from: 0);
  }

  // ---------------------------------------------------------------- swipe down

  void _dragUpdate(DragUpdateDetails d) {
    _dragAnim.stop();
    setState(() => _drag = (_drag + d.delta.dy).clamp(0, double.infinity));
  }

  void _dragEnd(DragEndDetails d) {
    if (_drag > 120 || (d.primaryVelocity ?? 0) > 900) {
      _close();
      return;
    }
    _dragFrom = _drag;
    _dragAnim.forward(from: 0);
  }

  // ---------------------------------------------------------------- pages

  void _onPage(int i, List<Photo> photos) {
    setState(() {
      _index = i;
      _zoomed = false;
    });
    _resetZoom(except: photos[i].id);
    _precacheAround(i);
    if (i > photos.length - 5) _gallery.loadMore();
  }

  /// Display versions of the neighbours, so a swipe shows them sharp at once.
  void _precacheAround(int i) {
    if (!mounted || widget.imageBuilder != null) return;
    final photos = ref.read(galleryProvider(widget.groupId)).photos;
    for (final j in [i - 1, i + 1]) {
      if (j < 0 || j >= photos.length || photos[j].isVideo || photos[j].displayUrl.isEmpty) continue;
      precacheImage(CachedNetworkImageProvider(photos[j].displayUrl, cacheKey: 'display_${photos[j].id}'), context).catchError((Object _) {});
    }
  }

  // ---------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    ref.listen(galleryProvider(widget.groupId), (_, next) {
      if (_located) return;
      final i = next.photos.indexWhere((p) => p.id == widget.photoId);
      if (i < 0) return;
      _located = true;
      setState(() => _index = i);
      if (_pages?.hasClients ?? false) _pages!.jumpToPage(i);
    });
    final gallery = ref.watch(galleryProvider(widget.groupId));
    final group = ref.watch(groupProvider(widget.groupId));
    final me = ref.watch(authProvider).value?.id;
    final photos = gallery.photos;

    final fade = (1 - _drag / 500).clamp(0.2, 1.0);
    final chromeOn = _chrome && _drag == 0;

    Widget body;
    if (photos.isEmpty) {
      body = Stack(children: [
        if (gallery.loading) const Center(child: CircularProgressIndicator(color: Colors.white)),
        Positioned(top: 0, left: 0, right: 0, child: SafeArea(bottom: false, child: _closeButton())),
      ]);
    } else {
      final index = _index.clamp(0, photos.length - 1);
      final photo = photos[index];
      final pages = _pages ??= PageController(initialPage: index);
      final pad = MediaQuery.paddingOf(context);
      final bottomChrome = pad.bottom + PhotoScreen.barHeight + PhotoScreen.reactionsHeight + 8;
      body = Stack(fit: StackFit.expand, children: [
        GestureDetector(
          key: const Key('photo-dismiss'),
          onVerticalDragUpdate: _zoomed ? null : _dragUpdate,
          onVerticalDragEnd: _zoomed ? null : _dragEnd,
          child: Transform.translate(
            offset: Offset(0, _drag),
            child: Transform.scale(
              scale: 1 - (_drag / 2000).clamp(0, 0.2),
              child: PageView.builder(
                key: const Key('photo-pages'),
                controller: pages,
                physics: _zoomed ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
                itemCount: photos.length,
                onPageChanged: (i) => _onPage(i, photos),
                itemBuilder: (_, i) => KeyedSubtree(
                  key: ValueKey(photos[i].id),
                  child: _page(photos[i], i == index, chromeOn, bottomChrome),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _fadeChrome(chromeOn, _topBar(group, photo, me)),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _fadeChrome(chromeOn, _bottom(group, photo, me)),
        ),
      ]);
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black.withValues(alpha: fade),
        body: body,
      ),
    );
  }

  Widget _fadeChrome(bool on, Widget child) => IgnorePointer(
        ignoring: !on,
        child: AnimatedOpacity(opacity: on ? 1 : 0, duration: const Duration(milliseconds: 180), child: child),
      );

  Widget _page(Photo p, bool active, bool chromeOn, double bottomChrome) {
    if (p.isVideo && p.videoUrl != null) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toggleChrome,
        child: _VideoView(
          url: p.videoUrl!,
          poster: _image(p),
          active: active,
          controlsVisible: chromeOn,
          bottomInset: bottomChrome,
        ),
      );
    }
    final zoom = _zoomFor(p.id);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _toggleChrome,
      onDoubleTapDown: (d) => _doubleTapAt = d.localPosition,
      onDoubleTap: () => _doubleTap(p.id),
      child: InteractiveViewer(
        key: Key('photo-zoom-${p.id}'),
        transformationController: zoom,
        minScale: 1,
        maxScale: 5,
        child: SizedBox.expand(
          child: Hero(tag: photoHeroTag(p.id), child: _image(p)),
        ),
      ),
    );
  }

  /// Display quality, with the grid's thumbnail as placeholder (no blank flash).
  Widget _image(Photo p) {
    final b = widget.imageBuilder;
    if (b != null) return b(p);
    final thumb = p.thumbUrl.isEmpty
        ? const SizedBox.expand()
        : CachedNetworkImage(
            imageUrl: p.thumbUrl,
            cacheKey: 'thumb_${p.id}',
            fit: BoxFit.contain,
            fadeInDuration: Duration.zero,
            placeholder: (_, _) => const SizedBox.expand(),
            errorWidget: (_, _, _) => const SizedBox.expand(),
          );
    if (p.displayUrl.isEmpty) return thumb;
    return CachedNetworkImage(
      imageUrl: p.displayUrl,
      cacheKey: 'display_${p.id}',
      fit: BoxFit.contain,
      fadeInDuration: const Duration(milliseconds: 120),
      placeholderFadeInDuration: Duration.zero,
      placeholder: (_, _) => thumb,
      errorWidget: (_, _, _) => Stack(fit: StackFit.expand, children: [
        thumb,
        const Center(child: Icon(Icons.broken_image_outlined, color: Colors.white54, size: 36)),
      ]),
    );
  }

  // ---------------------------------------------------------------- top bar

  Widget _closeButton() => IconButton(
        key: const Key('photo-close'),
        tooltip: context.l10n.close,
        onPressed: _close,
        icon: const Icon(Icons.close_rounded, color: Colors.white, size: 26),
      );

  Widget _topBar(Group? group, Photo p, String? me) {
    final l = context.l10n;
    final m = group?.member(p.userId);
    final name = p.userId == me ? l.you : (m?.name ?? l.someone);
    final when = '${Fmt.dayInline(p.takenAt)} · ${Fmt.time(p.takenAt)}';
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x99000000), Color(0x00000000)]),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 2, 4, 14),
          child: Row(children: [
            _closeButton(),
            if (m != null) ...[Avatar.member(m, size: 30, border: Colors.white24), const SizedBox(width: 10)],
            Expanded(
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(name, key: const Key('photo-who'), maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(15, color: Colors.white, weight: FontWeight.w600)),
                const SizedBox(height: 1),
                Text(when, key: const Key('photo-when'), maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(12, color: Colors.white70)),
              ]),
            ),
            IconButton(
              key: const Key('photo-more'),
              tooltip: l.more,
              onPressed: () => _more(group, p, me),
              icon: const Icon(Icons.more_horiz, color: Colors.white, size: 26),
            ),
          ]),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------- bottom

  Widget _bottom(Group? group, Photo p, String? me) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xB3000000), Color(0x00000000)]),
      ),
      child: SafeArea(
        top: false,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 8),
          SizedBox(height: PhotoScreen.reactionsHeight, child: _reactions(p)),
          SizedBox(height: PhotoScreen.barHeight, child: _actions(group, p, me)),
        ]),
      ),
    );
  }

  Widget _reactions(Photo p) {
    final counts = {for (final r in p.reactions) r.emoji: r.count};
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          for (final e in reactionEmojis)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: GestureDetector(
                key: Key('photo-react-$e'),
                onTap: () => _gallery.react(p, e).catchError((Object err) {
                  if (mounted) showMessage(context, ApiException.from(err).message);
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: BoxDecoration(
                    color: p.myReactions.contains(e) ? const Color(0x40FF8A73) : const Color(0x26FFFFFF),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: p.myReactions.contains(e) ? const Color(0xFFFF8A73) : Colors.transparent, width: 1.5),
                  ),
                  child: Text(
                    counts[e] != null ? '$e ${counts[e]}' : e,
                    style: CT.text(14, color: Colors.white, weight: FontWeight.w600, height: 1.2),
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }

  Widget _actions(Group? group, Photo p, String? me) {
    final l = context.l10n;
    final canDelete = p.canDelete(me, group);

    Widget action(Key key, IconData icon, String label, VoidCallback? onTap, {Color? color, bool busy = false, String? tooltip}) {
      final on = onTap != null;
      final c = color ?? Colors.white;
      Widget w = Opacity(
        opacity: on ? 1 : 0.35,
        child: InkWell(
          key: key,
          borderRadius: BorderRadius.circular(12),
          onTap: on && !busy ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 24,
                child: busy
                    ? Center(child: SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: c, strokeWidth: 2)))
                    : Icon(icon, color: c, size: 24),
              ),
              const SizedBox(height: 4),
              Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: CT.text(11.5, color: c, weight: FontWeight.w600, height: 1.2)),
            ]),
          ),
        ),
      );
      if (tooltip != null) w = Tooltip(message: tooltip, triggerMode: TooltipTriggerMode.tap, child: w);
      return Expanded(child: w);
    }

    return Row(children: [
      action(const Key('photo-save'), Icons.download_rounded, l.save, group == null ? null : () => _save(group, p), busy: _saving),
      action(
        const Key('photo-favorite'),
        p.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
        l.favorite,
        () => _favorite(p),
        color: p.isFavorite ? CT.warn : null,
      ),
      Expanded(
        child: Builder(
          builder: (b) => Row(children: [
            action(const Key('photo-share'), Icons.ios_share, l.share, () => _share(p, b), busy: _sharing),
          ]),
        ),
      ),
      action(
        const Key('photo-delete'),
        Icons.delete_outline,
        l.delete,
        canDelete ? () => _delete(p) : null,
        color: const Color(0xFFFF8A73),
        busy: _deleting,
        tooltip: canDelete ? null : l.deleteOnlyOwnOrAdmin,
      ),
    ]);
  }

  // ---------------------------------------------------------------- actions

  Future<void> _save(Group group, Photo p) async {
    setState(() => _saving = true);
    try {
      await Downloader.save(ref.read(apiProvider), group, [p.id]);
      if (mounted) showMessage(context, context.l10n.savedToAlbum);
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _favorite(Photo p) async {
    try {
      await _gallery.toggleFavorite(p);
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  Future<void> _share(Photo p, BuildContext button) async {
    final box = button.findRenderObject() as RenderBox?;
    final origin = box == null ? null : box.localToGlobal(Offset.zero) & box.size;
    setState(() => _sharing = true);
    try {
      await ref.read(photoShareProvider).share([p], origin: origin);
    } catch (e) {
      if (mounted) showMessage(context, context.l10n.shareFailed);
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  /// "Verwijderen" for the whole group, after a confirmation. The next photo
  /// slides into place (the previous one at the end); the last one closes.
  Future<void> _delete(Photo p) async {
    final l = context.l10n;
    if (!await confirmDeletePhotos(context, count: 1)) return;
    if (!mounted) return;
    setState(() => _deleting = true);
    try {
      // The group's counts and cover come back with the response.
      final r = await _gallery.delete(p);
      if (!mounted) return;
      if (r.forbidden > 0) {
        showMessage(context, l.deletePhotosNotAllowed(r.forbidden));
        return;
      }
      showMessage(context, p.isVideo ? l.videoDeleted : l.photoDeleted);
      final photos = ref.read(galleryProvider(widget.groupId)).photos;
      if (photos.isEmpty) {
        _close();
      } else {
        final i = _index.clamp(0, photos.length - 1);
        setState(() {
          _index = i;
          _zoomed = false;
        });
        _resetZoom();
      }
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _deleting = false);
    }
  }

  Future<void> _report(Photo p) async {
    final reason = await showModalBottomSheet<ReportReason>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: Text(context.l10n.reportTitle, style: CT.title(20)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            child: Text(context.l10n.reportSubtitle, style: CT.text(13, color: CT.muted)),
          ),
          for (final r in ReportReason.values) ListTile(title: Text(r.label), onTap: () => Navigator.pop(c, r)),
          ListTile(leading: const Icon(Icons.close), title: Text(context.l10n.cancel), onTap: () => Navigator.pop(c)),
        ]),
      ),
    );
    if (reason == null) return;
    try {
      await _gallery.report(p, reason);
      if (!mounted) return;
      showMessage(context, context.l10n.reportThanks);
      if (ref.read(galleryProvider(widget.groupId)).photos.isEmpty) _close();
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  Future<void> _block(Member m) async {
    if (!await confirm(context,
        title: context.l10n.blockTitle(m.name),
        message: context.l10n.blockMessageAllGroups(m.name),
        ok: context.l10n.block,
        danger: true)) {
      return;
    }
    try {
      await ref.read(authProvider.notifier).block(m.id);
      if (!mounted) return;
      showMessage(context, context.l10n.userBlocked(m.name));
      _close(); // the gallery reloads without their photos
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  /// "Verbergen voor mij": the next photo slides in; the SnackBar can undo.
  Future<void> _hide(Photo p) async {
    final ctrl = _gallery;
    final messenger = ScaffoldMessenger.of(context);
    try {
      final hidden = await ctrl.hide([p.id]);
      if (!mounted) return;
      final empty = ref.read(galleryProvider(widget.groupId)).photos.isEmpty;
      showUndo(context, p.isVideo ? context.l10n.videoHiddenForYou : context.l10n.photoHiddenForYou, () {
        ctrl.unhide(hidden).catchError((Object e) {
          messenger.showSnackBar(SnackBar(content: Text(ApiException.from(e).message)));
        });
      });
      if (empty) _close();
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  /// "...": the less common actions. Delete lives in the bottom bar.
  void _more(Group? group, Photo p, String? me) {
    final mine = p.userId == me;
    final owner = group?.member(p.userId);
    final l = context.l10n;
    showModalBottomSheet<void>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if (group != null && group.isAdmin && !p.isVideo)
            ListTile(
              key: const Key('photo-more-cover'),
              leading: const Icon(Icons.photo_outlined),
              title: Text(l.setAsCover),
              onTap: () async {
                Navigator.pop(c);
                try {
                  await ref.read(groupsProvider.notifier).setCover(group.id, p.id);
                  if (mounted) showMessage(context, l.coverUpdated);
                } catch (e) {
                  if (mounted) showMessage(context, ApiException.from(e).message);
                }
              },
            ),
          // Hiding your own private photos from yourself makes no sense in the personal roll.
          if (!(group?.isPersonal ?? false))
            ListTile(
              key: const Key('photo-more-hide'),
              leading: const Icon(Icons.visibility_off_outlined),
              title: Text(l.hideForMe),
              subtitle: Text(l.hideForMeSubtitle, style: CT.text(12, color: CT.muted)),
              onTap: () {
                Navigator.pop(c);
                _hide(p);
              },
            ),
          if (!mine)
            ListTile(
              key: const Key('photo-more-report'),
              leading: const Icon(Icons.flag_outlined),
              title: Text(l.reportPhoto),
              onTap: () {
                Navigator.pop(c);
                _report(p);
              },
            ),
          if (!mine && owner != null)
            ListTile(
              key: const Key('photo-more-block'),
              leading: const Icon(Icons.block),
              title: Text(l.blockName(owner.name)),
              onTap: () {
                Navigator.pop(c);
                _block(owner);
              },
            ),
          ListTile(leading: const Icon(Icons.close), title: Text(l.cancel), onTap: () => Navigator.pop(c)),
        ]),
      ),
    );
  }
}

/// A video, full-bleed (contained) with play/pause and a scrub bar that come
/// and go with the viewer's bars. Plays while it is the current page.
class _VideoView extends StatefulWidget {
  const _VideoView({required this.url, required this.poster, required this.active, required this.controlsVisible, required this.bottomInset});
  final String url;
  final Widget poster;
  final bool active;
  final bool controlsVisible;
  final double bottomInset;
  @override
  State<_VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<_VideoView> {
  VideoPlayerController? _c;
  final _notLoaded = ValueNotifier(const VideoPlayerValue.uninitialized());

  @override
  void initState() {
    super.initState();
    if (widget.active) _load();
  }

  @override
  void didUpdateWidget(covariant _VideoView old) {
    super.didUpdateWidget(old);
    if (widget.active && _c == null) _load();
    if (!widget.active) _c?.pause();
  }

  Future<void> _load() async {
    final c = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _c = c;
    try {
      await c.initialize();
    } catch (_) {
      // Poster stays visible; the play button tries again.
      if (_c == c) _c = null;
      await c.dispose();
      if (mounted) setState(() {});
      return;
    }
    if (!mounted || _c != c) return;
    await c.setLooping(true);
    if (mounted && widget.active) {
      await c.play();
      if (mounted) setState(() {});
    }
  }

  void _playPause() {
    final c = _c;
    if (c == null) {
      _load();
    } else if (c.value.isInitialized) {
      (c.value.isPlaying ? c.pause() : c.play()).then((_) => mounted ? setState(() {}) : null);
    }
  }

  @override
  void dispose() {
    _c?.dispose();
    _notLoaded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _c;
    final ready = c != null && c.value.isInitialized;
    final l = context.l10n;
    return Stack(fit: StackFit.expand, children: [
      widget.poster,
      if (ready)
        Center(
          child: AspectRatio(aspectRatio: c.value.aspectRatio, child: VideoPlayer(c)),
        ),
      ValueListenableBuilder<VideoPlayerValue>(
        valueListenable: c ?? _notLoaded,
        builder: (_, v, _) {
          final playing = v.isPlaying;
          final show = widget.controlsVisible || !playing;
          return Stack(fit: StackFit.expand, children: [
            Center(
              child: IgnorePointer(
                ignoring: !show,
                child: AnimatedOpacity(
                  opacity: show ? 1 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: Material(
                    color: Colors.black45,
                    shape: const CircleBorder(),
                    child: IconButton(
                      key: const Key('video-play'),
                      tooltip: playing ? l.videoPause : l.videoPlay,
                      iconSize: 38,
                      onPressed: _playPause,
                      icon: Icon(playing ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            if (ready)
              Positioned(
                left: 16,
                right: 16,
                bottom: widget.bottomInset,
                child: IgnorePointer(
                  ignoring: !widget.controlsVisible,
                  child: AnimatedOpacity(
                    opacity: widget.controlsVisible ? 1 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: Row(children: [
                      Text(formatDuration(v.position.inMilliseconds), style: CT.text(11.5, color: Colors.white, weight: FontWeight.w600)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 24,
                          child: Center(
                            child: VideoProgressIndicator(
                              c,
                              key: const Key('video-scrub'),
                              allowScrubbing: true,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              colors: const VideoProgressColors(playedColor: Colors.white, bufferedColor: Colors.white38, backgroundColor: Colors.white24),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(formatDuration(v.duration.inMilliseconds), style: CT.text(11.5, color: Colors.white70, weight: FontWeight.w600)),
                    ]),
                  ),
                ),
              ),
          ]);
        },
      ),
    ]);
  }
}
