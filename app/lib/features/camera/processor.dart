import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

import 'film_look.dart';
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
  // [stamp] is null when the date stamp is switched off.
  final Uint8List bytes;
  final String styleId;
  final String? stamp;
  final bool applyStyle;
  final bool mirror;
}

/// Applies a camera style to a captured photo, off the UI thread.
/// The same maths as the live preview (colour matrix, vignette, grain, leak),
/// plus the date stamp and the instant frame which only exist on the print.
///
/// [showDateStamp] is the camera's "date stamp bottom right" setting: when
/// false no stamp is drawn, whatever [dateStamp] says.
Future<ProcessedPhoto> processPhoto(
  Uint8List bytes, {
  required String styleId,
  String? dateStamp,
  bool showDateStamp = true,
  bool applyStyle = true,
  bool mirror = false,
}) =>
    compute(_process, _Job(bytes, styleId, showDateStamp ? dateStamp : null, applyStyle, mirror));

/// Only the resized display + thumbnail, for photos uploaded from the camera roll.
Future<ProcessedPhoto> processRollPhoto(File file) async => processPhoto(await file.readAsBytes(), styleId: 'none', applyStyle: false);

/// Plain dark frame, used as video thumbnail when ffmpeg could not grab one.
Uint8List placeholderJpeg({int width = 480, int height = 640}) {
  final image = img.Image(width: width, height: height);
  img.fill(image, color: img.ColorRgb8(40, 38, 36));
  return Uint8List.fromList(img.encodeJpg(image, quality: 70));
}

ProcessedPhoto _process(_Job job) {
  var image = img.decodeImage(job.bytes);
  if (image == null) throw Exception('Kon de foto niet lezen');
  // Turn the picture upright in the pixels, then drop every bit of metadata:
  // package:image keeps EXIF (GPS location, camera, date ...) through
  // bakeOrientation/copyResize and writes it back in encodeJpg.
  image = stripMetadata(img.bakeOrientation(image));
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
    final look = style.look;
    if (look != null) {
      image = applyFilmLook(image, look, style);
    } else {
      _applyMatrixVignetteGrainLeak(image, style);
    }
    if (job.stamp != null) _drawStamp(image, job.stamp!);
    if (style.frame == FrameKind.instant) image = _instantFrame(image);
  }

  stripMetadata(image);
  final original = Uint8List.fromList(img.encodeJpg(image, quality: 92));
  final display = _resized(image, 2048, 85);
  final thumb = _resized(image, 480, 78);
  return ProcessedPhoto(original: original, display: display, thumb: thumb, width: image.width, height: image.height);
}

/// Removes EXIF (incl. GPS), XMP-style text chunks and anything else that
/// could identify where or with what a picture was taken. The colour profile
/// stays. Call after [img.bakeOrientation], so the orientation tag is no
/// longer needed.
@visibleForTesting
img.Image stripMetadata(img.Image image) {
  image.exif = img.ExifData();
  image.textData = null;
  return image;
}

