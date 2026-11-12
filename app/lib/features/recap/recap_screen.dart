import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../camera/camera_screen.dart' show albumName;
import '../groups/groups_controller.dart';
import '../premium/premium_controller.dart';
import 'recap_builder.dart';

class RecapScreen extends ConsumerStatefulWidget {
  const RecapScreen({super.key, required this.groupId});
  final String groupId;
  @override
  ConsumerState<RecapScreen> createState() => _RecapScreenState();
}

class _RecapScreenState extends ConsumerState<RecapScreen> {
  RecapBuilder? _builder;
  List<Photo> _all = const [];
  RecapTemplate _template = RecapTemplate.goldenHour;
  RecapTrack _track = RecapTrack.all.first;
  RecapFrames? _frames;
  double _progress = 0;
  String? _error;
  bool _exporting = false;
  double _exportProgress = 0;

  int _frame = 0;
  Timer? _timer;
  final _audio = AudioPlayer();
  bool _playing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audio.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final group = ref.read(groupProvider(widget.groupId));
    if (group == null) return;
    _builder = RecapBuilder(group);
    try {
      final api = ref.read(apiProvider);
      final photos = <Photo>[];
      Map<String, dynamic>? cursor;
      do {
        final res = await api.get('/groups/${group.id}/photos', query: cursor);
        photos.addAll(((res['photos'] as List?) ?? const []).map((p) => Photo.fromJson(p as Map<String, dynamic>)));
        final next = res['nextCursor'] as Map<String, dynamic>?;
        cursor = next == null ? null : {'before': next['before'], 'beforeId': next['beforeId']};
      } while (cursor != null && photos.length < 400);
      _all = photos;
      await _render();
    } catch (e) {
      setState(() => _error = ApiException.from(e).message);
    }
  }

  Future<void> _render() async {
    _stop();
    setState(() {
      _frames = null;
      _progress = 0;
      _error = null;
    });
    try {
      final picked = pickRecapPhotos(_all, _template);
      if (picked.length < 3) {
        setState(() => _error = 'Je hebt minstens 3 foto\'s nodig voor een recap.');
        return;
      }
      final frames = await _builder!.render(
        picked,
        _template,
        watermark: !ref.read(isProProvider),
        onProgress: (p) => mounted ? setState(() => _progress = p) : null,
      );
      if (!mounted) return;
      setState(() => _frames = frames);
      _play();
    } catch (e) {
      if (mounted) setState(() => _error = 'Recap maken lukte niet: $e');
    }
  }

  void _play() {
    final f = _frames;
    if (f == null) return;
    _timer?.cancel();
    setState(() {
      _frame = 0;
      _playing = true;
    });
    _audio.play(AssetSource(_track.asset));
    _timer = Timer.periodic(Duration(milliseconds: (f.secondsPerFrame * 1000).round()), (_) {
      if (!mounted) return;
      if (_frame >= f.paths.length - 1) {
        _stop();
      } else {
        setState(() => _frame++);
      }
    });
  }

  void _stop() {
    _timer?.cancel();
    _audio.stop();
    if (mounted) setState(() => _playing = false);
  }

  Future<File?> _export() async {
    final f = _frames;
    if (f == null || _builder == null) return null;
    _stop();
    setState(() {
      _exporting = true;
      _exportProgress = 0;
    });
    try {
      return await _builder!.export(f, _track, onProgress: (p) => mounted ? setState(() => _exportProgress = p) : null);
    } catch (e) {
      if (mounted) showMessage(context, e.toString());
      return null;
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  Future<void> _saveVideo() async {
    final group = ref.read(groupProvider(widget.groupId));
    final file = await _export();
    if (file == null || group == null) return;
    if (!await Gal.hasAccess(toAlbum: true)) await Gal.requestAccess(toAlbum: true);
    await Gal.putVideo(file.path, album: albumName(group));
    if (mounted) showMessage(context, 'Recap opgeslagen in je fotoalbum');
  }

  Future<void> _share() async {
    final file = await _export();
    if (file == null) return;
    await SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));
  }

  @override
  Widget build(BuildContext context) {
    final isPro = ref.watch(isProProvider);
    final f = _frames;
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () => context.pop(), child: Text('Sluit', style: CT.text(15))),
        leadingWidth: 80,
        title: Text('Recap', style: CT.title(17)),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), boxShadow: CT.cardShadow, color: CT.cream),
                  clipBehavior: Clip.antiAlias,
                  child: _error != null
                      ? Center(child: Padding(padding: const EdgeInsets.all(20), child: Text(_error!, textAlign: TextAlign.center, style: CT.text(14, color: CT.muted))))
                      : f == null
                          ? Center(
                              child: Column(mainAxisSize: MainAxisSize.min, children: [
                                SizedBox(width: 120, child: LinearProgressIndicator(value: _progress == 0 ? null : _progress, color: CT.accent, backgroundColor: CT.line)),
                                const SizedBox(height: 10),
                                Text('Recap maken...', style: CT.text(13, color: CT.muted)),
                              ]),
                            )
                          : GestureDetector(
                              onTap: () => _playing ? _stop() : _play(),
                              child: Stack(fit: StackFit.expand, children: [
                                AnimatedSwitcher(
                                  duration: Duration(milliseconds: _template == RecapTemplate.snel ? 80 : 350),
                                  child: Image.file(File(f.paths[_frame]), key: ValueKey(f.paths[_frame]), fit: BoxFit.cover, gaplessPlayback: true),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                  child: Row(children: [
                                    for (var i = 0; i < f.paths.length; i++)
                                      Expanded(
                                        child: Container(
                                          height: 3,
                                          margin: const EdgeInsets.symmetric(horizontal: 1),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withValues(alpha: i <= _frame ? 0.95 : 0.35),
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                        ),
                                      ),
                                  ]),
                                ),
                                if (!_playing) const Center(child: CircleAvatar(radius: 28, backgroundColor: Colors.black38, child: Icon(Icons.play_arrow, color: Colors.white, size: 34))),
                                if (_exporting)
                                  Container(
                                    color: Colors.black54,
                                    alignment: Alignment.center,
                                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                                      SizedBox(width: 140, child: LinearProgressIndicator(value: _exportProgress, color: Colors.white, backgroundColor: Colors.white24)),
                                      const SizedBox(height: 10),
                                      Text('Video maken...', style: CT.text(14, color: Colors.white, weight: FontWeight.w600)),
                                    ]),
                                  ),
                              ]),
                            ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('TEMPLATE', style: CT.label),
              const SizedBox(height: 6),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (final t in RecapTemplate.values) ...[
                    CTChip(t.label, selected: t == _template, onTap: () {
                      if (t == _template) return;
                      setState(() => _template = t);
                      _render();
                    }),
                    const SizedBox(width: 8),
                  ],
                ]),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  final i = RecapTrack.all.indexOf(_track);
                  setState(() => _track = RecapTrack.all[(i + 1) % RecapTrack.all.length]);
                  if (_playing) _play();
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(12), border: Border.all(color: CT.line, width: 1.5)),
                  child: Row(children: [
                    const Icon(Icons.music_note, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('${_track.title} - ${_track.mood}', style: CT.text(14, weight: FontWeight.w500)),
                        Text('eigen muziek van CamTrip · rechtenvrij', style: CT.text(11, color: CT.muted)),
                      ]),
                    ),
                    Text('Wissel', style: CT.text(13, color: CT.muted, weight: FontWeight.w600)),
                  ]),
                ),
              ),
              const SizedBox(height: 8),
              Row(children: [
                Text('9:16 ✓', style: CT.text(12, color: CT.muted)),
                const SizedBox(width: 14),
                GestureDetector(
                  onTap: isPro ? null : () => context.push('/pro'),
                  child: Text(isPro ? 'Geen watermerk ✓' : 'Watermerk weghalen met Pro', style: CT.text(12, color: isPro ? CT.muted : CT.accent, weight: FontWeight.w500)),
                ),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: CTButton('Opslaan', icon: Icons.download_rounded, onTap: f == null || _exporting ? null : _saveVideo)),
                const SizedBox(width: 10),
                Expanded(child: CTButton('Delen', kind: CTButtonKind.primary, icon: Icons.ios_share, onTap: f == null || _exporting ? null : _share)),
              ]),
              const SizedBox(height: 10),
            ]),
          ),
        ]),
      ),
    );
  }
}
