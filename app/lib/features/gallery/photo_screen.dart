import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../camera/styles.dart';
import '../groups/groups_controller.dart';
import 'gallery_controller.dart';
import 'photo_actions.dart';

const reactionEmojis = ['❤️', '😂', '🔥', '😍', '😮', '👏'];

class PhotoScreen extends ConsumerStatefulWidget {
  const PhotoScreen({super.key, required this.groupId, required this.photoId, this.initialIndex});
  final String groupId;
  final String photoId;
  final int? initialIndex;

  @override
  ConsumerState<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends ConsumerState<PhotoScreen> {
  late final PageController _pages;
  late int _index;

  @override
  void initState() {
    super.initState();
    final photos = ref.read(galleryProvider(widget.groupId)).photos;
    final i = photos.indexWhere((p) => p.id == widget.photoId);
    _index = i < 0 ? (widget.initialIndex ?? 0) : i;
    _pages = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gallery = ref.watch(galleryProvider(widget.groupId));
    final group = ref.watch(groupProvider(widget.groupId));
    final photos = gallery.photos;
    if (photos.isEmpty || group == null) return Scaffold(appBar: AppBar());
    final index = _index.clamp(0, photos.length - 1);
    final photo = photos[index];
    final total = group.totalCount;

    return Scaffold(
      backgroundColor: const Color(0xFFF1EFE9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1EFE9),
        title: Text('${index + 1} / ${total < photos.length ? photos.length : total}', style: CT.text(13, color: CT.muted, weight: FontWeight.w600)),
        actions: [IconButton(onPressed: () => _more(group, photo), icon: const Icon(Icons.more_horiz))],
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: _pages,
              itemCount: photos.length,
              onPageChanged: (i) {
                setState(() => _index = i);
                if (i > photos.length - 5) ref.read(galleryProvider(widget.groupId).notifier).loadMore();
              },
              itemBuilder: (_, i) => _print(group, photos[i], i == index),
            ),
          ),
          _reactions(photo),
          _actions(group, photo),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }

