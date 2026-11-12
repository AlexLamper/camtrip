import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

import 'styles.dart';

class ProcessedPhoto {
  ProcessedPhoto({required this.original, required this.display, required this.thumb, required this.width, required this.height});
  final Uint8List original; // full resolution, style applied
  final Uint8List display; // max 2048 px
  final Uint8List thumb; // max 480 px
  final int width;
  final int height;
}

class _Job {
  _Job(this.bytes, this.styleId, this.stamp, this.applyStyle, this.mirror);
  final Uint8List bytes;
  final String styleId;
  final String? stamp;
  final bool applyStyle;
  final bool mirror;
}

/// Applies a camera style to a captured photo, off the UI thread.
/// The same maths as the live preview (colour matrix, vignette, grain, leak),
/// plus the date stamp and the instant frame which only exist on the print.
Future<ProcessedPhoto> processPhoto(
  Uint8List bytes, {
  required String styleId,
  String? dateStamp,
  bool applyStyle = true,
  bool mirror = false,
}) =>
    compute(_process, _Job(bytes, styleId, dateStamp, applyStyle, mirror));

/// Only the resized display + thumbnail, for photos uploaded from the camera roll.
Future<ProcessedPhoto> processRollPhoto(File file) async => processPhoto(await file.readAsBytes(), styleId: 'none', applyStyle: false);

ProcessedPhoto _process(_Job job) {
  var image = img.decodeImage(job.bytes);
  if (image == null) throw Exception('Kon de foto niet lezen');
  image = img.bakeOrientation(image);
  if (job.mirror) image = img.flipHorizontal(image);

  // Cap the working size: 12-50 MP sensors would take seconds per effect,
  // and nobody prints a holiday snap at 8000 px.
  const maxSide = 3200;
  if (math.max(image.width, image.height) > maxSide) {
    image = image.width >= image.height ? img.copyResize(image, width: maxSide) : img.copyResize(image, height: maxSide);
  }

  if (job.applyStyle) {
    final style = CameraStyle.byId(job.styleId);
    if (style.blur > 0) image = img.gaussianBlur(image, radius: math.max(1, (style.blur * image.width / 1000).round()));
    _applyMatrixVignetteGrainLeak(image, style);
    if (job.stamp != null) _drawStamp(image, job.stamp!);
    if (style.frame == FrameKind.instant) image = _instantFrame(image);
  }

  final original = Uint8List.fromList(img.encodeJpg(image, quality: 92));
  final display = _resized(image, 2048, 85);
  final thumb = _resized(image, 480, 78);
  return ProcessedPhoto(original: original, display: display, thumb: thumb, width: image.width, height: image.height);
}

Uint8List _resized(img.Image src, int maxSide, int quality) {
  final scaled = math.max(src.width, src.height) <= maxSide
      ? src
      : (src.width >= src.height ? img.copyResize(src, width: maxSide) : img.copyResize(src, height: maxSide));
  return Uint8List.fromList(img.encodeJpg(scaled, quality: quality));
}

void _applyMatrixVignetteGrainLeak(img.Image image, CameraStyle style) {
  final m = style.matrix.m;
  final w = image.width, h = image.height;
  final cx = w / 2, cy = h / 2;
  final norm = math.sqrt(cx * cx + cy * cy);
  final rnd = math.Random(w * 31 + h);
  final grainAmp = style.grain * 34;
  final leakR = style.leak;

  for (final p in image) {
    final r = p.r.toDouble(), g = p.g.toDouble(), b = p.b.toDouble();
    var nr = m[0] * r + m[1] * g + m[2] * b + m[4];
    var ng = m[5] * r + m[6] * g + m[7] * b + m[9];
    var nb = m[10] * r + m[11] * g + m[12] * b + m[14];

    final dx = (p.x - cx), dy = (p.y - cy);
    final dist = math.sqrt(dx * dx + dy * dy) / norm * 1.414;
    final v = vignetteFactor(dist, style.vignette);
    nr *= v;
    ng *= v;
    nb *= v;

    if (leakR > 0) {
      // warm glow bleeding in from the left edge, screen-blended
      final lx = p.x / w;
      final ly = (p.y / h - 0.3).abs();
      final k = leakR * math.max(0.0, 1 - lx * 2.6) * math.max(0.0, 1 - ly * 1.4);
      if (k > 0) {
        nr = 255 - (255 - nr) * (1 - k * 0.95);
        ng = 255 - (255 - ng) * (1 - k * 0.45);
        nb = 255 - (255 - nb) * (1 - k * 0.15);
      }
    }

    if (grainAmp > 0) {
      final n = (rnd.nextDouble() + rnd.nextDouble() - 1) * grainAmp;
      nr += n;
      ng += n;
      nb += n;
    }

    p
      ..r = nr.clamp(0, 255)
      ..g = ng.clamp(0, 255)
      ..b = nb.clamp(0, 255);
  }
}

/// Orange glowing "'27 07 13" in the bottom-right corner, like old compacts.
void _drawStamp(img.Image image, String text) {
  final font = img.arial48;
  final scale = math.max(1, (image.width / 1400).round());
  const glyphW = 26; // arial48 average advance
  final textW = text.length * glyphW * scale;
  final margin = (image.width * 0.04).round();
  final x = image.width - textW - margin;
  final y = image.height - 48 * scale - margin;

  final layer = img.Image(width: textW + 40, height: 48 * scale + 40, numChannels: 4);
  img.drawString(layer, text, font: font, x: 20, y: 20, color: img.ColorRgba8(255, 138, 42, 255));
  final scaled = scale > 1 ? img.copyResize(layer, width: layer.width * scale, height: layer.height * scale) : layer;
  final glow = img.gaussianBlur(scaled.clone(), radius: 6 * scale);
  img.compositeImage(image, glow, dstX: x - 20 * scale, dstY: y - 20 * scale, blend: img.BlendMode.screen);
  img.compositeImage(image, scaled, dstX: x - 20 * scale, dstY: y - 20 * scale);
}

img.Image _instantFrame(img.Image photo) {
  final side = (photo.width * 0.055).round();
  final bottom = (photo.width * 0.22).round();
  final out = img.Image(width: photo.width + side * 2, height: photo.height + side + bottom);
  img.fill(out, color: img.ColorRgb8(252, 251, 248));
  img.compositeImage(out, photo, dstX: side, dstY: side);
  return out;
}
