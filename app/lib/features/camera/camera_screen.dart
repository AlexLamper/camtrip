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
import 'camera_layout.dart';
import 'camera_picker_sheet.dart';
import 'camera_settings.dart';
import 'camera_settings_sheet.dart';
import 'flash_control.dart';
import 'low_light.dart';
import 'processor.dart';
import 'shutter_button.dart';
import 'shutter_feedback.dart';
import 'styles.dart';
import 'video_processor.dart';
import 'viewfinder_overlays.dart';

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

  /// The "..." sheet's settings; persisted per device by [_settingsStore].
  CameraSettings _settings = const CameraSettings();
  CameraSettingsStore? _settingsStore;

  /// Quality the running controller was started with.
  CaptureQuality? _activeQuality;
  late FlashSetting _flash;

  /// Hardware flash on the current (back) camera. Front cameras use the
  /// white screen flash instead.
  bool _hasFlash = true;
  bool _lowLight = false;
  bool _screenFlash = false;
  int? _countdown;
  Timer? _countdownTimer;

  /// Bumped on each front/back flip; drives the viewfinder's flip animation.
  int _flips = 0;

  /// A flip is starting the other camera; further flips wait for it.
  bool _switching = false;
  late final LowLightMonitor _lowLightMonitor = LowLightMonitor(onChanged: (low) {
    if (mounted) setState(() => _lowLight = low);
  });
  final _feedback = ShutterFeedback();

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
    if (!ref.read(activeProGateProvider).canUseStyle(styleIsPro: _style.pro)) _style = CameraStyle.defaultStyle;
    // Until the full settings are read: the two that also live in Prefs.
    _settings = CameraSettings(dateStamp: prefs.dateStamp, saveToRoll: prefs.saveOwnToAlbum);
    _flash = FlashSession.current ?? (_style.forceFlash ? FlashSetting.on : FlashSetting.auto);
    CameraSettingsStore.load().then((store) {
      if (!mounted) return;
      _settingsStore = store;
      _onSettingsChanged(store.read());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _initAfterTransition());
  }

  void _onSettingsChanged(CameraSettings next) {
    final prev = _settings;
    setState(() => _settings = next);
    if (next.sound && !prev.sound) _feedback.prepare();
    if (next.timer == ShutterTimer.off) _cancelCountdown();
    // A different resolution needs a new controller.
    if (_controller != null && _activeQuality != null && next.quality != _activeQuality && !_recording && !_busy) _start(_cameraIndex);
  }

  Future<void> _openSettings() async {
    final store = _settingsStore ??= await CameraSettingsStore.load();
    if (!mounted) return;
    await showCameraSettingsSheet(context, store: store, settings: _settings, onChanged: _onSettingsChanged);
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
    _countdownTimer?.cancel();
    _lowLightMonitor.dispose();
    _feedback.dispose();
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
    _countdownTimer?.cancel();
    // No brightness sampling in the background.
    final paused = _lowLightMonitor.pause();
    // Coming back from the background always lands in photo mode. Also drop
    // the preview from the tree before the controller goes away.
    setState(() {
      _recording = false;
      _videoMode = false;
      _countdown = null;
      _screenFlash = false;
      if (live) _controller = null;
    });
    if (live) paused.whenComplete(c.dispose);
  }

  void _setVideoMode(bool video) {
    if (_recording || video == _videoMode) return;
    HapticFeedback.selectionClick();
    _cancelCountdown();
    setState(() => _videoMode = video);
    _applyFlash();
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
    await _lowLightMonitor.pause();
    final old = _controller;
    _controller = null;
    await old?.dispose();
    final quality = _settings.quality;
    final c = CameraController(_cameras[index], quality.preset, enableAudio: true, imageFormatGroup: ImageFormatGroup.jpeg);
    try {
      await c.initialize();
      // Front cameras have no flash (iOS throws, Android silently ignores
      // it); they get the screen flash. A back camera that refuses a photo
      // flash mode has none either.
      final front = _cameras[index].lensDirection == CameraLensDirection.front;
      var hasFlash = !front;
      try {
        await c.setFlashMode(hasFlash ? _flash.controllerMode(video: false) : FlashMode.off);
      } on CameraException catch (_) {
        hasFlash = false;
      }
      if (hasFlash && _videoMode) {
        try {
          await c.setFlashMode(_flash.controllerMode(video: true));
        } on CameraException catch (_) {}
      }
      if (!mounted) {
        await c.dispose();
        return;
      }
      setState(() {
        _controller = c;
        _cameraIndex = index;
        _activeQuality = quality;
        _hasFlash = hasFlash;
        _lowLight = false;
        _error = null;
      });
      _lowLightMonitor.start(c);
    } on CameraException catch (e) {
      await c.dispose();
      if (mounted) setState(() => _error = _cameraError(e));
    }
  }

  bool get _front => _cameras.isNotEmpty && _cameras[_cameraIndex].lensDirection == CameraLensDirection.front;

  bool get _canFlip =>
      canFlipCamera(cameras: _cameras.length, recording: _recording, countingDown: _countdown != null, busy: _busy, switching: _switching);

  /// Front <-> back, from the flip button or a double tap on the viewfinder.
  Future<void> _flipCamera() async {
    if (!_canFlip) return;
    HapticFeedback.lightImpact();
    setState(() {
      _switching = true;
      _flips++;
    });
    try {
      // Let the card turn edge-on before the preview goes away.
      await Future<void>.delayed(ViewfinderFlip.duration ~/ 2);
      if (mounted) await _start(flipTargetIndex(_cameras, _cameraIndex));
    } finally {
      if (mounted) setState(() => _switching = false);
    }
  }

  Future<void> _selectStyle(CameraStyle s) async {
    if (!ref.read(activeProGateProvider).canUseStyle(styleIsPro: s.pro)) {
      context.push('/pro');
      return;
    }
    HapticFeedback.selectionClick();
    setState(() => _style = s);
    ref.read(prefsProvider).cameraStyle = s.id;
    // The disposable look is made with flash: switch it on, but leave the
    // button free so it can still be turned off.
    if (s.forceFlash) {
      await _setFlash(FlashSetting.on);
    } else {
      await _applyFlash();
    }
  }

  Future<void> _cycleFlash() => _setFlash(_flash.next);

  Future<void> _setFlash(FlashSetting next) async {
    if (next != _flash) HapticFeedback.selectionClick();
    FlashSession.current = next;
    setState(() => _flash = next);
    await _applyFlash();
  }

  /// Pushes the flash choice to the controller (torch in video mode).
  Future<void> _applyFlash() async {
    final c = _controller;
    if (c == null || !c.value.isInitialized || !_hasFlash) return;
    try {
      await c.setFlashMode(_flash.controllerMode(video: _videoMode));
    } on CameraException catch (e) {
      debugPrint('flash failed: $e');
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
      setState(() => _style = CameraStyle.defaultStyle);
      showMessage(context, context.l10n.styleProFallback(CameraStyle.defaultStyle.name));
      return;
    }
    if (_videoMode) return _toggleRecording(group);
    // Self-timer: a second tap cancels the countdown.
    if (_countdown != null) return _cancelCountdown();
    if (_settings.timer != ShutterTimer.off) return _startCountdown(group, _settings.timer.seconds);
    return _capture(group);
  }

  void _startCountdown(Group group, int seconds) {
    _countdownTimer?.cancel();
    if (_settings.haptics) HapticFeedback.selectionClick();
    setState(() => _countdown = seconds);
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return t.cancel();
      final left = (_countdown ?? 1) - 1;
      if (left <= 0) {
        t.cancel();
        setState(() => _countdown = null);
        _capture(group);
        return;
      }
      if (_settings.haptics) HapticFeedback.selectionClick();
      setState(() => _countdown = left);
    });
  }

  void _cancelCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    if (_countdown != null && mounted) setState(() => _countdown = null);
  }

  Future<void> _capture(Group group) async {
    final c = _controller;
    if (c == null || _busy || !c.value.isInitialized) return;
    setState(() => _busy = true);
    // Free the camera: no brightness sample may run during the capture.
    await _lowLightMonitor.pause();
    // Selfie in the dark: light the face with a white screen.
    final screenFlash = _front && _flash.wantsScreenFlash(lowLight: _lowLight);
    if (screenFlash && mounted) {
      setState(() => _screenFlash = true);
      // give auto-exposure a moment to adapt to the white light
      await Future<void>.delayed(const Duration(milliseconds: 350));
    }
    if (!mounted) return;
    if (_settings.haptics) HapticFeedback.mediumImpact();
    if (_settings.sound) unawaited(_feedback.click());
    setState(() => _flashAnim = true);
    Future.delayed(const Duration(milliseconds: 140), () => mounted ? setState(() => _flashAnim = false) : null);
    try {
      final shot = await c.takePicture();
      final takenAt = DateTime.now();
      if (mounted) {
        setState(() {
          _screenFlash = false;
          _busy = false; // ready for the next shot while this one develops
        });
        if (identical(_controller, c)) _lowLightMonitor.start(c);
      }
      final bytes = await shot.readAsBytes();
      final opts = PhotoProcessOptions.from(_settings, frontCamera: _front, stampText: Fmt.stamp(takenAt));
      final processed = await processPhoto(
        bytes,
        styleId: _style.id,
        dateStamp: opts.dateStamp,
        showDateStamp: opts.showDateStamp,
        mirror: opts.mirror,
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
      if (_settings.saveToRoll) {
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
      if (mounted && (_busy || _screenFlash)) {
        setState(() {
          _busy = false;
          _screenFlash = false;
        });
        // capture failed before the sampler was restarted
        if (identical(_controller, c) && !_lowLightMonitor.running) _lowLightMonitor.start(c);
      }
    }
  }

  Future<void> _toggleRecording(Group group) async {
    final c = _controller!;
    if (!_recording) {
      if (_settings.haptics) HapticFeedback.mediumImpact();
      // The image stream and a recording cannot run together.
      await _lowLightMonitor.pause();
      try {
        await c.startVideoRecording();
      } on CameraException catch (e) {
        debugPrint('record failed: $e');
        if (mounted) showMessage(context, context.l10n.recordingFailed);
        if (identical(_controller, c)) _lowLightMonitor.start(c);
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
      if (mounted && identical(_controller, c)) _lowLightMonitor.start(c);
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
      if (_settings.saveToRoll) {
        await _saveToAlbum(() => Gal.putVideo(styled.path, album: albumName(group)));
      }
    } catch (e) {
      debugPrint('video failed: $e');
      if (mounted) showMessage(context, context.l10n.videoFailed);
    } finally {
      if (mounted) setState(() => _busy = false);
      if (mounted && identical(_controller, c) && !_recording && !_lowLightMonitor.running) _lowLightMonitor.start(c);
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
    // Pro style picked but this group has no Pro (e.g. after switching groups).
    if (group != null && !gate.canUseStyle(styleIsPro: _style.pro)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _style.pro && !ref.read(activeProGateProvider).unlocked) setState(() => _style = CameraStyle.defaultStyle);
      });
    }
    final pending = ref.watch(uploadQueueProvider).length;
    final l = context.l10n;

    return Scaffold(
      backgroundColor: CT.bg,
      body: Stack(children: [
        SafeArea(
          child: CameraScreenLayout(
            topBar: CameraTopBar(
              onClose: _recording ? null : () => context.pop(),
              onSettings: _recording ? null : _openSettings,
              groupPill: CameraGroupPill(
                label: group == null ? l.chooseGroup : '${group.name} · ${group.members.length}',
                onTap: () => _pickGroup(groups),
              ),
            ),
            viewfinder: ViewfinderFlip(
              flips: _flips,
              onDoubleTap: _canFlip ? _flipCamera : null,
              child: _viewfinder(),
            ),
            controls: CameraControlsRow(
              flash: FlashButton(
                setting: _flash,
                // front camera: screen flash, photos only
                hasFlash: _front ? !_videoMode : _hasFlash,
                screenFlash: _front,
                onPressed: _recording ? null : _cycleFlash,
              ),
              // current camera; opens the camera picker (camera_picker_sheet.dart)
              selector: CameraPickerButton(
                style: _style,
                onTap: _recording
                    ? null
                    : () async {
                        final s = await showCameraPicker(context, current: _style, gate: ref.read(activeProGateProvider));
                        if (s != null && mounted) await _selectStyle(s);
                      },
              ),
              flip: CameraFlipButton(front: _front, onPressed: _canFlip ? _flipCamera : null),
            ),
            // Pro styles unlocked by someone else in this group ("Pro via Sanne").
            hint: gate.cameraHint == null
                ? null
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.star_rounded, size: 14, color: CT.accent),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(gate.cameraHint!,
                          maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(12, color: CT.muted, weight: FontWeight.w500)),
                    ),
                  ]),
            modeSwitch: CameraModeSwitch(videoMode: _videoMode, enabled: !_recording, onChanged: _setVideoMode),
            lastShot: LastShotThumb(
              thumb: _lastThumb,
              pending: pending,
              onTap: group == null ? null : () => context.push('/group/${group.id}'),
            ),
            shutter: _shutter(group),
          ),
        ),
        // Front-camera "flash": the whole screen turns white for the shot.
        if (_screenFlash) const Positioned.fill(child: IgnorePointer(child: ColoredBox(key: ValueKey('screen-flash'), color: Colors.white))),
      ]),
    );
  }

  /// Dark scene, flash not on, and something the flash can do about it.
  bool get _showLowLightPill =>
      _lowLight && _flash != FlashSetting.on && !_recording && _countdown == null && (_front ? !_videoMode : _hasFlash);

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
        if (_settings.grid) const GridOverlay(),
        if (_settings.dateStamp && !_videoMode)
          Positioned(
            right: 12,
            bottom: 10,
            child: GestureDetector(
              onTap: () {
                final next = _settings.copyWith(dateStamp: false);
                _settingsStore?.write(next);
                ref.read(prefsProvider).dateStamp = false;
                _onSettingsChanged(next);
              },
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
        if (_countdown != null) CountdownOverlay(seconds: _countdown!),
        if (_showLowLightPill)
          Positioned(
            top: 6,
            left: 12,
            right: 12,
            child: Center(child: LowLightPill(onTap: () => _setFlash(FlashSetting.on))),
          ),
        if (_flashAnim) Container(color: Colors.white),
      ]);
    }

    return ViewfinderFrame(
      instant: instant,
      caption: '${Fmt.short(DateTime.now())} · ${ref.watch(activeGroupProvider)?.name ?? ''}',
      child: AnimatedSwitcher(duration: const Duration(milliseconds: 250), child: content),
    );
  }
}
