import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';

import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../main.dart';
import '../../models/models.dart';
import '../groups/groups_controller.dart';
import '../premium/pro_gate.dart';
import '../upload/upload_queue.dart';
import 'processor.dart';
import 'shutter_button.dart';
import 'styles.dart';
import 'video_processor.dart';

/// Album on the phone; the same name in every language, so it never splits.
String albumName(Group g) => 'CamTrip - ${g.name}';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});
  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> with WidgetsBindingObserver {
  List<CameraDescription> _cameras = const [];
  CameraController? _controller;
  int _cameraIndex = 0;
  late CameraStyle _style;
  late bool _stamp;
  FlashMode _flash = FlashMode.auto;
  /// Always starts in photo mode and is never persisted: video is a
  /// deliberate per-session choice.
  bool _videoMode = false;
  bool _recording = false;
  bool _busy = false;
  bool _flashAnim = false;
  String? _error;
  Uint8List? _lastThumb;
  DateTime? _recordStart;
  Timer? _recordTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final prefs = ref.read(prefsProvider);
    _style = CameraStyle.byId(prefs.cameraStyle);
    // A Pro style left over from a lapsed subscription (or another group's
    // Pro) would fail on upload. Group Pro counts: one Pro member = Pro for all.
    if (!ref.read(activeProGateProvider).canUseStyle(styleIsPro: _style.pro)) _style = CameraStyle.instant;
    _stamp = prefs.dateStamp;
    _flash = switch (prefs.flashMode) { 'on' => FlashMode.always, 'off' => FlashMode.off, _ => FlashMode.auto };
    WidgetsBinding.instance.addPostFrameCallback((_) => _initAfterTransition());
  }

  /// Starting the camera is heavy on the platform side; wait for the slide-up
  /// to finish so the transition stays at 60fps.
  Future<void> _initAfterTransition() async {
    if (!mounted) return;
    final anim = ModalRoute.of(context)?.animation;
    if (anim != null && !anim.isCompleted) {
      final done = Completer<void>();
      void listener(AnimationStatus s) {
        if (s.isCompleted && !done.isCompleted) done.complete();
      }

      anim.addStatusListener(listener);
      await done.future.timeout(const Duration(milliseconds: 600), onTimeout: () {});
      anim.removeStatusListener(listener);
    }
    if (mounted) _init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _recordTimer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final c = _controller;
    if (state == AppLifecycleState.resumed) {
      if (c == null && _cameras.isNotEmpty && mounted) _start(_cameraIndex);
      return;
    }
    if (state != AppLifecycleState.inactive || !mounted) return;
    final live = c != null && c.value.isInitialized;
    _recordTimer?.cancel();
    // Coming back from the background always lands in photo mode. Also drop
    // the preview from the tree before the controller goes away.
    setState(() {
      _recording = false;
      _videoMode = false;
      if (live) _controller = null;
    });
    if (live) c.dispose();
  }

  void _setVideoMode(bool video) {
    if (_recording || video == _videoMode) return;
    HapticFeedback.selectionClick();
    setState(() => _videoMode = video);
  }

  Future<void> _init() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() => _error = context.l10n.cameraNotFound);
        return;
      }
      final back = _cameras.indexWhere((c) => c.lensDirection == CameraLensDirection.back);
      await _start(back < 0 ? 0 : back);
    } on CameraException catch (e) {
      if (mounted) setState(() => _error = _cameraError(e));
    }
  }

  String _cameraError(CameraException e) => e.code.contains('AccessDenied') || e.code.contains('AccessRestricted')
      ? context.l10n.cameraAccessNeeded
      : context.l10n.cameraStartFailed;

  Future<void> _start(int index) async {
    final old = _controller;
    _controller = null;
    await old?.dispose();
    final c = CameraController(_cameras[index], ResolutionPreset.max, enableAudio: true, imageFormatGroup: ImageFormatGroup.jpeg);
    try {
      await c.initialize();
      try {
        await c.setFlashMode(_style.forceFlash ? FlashMode.always : _flash);
      } on CameraException catch (_) {
        // front cameras often have no flash
      }
      if (!mounted) {
        await c.dispose();
        return;
      }
      setState(() {
        _controller = c;
        _cameraIndex = index;
        _error = null;
      });
    } on CameraException catch (e) {
      await c.dispose();
      if (mounted) setState(() => _error = _cameraError(e));
    }
  }

  bool get _front => _cameras.isNotEmpty && _cameras[_cameraIndex].lensDirection == CameraLensDirection.front;

  Future<void> _selectStyle(CameraStyle s) async {
    if (!ref.read(activeProGateProvider).canUseStyle(styleIsPro: s.pro)) {
      context.push('/pro');
      return;
    }
    HapticFeedback.selectionClick();
    setState(() => _style = s);
    ref.read(prefsProvider).cameraStyle = s.id;
    try {
      await _controller?.setFlashMode(s.forceFlash ? FlashMode.always : _flash);
    } on CameraException catch (_) {}
  }

  Future<void> _cycleFlash() async {
    final next = switch (_flash) { FlashMode.auto => FlashMode.always, FlashMode.always => FlashMode.off, _ => FlashMode.auto };
    setState(() => _flash = next);
    ref.read(prefsProvider).flashMode = switch (next) { FlashMode.always => 'on', FlashMode.off => 'off', _ => 'auto' };
    if (!_style.forceFlash) {
      try {
        await _controller?.setFlashMode(next);
      } on CameraException catch (_) {}
    }
  }

  /// Saves to the phone's album. Never fails the shot: the photo is already
  /// in the upload queue, the album copy is a bonus.
  Future<void> _saveToAlbum(Future<void> Function() save) async {
    try {
      if (!await Gal.hasAccess(toAlbum: true) && !await Gal.requestAccess(toAlbum: true)) {
        if (mounted) showMessage(context, context.l10n.albumAccessNeeded);
        return;
      }
      await save();
    } catch (_) {
      if (mounted) showMessage(context, context.l10n.albumSaveFailed);
    }
  }

  Future<void> _shoot(Group group) async {
    final c = _controller;
    if (c == null || _busy || !c.value.isInitialized) return;
    if (!ref.read(activeProGateProvider).canUseStyle(styleIsPro: _style.pro)) {
      // Switched to a group without Pro while a Pro style was picked.
      setState(() => _style = CameraStyle.instant);
      showMessage(context, context.l10n.styleProFallback(CameraStyle.instant.name));
      return;
    }
    if (_videoMode) return _toggleRecording(group);
    HapticFeedback.mediumImpact();
    setState(() {
      _busy = true;
      _flashAnim = true;
    });
    Future.delayed(const Duration(milliseconds: 140), () => mounted ? setState(() => _flashAnim = false) : null);
    try {
      final shot = await c.takePicture();
      final takenAt = DateTime.now();
      final bytes = await shot.readAsBytes();
      setState(() => _busy = false); // ready for the next shot while this one develops
      final processed = await processPhoto(
        bytes,
        styleId: _style.id,
        dateStamp: _stamp ? Fmt.stamp(takenAt) : null,
        mirror: _front,
      );
      if (mounted) setState(() => _lastThumb = processed.thumb);
      await ref.read(uploadQueueProvider.notifier).enqueue(
            groupId: group.id,
            kind: 'photo',
            style: _style.id,
            mime: 'image/jpeg',
            takenAt: takenAt,
            fromRoll: false,
            width: processed.width,
            height: processed.height,
            original: processed.original,
            display: processed.display,
            thumb: processed.thumb,
          );
      if (ref.read(prefsProvider).saveOwnToAlbum) {
        await _saveToAlbum(
            () => Gal.putImageBytes(processed.original, album: albumName(group), name: 'camtrip_${takenAt.millisecondsSinceEpoch}'));
      }
      try {
        await File(shot.path).delete();
      } catch (_) {}
    } catch (e) {
      debugPrint('shoot failed: $e');
      if (mounted) showMessage(context, context.l10n.photoFailed);
    } finally {
      if (mounted && _busy) setState(() => _busy = false);
    }
  }

  Future<void> _toggleRecording(Group group) async {
    final c = _controller!;
    if (!_recording) {
      HapticFeedback.mediumImpact();
      try {
        await c.startVideoRecording();
      } on CameraException catch (e) {
        debugPrint('record failed: $e');
        if (mounted) showMessage(context, context.l10n.recordingFailed);
        return;
      }
      _recordStart = DateTime.now();
      _recordTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(() {});
        // keep clips short: they are shared over holiday data
        if (DateTime.now().difference(_recordStart!) > const Duration(seconds: 60)) _toggleRecording(group);
      });
      setState(() => _recording = true);
      return;
    }
    _recordTimer?.cancel();
    setState(() {
      _recording = false;
      _busy = true;
    });
    final takenAt = _recordStart ?? DateTime.now();
    final durationMs = DateTime.now().difference(takenAt).inMilliseconds;
    try {
      final file = await c.stopVideoRecording();
      if (mounted) setState(() => _busy = false);
      final styled = await VideoProcessor.applyStyle(File(file.path), _style);
      final thumbFile = await VideoProcessor.thumbnail(styled);
      final thumbBytes = thumbFile != null ? await thumbFile.readAsBytes() : placeholderJpeg();
      final thumbs = thumbBytes.isEmpty ? null : await processPhoto(thumbBytes, styleId: 'none', applyStyle: false);
      if (mounted && thumbs != null) setState(() => _lastThumb = thumbs.thumb);
      final bytes = await styled.readAsBytes();
      await ref.read(uploadQueueProvider.notifier).enqueue(
            groupId: group.id,
            kind: 'video',
            style: _style.id,
            mime: 'video/mp4',
            takenAt: takenAt,
            fromRoll: false,
            width: thumbs?.width ?? 0,
            height: thumbs?.height ?? 0,
            durationMs: durationMs,
            original: bytes,
            display: thumbs?.display ?? thumbBytes,
            thumb: thumbs?.thumb ?? thumbBytes,
            originalExt: 'mp4',
          );
      if (ref.read(prefsProvider).saveOwnToAlbum) {
        await _saveToAlbum(() => Gal.putVideo(styled.path, album: albumName(group)));
      }
    } catch (e) {
      debugPrint('video failed: $e');
      if (mounted) showMessage(context, context.l10n.videoFailed);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _pickGroup(List<Group> groups) {
    showModalBottomSheet<void>(
      context: context,
      builder: (c) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(context.l10n.shootInGroup, style: CT.title(22)),
            const SizedBox(height: 12),
            for (final g in groups.where((g) => !g.isArchived && !g.archived))
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(g.name, style: CT.text(16, weight: FontWeight.w600)),
                subtitle: Text('${context.l10n.membersCount(g.members.length)} · ${context.l10n.photosCount(g.totalCount)}', style: CT.text(13, color: CT.muted)),
                trailing: g.id == ref.read(activeGroupIdProvider) ? const Icon(Icons.check_circle, color: CT.accent) : null,
                onTap: () {
                  ref.read(activeGroupIdProvider.notifier).set(g.id);
                  Navigator.pop(c);
                },
              ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final group = ref.watch(activeGroupProvider);
    final groups = ref.watch(groupsProvider).value ?? const <Group>[];
    final gate = ref.watch(activeProGateProvider);
    final isPro = gate.unlocked;
    // Pro style picked but this group has no Pro (e.g. after switching groups).
    if (group != null && !gate.canUseStyle(styleIsPro: _style.pro)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _style.pro && !ref.read(activeProGateProvider).unlocked) setState(() => _style = CameraStyle.instant);
      });
    }
    final pending = ref.watch(uploadQueueProvider).length;
    final l = context.l10n;

    return Scaffold(
      backgroundColor: CT.bg,
      body: SafeArea(
        child: Column(children: [
          // top bar
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
            child: Row(children: [
              IconButton(tooltip: l.close, onPressed: _recording ? null : () => context.pop(), icon: const Icon(Icons.close)),
              TextButton.icon(
                onPressed: _style.forceFlash ? null : _cycleFlash,
                icon: Icon(
                  _style.forceFlash || _flash == FlashMode.always
                      ? Icons.flash_on
                      : (_flash == FlashMode.off ? Icons.flash_off : Icons.flash_auto),
                  color: CT.ink,
                  size: 20,
                ),
                label: Text(_style.forceFlash ? l.flash : (_flash == FlashMode.always ? l.flashOn : _flash == FlashMode.off ? l.flashOff : l.flashAuto),
                    maxLines: 1, style: CT.text(14, weight: FontWeight.w600)),
              ),
              // Centred between the two buttons; shrinks (with an ellipsis)
              // when a long group name or flash label leaves less room.
              Expanded(
                child: Center(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _pickGroup(groups),
                    child: Container(
                      // 44pt tall hit target around the visible pill
                      constraints: const BoxConstraints(minHeight: 44),
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(border: Border.all(color: CT.ink, width: 1.5), borderRadius: BorderRadius.circular(10)),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.circle, size: 8, color: CT.accent),
                          const SizedBox(width: 6),
                          Flexible(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 150),
                              child: Text(group == null ? l.chooseGroup : '${group.name} · ${group.members.length}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(13, weight: FontWeight.w600)),
                            ),
                          ),
                          const Icon(Icons.expand_more, size: 18),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                tooltip: l.switchCamera,
                onPressed: _cameras.length > 1 && !_recording ? () => _start((_cameraIndex + 1) % _cameras.length) : null,
                icon: const Icon(Icons.cameraswitch_outlined),
              ),
            ]),
          ),
          // viewfinder
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: _viewfinder())),
          // styles
          SizedBox(
            height: 58,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              scrollDirection: Axis.horizontal,
              itemCount: CameraStyle.all.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final s = CameraStyle.all[i];
                return CTChip(
                  s.name,
                  selected: s.id == _style.id,
                  dashed: s.pro && !isPro,
                  icon: s.pro && !isPro ? Icons.star_rounded : null,
                  onTap: () => _selectStyle(s),
                );
              },
            ),
          ),
          // Pro styles unlocked by someone else in this group ("Pro via Sanne").
          if (gate.cameraHint != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 6),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.star_rounded, size: 14, color: CT.accent),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(gate.cameraHint!,
                      maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(12, color: CT.muted, weight: FontWeight.w500)),
                ),
              ]),
            ),
          // mode switch
          CameraModeSwitch(videoMode: _videoMode, enabled: !_recording, onChanged: _setVideoMode),
          // shutter row
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: group == null ? null : () => context.push('/group/${group.id}'),
                child: SizedBox(
                  width: 56,
                  child: Stack(clipBehavior: Clip.none, children: [
                    Transform.rotate(
                      angle: -0.1,
                      child: Container(
                        width: 48,
                        height: 54,
                        padding: const EdgeInsets.fromLTRB(3, 3, 3, 9),
                        decoration: BoxDecoration(color: Colors.white, boxShadow: CT.printShadow, borderRadius: BorderRadius.circular(2)),
                        child: _lastThumb == null
                            ? Container(color: CT.cream, child: const Icon(Icons.photo_library_outlined, size: 18, color: CT.muted))
                            : Image.memory(_lastThumb!, fit: BoxFit.cover),
                      ),
                    ),
                    if (pending > 0)
                      Positioned(
                        right: 0,
                        top: -6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(10)),
                          child: Text('$pending', style: CT.text(11, color: Colors.white, weight: FontWeight.w700)),
                        ),
                      ),
                  ]),
                ),
              ),
              _shutter(group),
              // keeps the shutter centred
              const SizedBox(width: 56),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _shutter(Group? group) {
    return ShutterButton(
      videoMode: _videoMode,
      recording: _recording,
      busy: _busy,
      elapsed: _recording && _recordStart != null ? DateTime.now().difference(_recordStart!) : Duration.zero,
      onTap: group == null ? () => showMessage(context, context.l10n.createOrJoinFirst) : () => _shoot(group),
    );
  }

  Widget _viewfinder() {
    final c = _controller;
    final instant = _style.frame == FrameKind.instant;
    Widget content;
    if (_error != null) {
      content = Container(
        key: const ValueKey('vf-error'),
        color: CT.cream,
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Text(_error!, textAlign: TextAlign.center, style: CT.text(15, color: CT.muted)),
      );
    } else if (c == null || !c.value.isInitialized) {
      content = Container(key: const ValueKey('vf-loading'), color: CT.cream);
    } else {
      final preview = FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: c.value.previewSize?.height ?? 1080,
          height: c.value.previewSize?.width ?? 1440,
          child: CameraPreview(c),
        ),
      );
      content = Stack(key: ValueKey(c), fit: StackFit.expand, children: [
        ColorFiltered(colorFilter: ColorFilter.matrix(_style.matrix.m), child: preview),
        if (_style.leak > 0)
          IgnorePointer(child: Opacity(opacity: _style.leak.clamp(0, 1), child: Image.asset('assets/images/light_leak.png', fit: BoxFit.cover))),
        IgnorePointer(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 0.95,
                colors: [Colors.transparent, Colors.black.withValues(alpha: _style.vignette * 0.75)],
                stops: const [0.55, 1],
              ),
            ),
          ),
        ),
        if (_style.grain > 0)
          IgnorePointer(
            child: Opacity(
              opacity: (_style.grain * 1.4).clamp(0, 1),
              child: Image.asset('assets/images/grain.png', repeat: ImageRepeat.repeat, fit: BoxFit.none),
            ),
          ),
        if (_stamp && !_videoMode)
          Positioned(
            right: 12,
            bottom: 10,
            child: GestureDetector(
              onTap: () => setState(() {
                _stamp = false;
                ref.read(prefsProvider).dateStamp = false;
              }),
              child: Text(Fmt.stamp(DateTime.now()),
                  style: const TextStyle(
                    fontFamily: 'Courier',
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Color(0xFFFF8A2A),
                    letterSpacing: 1,
                    shadows: [Shadow(color: Color(0xE6FF781E), blurRadius: 6)],
                  )),
            ),
          ),
        if (_flashAnim) Container(color: Colors.white),
      ]);
    }

    return LayoutBuilder(builder: (context, box) {
      // 3:4 photo area, inside an instant print when that style is chosen
      final printPadding = instant ? 12.0 : 0.0;
      final bottomBand = instant ? 56.0 : 0.0;
      final maxW = box.maxWidth;
      final maxH = box.maxHeight;
      var photoW = maxW - printPadding * 2;
      var photoH = photoW * 4 / 3;
      if (photoH + printPadding + bottomBand > maxH) {
        photoH = maxH - printPadding - bottomBand;
        photoW = photoH * 3 / 4;
      }
      return Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: EdgeInsets.fromLTRB(printPadding, printPadding, printPadding, bottomBand),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(instant ? 3 : 18),
            boxShadow: instant ? CT.printShadow : null,
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(instant ? 0 : 18),
              child: SizedBox(
                width: photoW,
                height: photoH,
                child: AnimatedSwitcher(duration: const Duration(milliseconds: 250), child: content),
              ),
            ),
            if (instant)
              Positioned(
                left: 4,
                bottom: -40,
                child: Text('${Fmt.short(DateTime.now())} · ${ref.watch(activeGroupProvider)?.name ?? ''}',
                    style: CT.text(14, color: CT.muted, weight: FontWeight.w500)),
              ),
          ]),
        ),
      );
    });
  }
}
