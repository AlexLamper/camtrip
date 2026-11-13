import 'dart:math' as math;
import 'dart:typed_data';

/// A film look that a 4x5 colour matrix cannot express: per-channel tone
/// curves (lifted warm blacks, cream highlight roll-off, strong amber in the
/// mids), hue-selective saturation, scene-adaptive strength and exposure,
/// halation and fine luminance grain.
///
/// The numbers are fitted on reference prints (see README "Tweaking the Flash
/// look"). Everything is baked once per photo into a 33^3 RGB lookup table
/// plus a 256-entry exposure table, so the per-pixel cost is one trilinear
/// lookup, a vignette multiply and the grain.
class FilmLook {
  const FilmLook({
    required this.curves,
    this.satWarm = const (1.12, 1.0),
    this.satCool = const (0.85, 0.4),
    this.amberMin = 0.5,
    this.liftTarget = 0.30,
    this.liftMax = 0.5,
    this.halation = 0.22,
    this.grain = 0.02,
    this.chromaGrain = 0.45,
    this.yellowToOrange = 0.8,
  });

  /// Full-strength tone curves for R, G and B: 17 knots each, output 0..255
  /// for inputs 0, 1/16, ... 1. Strength (amber) blends from identity to these.
  final List<List<int>> curves;

  /// Saturation multiplier for red/orange/yellow input hues, as
  /// (daylight, flash/indoor); blended with the same amber strength.
  final (double, double) satWarm;

  /// Saturation multiplier for green/cyan/blue input hues (daylight, flash).
  final (double, double) satCool;

  /// Lowest strength, used for bright, cool daylight scenes.
  final double amberMin;

  /// Mean luminance (0..1) below which a photo gets a gentle exposure lift,
  /// so shots without flash don't go muddy. Gamma is never lower than [liftMax].
  final double liftTarget;
  final double liftMax;

  /// Red-orange glow around highlights (0..1).
  final double halation;

  /// Luminance grain standard deviation in the midtones (0..1 of full scale).
  /// 0.02 measures like the reference scans (about 4/255 after JPEG).
  final double grain;

  /// Colour grain relative to the luminance grain.
  final double chromaGrain;

  /// How much yellow hues (30-110 deg) are pulled towards orange after the
  /// curves, at full strength. The reference prints have almost no yellow:
  /// lemon walls, duvets and wood all print orange-amber. 0 = off.
  final double yellowToOrange;

  static const lutSize = 33;

  /// Scene-adaptive strength 0..1 from the mean luminance and warmth of the
  /// photo: dark and warm (indoor, tungsten, flash at night) gets the full
  /// amber look; bright, cool daylight a milder version.
  double amberFor(double meanLuma, double warmth) {
    final dark = ((0.55 - meanLuma) / 0.25).clamp(0.0, 1.0);
    final warm = ((warmth - 1.0) / 0.35).clamp(0.0, 1.0);
    return (amberMin + 0.35 * dark + 0.45 * warm).clamp(amberMin, 1.0);
  }

  /// Exposure lift gamma (1 = none) for a photo with this mean luminance.
  double liftFor(double meanLuma) {
    if (meanLuma >= liftTarget) return 1;
    final g = math.log(liftTarget) / math.log(math.max(meanLuma, 1e-3));
    return math.max(g, liftMax);
  }

  /// 1 for red/orange/yellow hues, 0 for green/cyan/blue, smooth in between.
  static double warmHueWeight(double r, double g, double b) {
    final mx = math.max(r, math.max(g, b)), mn = math.min(r, math.min(g, b));
    final d = mx - mn + 1e-6;
    double h;
    if (mx == r) {
      h = ((g - b) / d) % 6;
    } else if (mx == g) {
      h = (b - r) / d + 2;
    } else {
      h = (r - g) / d + 4;
    }
    h *= 60;
    if (h > 300) h -= 360;
    return ((h + 60) / 20).clamp(0.0, 1.0) * ((85 - h) / 20).clamp(0.0, 1.0);
  }

