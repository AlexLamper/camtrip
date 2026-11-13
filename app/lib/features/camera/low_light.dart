import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

/// Average brightness (0..255) of a frame, from a sparse grid of samples.
///
/// YUV420 / NV21: the first plane is luma (Y) already. BGRA8888 (iOS):
/// Rec. 601 luma from the colour bytes. Returns null for formats without
/// raw pixels (JPEG).
double? averageLuma({
  required Uint8List bytes,
  required int width,
  required int height,
  required int bytesPerRow,
  required bool bgra,
  int grid = 24,
}) {
  if (width <= 0 || height <= 0 || bytes.isEmpty) return null;
  final pixelBytes = bgra ? 4 : 1;
  var sum = 0.0;
  var n = 0;
  for (var gy = 0; gy < grid; gy++) {
    final y = ((gy + 0.5) * height / grid).floor();
    final row = y * bytesPerRow;
    for (var gx = 0; gx < grid; gx++) {
      final x = ((gx + 0.5) * width / grid).floor();
      final i = row + x * pixelBytes;
      if (i + pixelBytes > bytes.length) continue;
      if (bgra) {
        sum += 0.114 * bytes[i] + 0.587 * bytes[i + 1] + 0.299 * bytes[i + 2];
      } else {
        sum += bytes[i];
      }
      n++;
    }
  }
  return n == 0 ? null : sum / n;
}

/// [averageLuma] for a streamed camera frame.
double? lumaOfCameraImage(CameraImage image) {
  if (image.planes.isEmpty) return null;
  final group = image.format.group;
  if (group == ImageFormatGroup.jpeg) return null;
  final p = image.planes.first;
  return averageLuma(
    bytes: p.bytes,
    width: image.width,
    height: image.height,
    bytesPerRow: p.bytesPerRow,
    bgra: group == ImageFormatGroup.bgra8888,
  );
}

/// Low-light decision with hysteresis, so the hint does not flicker when the
/// scene sits around the threshold. Smooths samples (exponential moving
/// average) and needs [confirmSamples] in a row on the other side of the
/// band before it flips. Below [enterBelow] counts as dark, above
/// [exitAbove] as light again; anything in between keeps the current state.
class LowLightHysteresis {
  LowLightHysteresis({this.enterBelow = 42, this.exitAbove = 64, this.confirmSamples = 2, this.smoothing = 0.5})
      : assert(enterBelow < exitAbove);

  final double enterBelow;
  final double exitAbove;
  final int confirmSamples;

  /// Weight of the newest sample (1 = no smoothing).
  final double smoothing;

  bool _low = false;
  double? _avg;
  int _streak = 0;

  bool get isLow => _low;
  double? get smoothed => _avg;

  /// Feeds one luma sample; returns the (possibly changed) low-light state.
  bool add(double luma) {
    final prev = _avg;
    final avg = _avg = prev == null ? luma : prev + (luma - prev) * smoothing;
    final crossing = _low ? avg > exitAbove : avg < enterBelow;
    _streak = crossing ? _streak + 1 : 0;
    if (_streak >= confirmSamples) {
      _low = !_low;
      _streak = 0;
    }
    return _low;
  }

  void reset() {
    _low = false;
    _avg = null;
    _streak = 0;
  }
}

/// Watches the viewfinder's brightness with almost no cost: every
/// [interval] it opens the camera's image stream, reads one frame, and
/// closes it again (a full-resolution stream left running would copy
/// megabytes per frame into Dart). Call [pause] before taking a picture or
/// recording, and when the app goes to the background.
class LowLightMonitor {
  LowLightMonitor({required this.onChanged, this.interval = const Duration(milliseconds: 600), LowLightHysteresis? hysteresis})
      : hysteresis = hysteresis ?? LowLightHysteresis();

  final ValueChanged<bool> onChanged;
  final Duration interval;
  final LowLightHysteresis hysteresis;

  CameraController? _controller;
  Timer? _timer;
  Future<void>? _closing;
  bool _sampling = false;
  bool _disposed = false;

  bool get running => _timer != null;

  /// Starts (or restarts) sampling [controller]. Platforms without image
  /// streaming are ignored.
  void start(CameraController controller) {
    if (_disposed) return;
    if (!identical(controller, _controller)) hysteresis.reset();
    _controller = controller;
    _timer?.cancel();
    bool supported;
    try {
      supported = controller.supportsImageStreaming();
    } catch (_) {
      supported = false;
    }
    if (!supported) return;
    _timer = Timer.periodic(interval, (_) => _sample());
  }

  /// Stops sampling and waits until the stream is closed, so the camera is
  /// free for a capture.
  Future<void> pause() async {
    _timer?.cancel();
    _timer = null;
    final c = _controller;
    if (c != null && _sampling) await _stop(c);
    await _closing;
  }

  void dispose() {
    _disposed = true;
    _timer?.cancel();
    _timer = null;
    _controller = null;
  }

  Future<void> _sample() async {
    final c = _controller;
    if (c == null || _sampling || _closing != null) return;
    final v = c.value;
    if (!v.isInitialized || v.isTakingPicture || v.isRecordingVideo || v.isStreamingImages) return;
    _sampling = true;
    var got = false;
    try {
      await c.startImageStream((image) {
        if (got) return;
        got = true;
        final luma = lumaOfCameraImage(image);
        _stop(c);
        if (luma == null || _disposed) return;
        final before = hysteresis.isLow;
        final now = hysteresis.add(luma);
        if (now != before) onChanged(now);
      });
      // No frame in time (camera busy): give up this round.
      Future.delayed(const Duration(milliseconds: 400), () {
        if (!got) _stop(c);
      });
    } catch (e) {
      _sampling = false;
      debugPrint('low light sample failed: $e');
    }
  }

  Future<void> _stop(CameraController c) {
    final pending = _closing;
    if (pending != null) return pending;
    if (!_sampling) return Future.value();
    final done = Completer<void>();
    _closing = done.future;
    () async {
      try {
        if (c.value.isStreamingImages) await c.stopImageStream();
      } catch (_) {
        // controller disposed meanwhile
      }
      _sampling = false;
      _closing = null;
      done.complete();
    }();
    return done.future;
  }
}