Uint8List _resized(img.Image src, int maxSide, int quality) {
  final scaled = math.max(src.width, src.height) <= maxSide
      ? src
      : (src.width >= src.height ? img.copyResize(src, width: maxSide) : img.copyResize(src, height: maxSide));
  return Uint8List.fromList(img.encodeJpg(stripMetadata(scaled), quality: quality));
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

/// Applies a [FilmLook] (LUT grade, halation, vignette, grain) in place on the
/// raw bytes. Returns the image (converted to 8-bit RGB first if needed).
@visibleForTesting
img.Image applyFilmLook(img.Image image, FilmLook look, CameraStyle style, {int seed = 1}) {
  if (image.format != img.Format.uint8 || image.numChannels < 3 || image.hasPalette) {
    image = image.convert(format: img.Format.uint8, numChannels: 3);
  }
  final w = image.width, h = image.height, nc = image.numChannels;
  final px = image.toUint8List();

  // 1. scene statistics on a sparse grid: mean luminance and midtone warmth
  var sumY = 0.0, n = 0, mr = 0.0, mb = 0.0, nm = 0;
  final step = math.max(1, math.sqrt(w * h / 40000).floor());
  for (var y = 0; y < h; y += step) {
    for (var x = 0; x < w; x += step) {
      final i = (y * w + x) * nc;
      final r = px[i], g = px[i + 1], b = px[i + 2];
      final l = (0.2126 * r + 0.7152 * g + 0.0722 * b) / 255;
      sumY += l;
      n++;
      if (l > 0.15 && l < 0.85) {
        mr += r;
        mb += b;
        nm++;
      }
    }
  }
  final meanY = sumY / math.max(1, n);
  final warmth = nm > 100 ? (mr + 1) / (mb + 1) : 1.0;
  final amber = look.amberFor(meanY, warmth);
  final pos = FilmLook.positionTable(look.liftFor(meanY));
  final lut = look.buildLut(amber);
  const s = FilmLook.lutSize, s2 = s * s;

  // 2. halation map: highlights averaged into 16x16 cells, blurred, bilinear later
  final hw = (w / 16).ceil() + 1, hh = (h / 16).ceil() + 1;
  var halo = Float32List(hw * hh);
  if (look.halation > 0) {
    final cnt = Float32List(hw * hh);
    for (var y = 0; y < h; y += 2) {
      for (var x = 0; x < w; x += 2) {
        final i = (y * w + x) * nc;
        final l = (0.2126 * px[i] + 0.7152 * px[i + 1] + 0.0722 * px[i + 2]) / 255;
        final c = (y >> 4) * hw + (x >> 4);
        halo[c] += ((l - 0.72) / 0.28).clamp(0.0, 1.0);
        cnt[c] += 1;
      }
    }
    for (var i = 0; i < halo.length; i++) {
      if (cnt[i] > 0) halo[i] /= cnt[i];
    }
    for (var pass = 0; pass < 4; pass++) {
      halo = _boxBlur3(halo, hw, hh);
    }
  }

  // 3. per pixel: LUT, halation, vignette, grain
  final cx = w / 2, cy = h / 2;
  final norm = math.sqrt(cx * cx + cy * cy);
  final grainAmp = look.grain * 255;
  final chroma = look.chromaGrain;
  final wide = math.max(w, h) > 1500;
  final g1 = GrainRows(w, seed * 7919 + w, wide: wide);
  final hal = look.halation;
  final dx2 = Float64List(w);
  for (var x = 0; x < w; x++) {
    dx2[x] = (x - cx) * (x - cx);
  }
  final vk = 1.414 / norm;
  for (var y = 0; y < h; y++) {
    final n1 = grainAmp > 0 ? g1.nextRow() : null;
    final dy = (y - cy) * (y - cy);
    final hy = y / 16, hy0 = hy.floor(), fy = hy - hy0;
    var i = y * w * nc;
    // colour grain: the same field read 613 px further on (and wrapped), so
    // locally uncorrelated with the luminance grain without a second field
    var j = 613 % w;
    for (var x = 0; x < w; x++, i += nc, j = j + 1 == w ? 0 : j + 1) {
      // trilinear lookup
      final pr = pos[px[i]], pg = pos[px[i + 1]], pb = pos[px[i + 2]];
      final r0 = math.min(pr.floor(), s - 2), g0 = math.min(pg.floor(), s - 2), b0 = math.min(pb.floor(), s - 2);
      final fr = pr - r0, fg = pg - g0, fb = pb - b0;
      // unrolled: interpolate along b, then g, then r
      final o000 = (r0 * s2 + g0 * s + b0) * 3, o010 = o000 + s * 3, o100 = o000 + s2 * 3, o110 = o100 + s * 3;
      final gb = 1 - fb, gg = 1 - fg, gr = 1 - fr;
      final r00 = lut[o000] * gb + lut[o000 + 3] * fb, r01 = lut[o010] * gb + lut[o010 + 3] * fb;
      final r10 = lut[o100] * gb + lut[o100 + 3] * fb, r11 = lut[o110] * gb + lut[o110 + 3] * fb;
      final g00 = lut[o000 + 1] * gb + lut[o000 + 4] * fb, g01 = lut[o010 + 1] * gb + lut[o010 + 4] * fb;
      final g10 = lut[o100 + 1] * gb + lut[o100 + 4] * fb, g11 = lut[o110 + 1] * gb + lut[o110 + 4] * fb;
      final b00 = lut[o000 + 2] * gb + lut[o000 + 5] * fb, b01 = lut[o010 + 2] * gb + lut[o010 + 5] * fb;
      final b10 = lut[o100 + 2] * gb + lut[o100 + 5] * fb, b11 = lut[o110 + 2] * gb + lut[o110 + 5] * fb;
      var r = (r00 * gg + r01 * fg) * gr + (r10 * gg + r11 * fg) * fr;
      var g = (g00 * gg + g01 * fg) * gr + (g10 * gg + g11 * fg) * fr;
      var b = (b00 * gg + b01 * fg) * gr + (b10 * gg + b11 * fg) * fr;

      if (hal > 0) {
        final hx = x / 16, hx0 = hx.floor(), fx = hx - hx0;
        final c = hy0 * hw + hx0;
        final hv = (halo[c] * (1 - fx) + halo[c + 1] * fx) * (1 - fy) + (halo[c + hw] * (1 - fx) + halo[c + hw + 1] * fx) * fy;
        if (hv > 0.001) {
          final k = hal * hv;
          r += k * (255 - r);
          g += k * 0.45 * (255 - g);
          b += k * 0.1 * (255 - b);
        }
      }

      final v = vignetteFactor(math.sqrt(dx2[x] + dy) * vk, style.vignette);
      r *= v;
      g *= v;
      b *= v;

      if (n1 != null) {
        final l = (0.2126 * r + 0.7152 * g + 0.0722 * b) / 255;
        final amp = grainAmp * (0.35 + 2.6 * l * (1 - l));
        final gn = n1[x] * amp;
        final cn = n1[j] * amp * chroma;
        r += gn + cn;
        g += gn;
        b += gn - cn;
      }

      px[i] = r < 0 ? 0 : (r > 255 ? 255 : r.round());
      px[i + 1] = g < 0 ? 0 : (g > 255 ? 255 : g.round());
      px[i + 2] = b < 0 ? 0 : (b > 255 ? 255 : b.round());
    }
  }
  return image;
}

Float32List _boxBlur3(Float32List src, int w, int h) {
  final tmp = Float32List(src.length), out = Float32List(src.length);
  for (var y = 0; y < h; y++) {
    for (var x = 0; x < w; x++) {
      final i = y * w + x;
      tmp[i] = (src[i] + src[y * w + math.max(0, x - 1)] + src[y * w + math.min(w - 1, x + 1)]) / 3;
    }
  }
  for (var y = 0; y < h; y++) {
    for (var x = 0; x < w; x++) {
      out[y * w + x] = (tmp[y * w + x] + tmp[math.max(0, y - 1) * w + x] + tmp[math.min(h - 1, y + 1) * w + x]) / 3;
    }
  }
  return out;
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