  double _curve(int c, double x) {
    final k = curves[c];
    final p = x.clamp(0.0, 1.0) * 16;
    final i = math.min(p.floor(), 15);
    final f = p - i;
    return (k[i] + (k[i + 1] - k[i]) * f) / 255;
  }

  /// The colour transform for one pixel (0..1 in, 0..1 out), without lift.
  List<double> grade(double r, double g, double b, double amber) {
    final y = 0.2126 * r + 0.7152 * g + 0.0722 * b;
    final sw = satWarm.$1 + (satWarm.$2 - satWarm.$1) * amber;
    final sc = satCool.$1 + (satCool.$2 - satCool.$1) * amber;
    final s = sc + (sw - sc) * warmHueWeight(r, g, b);
    final rs = (y + (r - y) * s).clamp(0.0, 1.0), gs = (y + (g - y) * s).clamp(0.0, 1.0), bs = (y + (b - y) * s).clamp(0.0, 1.0);
    var ro = rs + amber * (_curve(0, rs) - rs);
    var go = gs + amber * (_curve(1, gs) - gs);
    final bo = bs + amber * (_curve(2, bs) - bs);
    // yellow -> orange: compress hues 30..110 deg towards 30 (blue is the minimum there)
    final mx = math.max(ro, go), mn = bo;
    if (yellowToOrange > 0 && mx - mn > 1e-4 && mn <= ro && mn <= go) {
      final h = ro >= go ? 60 * (go - mn) / (mx - mn) : 120 - 60 * (ro - mn) / (mx - mn);
      if (h > 30 && h < 110) {
        final fade = h < 80 ? 1.0 : (110 - h) / 30;
        final c = 1 - yellowToOrange * amber * fade;
        final h2 = 30 + (h - 30) * c;
        if (h2 <= 60) {
          ro = mx;
          go = mn + (mx - mn) * h2 / 60;
        } else {
          go = mx;
          ro = mn + (mx - mn) * (120 - h2) / 60;
        }
      }
    }
    return [ro, go, bo];
  }

  /// 33^3 RGB table (index ((r*33)+g)*33+b, three bytes each).
  Uint8List buildLut(double amber) {
    const n = lutSize;
    final lut = Uint8List(n * n * n * 3);
    var o = 0;
    for (var ri = 0; ri < n; ri++) {
      for (var gi = 0; gi < n; gi++) {
        for (var bi = 0; bi < n; bi++) {
          final v = grade(ri / (n - 1), gi / (n - 1), bi / (n - 1), amber);
          lut[o++] = (v[0] * 255).round().clamp(0, 255);
          lut[o++] = (v[1] * 255).round().clamp(0, 255);
          lut[o++] = (v[2] * 255).round().clamp(0, 255);
        }
      }
    }
    return lut;
  }

  /// Byte value -> position in the LUT grid (0..32), with the exposure lift.
  static Float32List positionTable(double lift) {
    final t = Float32List(256);
    for (var v = 0; v < 256; v++) {
      t[v] = math.pow(v / 255, lift).toDouble() * (lutSize - 1);
    }
    return t;
  }

  /// ffmpeg filter for videos: the curves at a typical indoor strength,
  /// hue-selective saturation, vignette and fine luminance grain.
  String ffmpegFilter({double amber = 0.85, double vignette = 0.3, double grain = 0.02}) {
    String pts(int c) {
      final out = <String>[];
      for (var i = 0; i <= 8; i++) {
        final x = i / 8;
        final y = x + amber * (_curve(c, x) - x);
        out.add('${_n(x)}/${_n(y)}');
      }
      return out.join(' ');
    }

    final sw = satWarm.$1 + (satWarm.$2 - satWarm.$1) * amber;
    final sc = satCool.$1 + (satCool.$2 - satCool.$1) * amber;
    return [
      // muted greens/blues, warm hues as they are (huesaturation: -1..1 offsets)
      'huesaturation=saturation=${_n(sc - 1)}:colors=g+c+b:strength=1',
      if ((sw - 1).abs() > 0.01) 'huesaturation=saturation=${_n(sw - 1)}:colors=r+y:strength=1',
      "curves=r='${pts(0)}':g='${pts(1)}':b='${pts(2)}'",
      // yellow -> orange, like [yellowToOrange] on photos
      if (yellowToOrange > 0) 'huesaturation=hue=${(-20 * yellowToOrange * amber).toStringAsFixed(1)}:colors=y:strength=1',
      'vignette=angle=${(0.3 + vignette * 0.35).toStringAsFixed(2)}',
      'format=yuv420p', // grain on luma (c0) with a little on chroma (c1, c2)
      'noise=c0s=${(grain * 450).round()}:c0f=t+u:c1s=${(grain * 120).round()}:c1f=t+u:c2s=${(grain * 120).round()}:c2f=t+u',
    ].join(',');
  }