  Widget _print(Group group, Photo p, bool visible) {
    final m = group.member(p.userId);
    final ratio = p.width > 0 && p.height > 0 ? p.width / p.height : 0.8;
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 12, 26, 12),
        child: InstantPrint(
          rotation: tiltFor(p.id, max: 1.2),
          padding: 10,
          bottom: 64,
          aspectRatio: ratio,
          caption: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(children: [
              if (m != null) Avatar.member(m, size: 28),
              const SizedBox(width: 10),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(m?.name ?? 'Iemand', style: CT.text(14, weight: FontWeight.w600)),
                Text(
                  '${Fmt.day(p.takenAt).toLowerCase()} · ${Fmt.time(p.takenAt)} · ${p.fromRoll ? 'geüpload' : CameraStyle.byId(p.style).name}',
                  style: CT.text(11, color: CT.muted),
                ),
              ]),
            ]),
          ),
          child: p.isVideo && p.videoUrl != null
              ? _VideoView(url: p.videoUrl!, poster: p.displayUrl, active: visible, id: p.id)
              : InteractiveViewer(maxScale: 4, child: NetPhoto(p.displayUrl, cacheKey: 'display_${p.id}', fit: BoxFit.cover)),
        ),
      ),
    );
  }

  Widget _reactions(Photo p) {
    final counts = {for (final r in p.reactions) r.emoji: r.count};
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(spacing: 8, alignment: WrapAlignment.center, children: [
        for (final e in reactionEmojis)
          GestureDetector(
            onTap: () => ref.read(galleryProvider(widget.groupId).notifier).react(p, e).catchError((Object err) {
              if (mounted) showMessage(context, ApiException.from(err).message);
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: p.myReactions.contains(e) ? CT.accent : Colors.transparent, width: 2),
                boxShadow: CT.cardShadow,
              ),
              child: Text(counts[e] != null ? '$e ${counts[e]}' : e, style: CT.text(14, weight: FontWeight.w600)),
            ),
          ),
      ]),
    );
  }

  Widget _actions(Group group, Photo p) {
    Widget action(IconData icon, String label, VoidCallback onTap, {Color? color}) => InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Column(children: [
              Icon(icon, color: color ?? CT.ink),
              const SizedBox(height: 3),
              Text(label, style: CT.text(12, weight: FontWeight.w500)),
            ]),
          ),
        );
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      action(Icons.download_rounded, 'Opslaan', () async {
        try {
          await Downloader.save(ref.read(apiProvider), group, [p.id]);
          if (mounted) showMessage(context, 'Opgeslagen in je fotoalbum');
        } catch (e) {
          if (mounted) showMessage(context, ApiException.from(e).message);
        }
      }),
      action(p.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded, 'Favoriet', () async {
        try {
          await ref.read(galleryProvider(widget.groupId).notifier).toggleFavorite(p);
        } catch (e) {
          if (mounted) showMessage(context, ApiException.from(e).message);
        }
      }, color: p.isFavorite ? CT.warn : null),
      action(Icons.ios_share, 'Delen', () => _share(p)),
    ]);
  }

  Future<void> _share(Photo p) async {
    try {
      final tmp = await getTemporaryDirectory();
      final path = '${tmp.path}/share_${p.id}.${p.isVideo ? 'mp4' : 'jpg'}';
      final url = p.isVideo ? p.videoUrl : p.displayUrl;
      if (url == null || url.isEmpty) throw ApiException('Geen bestand');
      await Api.download(url, path);
      await SharePlus.instance.share(ShareParams(files: [XFile(path)]));
    } catch (e) {
      if (mounted) showMessage(context, 'Delen lukte niet');
    }
  }

  Future<void> _report(Photo p) async {
    final reason = await showModalBottomSheet<ReportReason>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: Text('Waarom rapporteer je deze foto?', style: CT.title(20)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            child: Text('We bekijken elke melding binnen 24 uur. De foto is meteen verborgen voor jou.', style: CT.text(13, color: CT.muted)),
          ),
          for (final r in ReportReason.values) ListTile(title: Text(r.label), onTap: () => Navigator.pop(c, r)),
          ListTile(leading: const Icon(Icons.close), title: const Text('Annuleer'), onTap: () => Navigator.pop(c)),
        ]),
      ),
    );
    if (reason == null) return;
    try {
      await ref.read(galleryProvider(widget.groupId).notifier).report(p, reason);
      if (!mounted) return;
      showMessage(context, 'Bedankt, we kijken ernaar');
      if (ref.read(galleryProvider(widget.groupId)).photos.isEmpty) context.pop();
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  Future<void> _block(Member m) async {
    if (!await confirm(context,
        title: '${m.name} blokkeren?',
        message: 'Je ziet geen foto\'s en video\'s van ${m.name} meer, in geen enkele groep, en krijgt er geen meldingen over. Opheffen kan in Instellingen.',
        ok: 'Blokkeer',
        danger: true)) {
      return;
    }
    try {
      await ref.read(authProvider.notifier).block(m.id);
      if (!mounted) return;
      showMessage(context, '${m.name} is geblokkeerd');
      context.pop(); // the gallery reloads without their photos
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  /// "Verbergen voor mij": the next photo slides in; the SnackBar can undo.
  Future<void> _hide(Photo p) async {
    final ctrl = ref.read(galleryProvider(widget.groupId).notifier);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final hidden = await ctrl.hide([p.id]);
      if (!mounted) return;
      final empty = ref.read(galleryProvider(widget.groupId)).photos.isEmpty;
      showUndo(context, p.isVideo ? 'Video verborgen voor jou' : 'Foto verborgen voor jou', () {
        ctrl.unhide(hidden).catchError((Object e) {
          messenger.showSnackBar(SnackBar(content: Text(ApiException.from(e).message)));
        });
      });
      if (empty) context.pop();
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  void _more(Group group, Photo p) {
    final me = ref.read(authProvider).value?.id;
    final canDelete = p.canDelete(me, group);
    final mine = p.userId == me;
    final owner = group.member(p.userId);
    showModalBottomSheet<void>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if (group.isAdmin && !p.isVideo)
            ListTile(
              leading: const Icon(Icons.photo_outlined),
              title: const Text('Als omslag instellen'),
              onTap: () async {
                Navigator.pop(c);
                try {
                  await ref.read(groupsProvider.notifier).setCover(group.id, p.id);
                  if (mounted) showMessage(context, 'Omslagfoto aangepast');
                } catch (e) {
                  if (mounted) showMessage(context, ApiException.from(e).message);
                }
              },
            ),
          ListTile(
            leading: const Icon(Icons.visibility_off_outlined),
            title: const Text('Verbergen voor mij'),
            subtitle: Text('De anderen in de groep zien hem nog wel', style: CT.text(12, color: CT.muted)),
            onTap: () {
              Navigator.pop(c);
              _hide(p);
            },
          ),
          if (!mine)
            ListTile(
              leading: const Icon(Icons.flag_outlined),
              title: const Text('Foto rapporteren'),
              onTap: () {
                Navigator.pop(c);
                _report(p);
              },
            ),
          if (!mine && owner != null)
            ListTile(
              leading: const Icon(Icons.block),
              title: Text('${owner.name} blokkeren'),
              onTap: () {
                Navigator.pop(c);
                _block(owner);
              },
            ),
          if (canDelete)
            ListTile(
              leading: const Icon(Icons.delete_outline, color: CT.accent),
              title: Text('Verwijderen', style: CT.text(16, color: CT.accent)),
              subtitle: Text('Voor iedereen in de groep', style: CT.text(12, color: CT.muted)),
              onTap: () async {
                Navigator.pop(c);
                if (!await confirmDeletePhotos(context, count: 1)) return;
                try {
                  // The group's counts and cover come back with the response.
                  await ref.read(galleryProvider(widget.groupId).notifier).delete(p);
                  if (!mounted) return;
                  showMessage(context, p.isVideo ? 'Video verwijderd' : 'Foto verwijderd');
                  if (ref.read(galleryProvider(widget.groupId)).photos.isEmpty) context.pop();
                } catch (e) {
                  if (mounted) showMessage(context, ApiException.from(e).message);
                }
              },
            ),
          ListTile(leading: const Icon(Icons.close), title: const Text('Annuleer'), onTap: () => Navigator.pop(c)),
        ]),
      ),
    );
  }
}