  static String _n(double v) => v.toStringAsFixed(3);
}

/// Fast xorshift noise, rows of film grain blurred with [1,4,6,4,1] (or
/// [1,2,1] on small pictures) in both directions, generated row by row so a
/// 3000 px photo never needs a full-size noise buffer.
class GrainRows {
  GrainRows(this.width, int seed, {required bool wide})
      : _wide = wide,
        _state = ((seed * 2654435761 + 1) & 0xffffffff) | 1 {
    final k = wide ? 5 : 3;
    final kern = wide ? const [1.0, 4.0, 6.0, 4.0, 1.0] : const [1.0, 2.0, 1.0];
    final sum = wide ? 16.0 : 4.0;
    // std of the blurred uniform(-1,1) noise, so [out] has unit std
    var sq = 0.0;
    for (final a in kern) {
      for (final b in kern) {
        sq += math.pow(a * b / (sum * sum), 2);
      }
    }
    _scale = 1 / math.sqrt(sq / 3) / (sum * sum);
    _ring = List.generate(k, (_) => Float32List(width));
    _raw = Float32List(width + k);
    for (var i = 0; i < k - 1; i++) {
      _fill(_ring[i]);
    }
    _next = k - 1;
    out = Float32List(width);
  }

  final int width;
  final bool _wide;
  int _state;
  late final List<Float32List> _ring;
  late final Float32List _raw;
  late final double _scale;
  late int _next;
  late final Float32List out;

  /// Horizontal blur of fresh noise (unnormalised: weights sum to 16 or 4).
  void _fill(Float32List row) {
    final raw = _raw;
    var x = _state;
    for (var i = 0; i < raw.length; i++) {
      x ^= (x << 13) & 0xffffffff;
      x ^= x >> 17;
      x ^= (x << 5) & 0xffffffff;
      raw[i] = x * (1 / 2147483648.0) - 1; // -1..1
    }
    _state = x;
    if (_wide) {
      for (var i = 0; i < width; i++) {
        row[i] = raw[i] + 4 * raw[i + 1] + 6 * raw[i + 2] + 4 * raw[i + 3] + raw[i + 4];
      }
    } else {
      for (var i = 0; i < width; i++) {
        row[i] = raw[i] + 2 * raw[i + 1] + raw[i + 2];
      }
    }
  }

  /// Advances one row; [out] then holds unit-variance grain for that row.
  Float32List nextRow() {
    final k = _ring.length;
    _fill(_ring[_next]);
    _next = (_next + 1) % k;
    final o = out, sc = _scale;
    if (_wide) {
      final a = _ring[_next], b = _ring[(_next + 1) % 5], c = _ring[(_next + 2) % 5], d = _ring[(_next + 3) % 5], e = _ring[(_next + 4) % 5];
      for (var x = 0; x < width; x++) {
        o[x] = (a[x] + 4 * b[x] + 6 * c[x] + 4 * d[x] + e[x]) * sc;
      }
    } else {
      final a = _ring[_next], b = _ring[(_next + 1) % 3], c = _ring[(_next + 2) % 3];
      for (var x = 0; x < width; x++) {
        o[x] = (a[x] + 2 * b[x] + c[x]) * sc;
      }
    }
    return o;
  }
}