class _VideoView extends StatefulWidget {
  const _VideoView({required this.url, required this.poster, required this.active, required this.id});
  final String url;
  final String poster;
  final bool active;
  final String id;
  @override
  State<_VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<_VideoView> {
  VideoPlayerController? _c;

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
      // Poster stays visible; a tap tries again.
      if (_c == c) _c = null;
      await c.dispose();
      if (mounted) setState(() {});
      return;
    }
    if (!mounted || _c != c) return;
    await c.setLooping(true);
    if (mounted && widget.active) {
      await c.play();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _c;
    return GestureDetector(
      onTap: () {
        if (c == null) {
          _load();
        } else if (c.value.isInitialized) {
          (c.value.isPlaying ? c.pause() : c.play()).then((_) => mounted ? setState(() {}) : null);
        }
      },
      child: Stack(fit: StackFit.expand, children: [
        NetPhoto(widget.poster, cacheKey: 'display_${widget.id}'),
        if (c != null && c.value.isInitialized)
          FittedBox(fit: BoxFit.cover, child: SizedBox(width: c.value.size.width, height: c.value.size.height, child: VideoPlayer(c))),
        if (c == null || !c.value.isPlaying)
          const Center(child: CircleAvatar(radius: 26, backgroundColor: Colors.black45, child: Icon(Icons.play_arrow, color: Colors.white, size: 32))),
      ]),
    );
  }
}
