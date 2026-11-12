import 'dart:math' as math;

/// 4x5 colour matrix in Flutter's ColorFilter.matrix layout (offsets in 0..255).
class ColorMatrix {
  const ColorMatrix(this.m);
  final List<double> m;

  static const identity = ColorMatrix([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);

  /// this ∘ other (apply `other` first, then this).
  ColorMatrix operator *(ColorMatrix other) {
    final a = m, b = other.m;
    final out = List<double>.filled(20, 0);
    for (var r = 0; r < 4; r++) {
      for (var c = 0; c < 5; c++) {
        var v = 0.0;
        for (var k = 0; k < 4; k++) {
          v += a[r * 5 + k] * b[k * 5 + c];
        }
        if (c == 4) v += a[r * 5 + 4];
        out[r * 5 + c] = v;
      }
    }
    return ColorMatrix(out);
  }

  static ColorMatrix saturation(double s) {
    const lr = 0.2126, lg = 0.7152, lb = 0.0722;
    final sr = (1 - s) * lr, sg = (1 - s) * lg, sb = (1 - s) * lb;
    return ColorMatrix([sr + s, sg, sb, 0, 0, sr, sg + s, sb, 0, 0, sr, sg, sb + s, 0, 0, 0, 0, 0, 1, 0]);
  }

  static ColorMatrix contrast(double c) {
    final t = 128 * (1 - c);
    return ColorMatrix([c, 0, 0, 0, t, 0, c, 0, 0, t, 0, 0, c, 0, t, 0, 0, 0, 1, 0]);
  }

  /// Per-channel gain and offset (warmth, fades, tints).
  static ColorMatrix channels({double r = 1, double g = 1, double b = 1, double ro = 0, double go = 0, double bo = 0}) =>
      ColorMatrix([r, 0, 0, 0, ro, 0, g, 0, 0, go, 0, 0, b, 0, bo, 0, 0, 0, 1, 0]);

  static ColorMatrix brightness(double offset) => channels(ro: offset, go: offset, bo: offset);

  /// Lifts the blacks and lowers the whites: the faded look of old prints.
  static ColorMatrix fade(double amount) {
    final k = 1 - amount;
    final o = 255 * amount * 0.5;
    return channels(r: k, g: k, b: k, ro: o, go: o, bo: o);
  }

  static ColorMatrix compose(List<ColorMatrix> steps) => steps.fold(identity, (acc, s) => s * acc);
}

enum FrameKind { none, instant }

class CameraStyle {
  const CameraStyle({
    required this.id,
    required this.name,
    required this.description,
    required this.matrix,
    this.pro = false,
    this.grain = 0.25,
    this.vignette = 0.35,
    this.leak = 0.0,
    this.frame = FrameKind.none,
    this.forceFlash = false,
    this.blur = 0.0,
  });

  final String id;
  final String name;
  final String description;
  final ColorMatrix matrix;
  final bool pro;
  final double grain; // 0..1
  final double vignette; // 0..1
  final double leak; // 0..1 light leak strength
  final FrameKind frame;
  final bool forceFlash;
  final double blur; // slight softness, 0..1

  static final film = CameraStyle(
    id: 'film',
    name: 'Film',
    description: 'Warme kleuren, korrel en een oranje datumstempel',
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.12),
      ColorMatrix.contrast(1.06),
      ColorMatrix.channels(r: 1.07, g: 1.0, b: 0.86, ro: 10, go: 4, bo: -2),
      ColorMatrix.fade(0.06),
    ]),
    grain: 0.32,
    vignette: 0.42,
    leak: 0.18,
  );

  static final instant = CameraStyle(
    id: 'instant',
    name: 'Instant',
    description: 'Zachte kleuren en een witte rand',
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(0.9),
      ColorMatrix.contrast(0.92),
      ColorMatrix.channels(r: 1.02, g: 1.0, b: 1.02, ro: 8, go: 6, bo: 10),
      ColorMatrix.fade(0.1),
    ]),
    grain: 0.18,
    vignette: 0.22,
    frame: FrameKind.instant,
    blur: 0.15,
  );

  static final disposable = CameraStyle(
    id: 'disposable',
    name: 'Wegwerp',
    description: 'Harde flits, vignet en lichtlekken',
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.28),
      ColorMatrix.contrast(1.16),
      ColorMatrix.channels(r: 1.04, g: 1.02, b: 0.94, ro: 4, go: 2, bo: 0),
    ]),
    grain: 0.42,
    vignette: 0.6,
    leak: 0.35,
    forceFlash: true,
  );

  static final bw = CameraStyle(
    id: 'bw',
    name: 'Z/W',
    description: 'Korrelig zwart-wit met diep contrast',
    pro: true,
    matrix: ColorMatrix.compose([ColorMatrix.saturation(0), ColorMatrix.contrast(1.25), ColorMatrix.fade(0.04)]),
    grain: 0.45,
    vignette: 0.45,
  );

  static final golden = CameraStyle(
    id: 'golden',
    name: 'Golden',
    description: 'Altijd golden hour, zachte gouden gloed',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.05),
      ColorMatrix.channels(r: 1.1, g: 1.03, b: 0.78, ro: 18, go: 8, bo: -6),
      ColorMatrix.fade(0.08),
    ]),
    grain: 0.22,
    vignette: 0.32,
    leak: 0.28,
  );

  static final chrome = CameraStyle(
    id: 'chrome',
    name: 'Chrome',
    description: 'Koel, verzadigd en scherp, als dia-film',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.35),
      ColorMatrix.contrast(1.18),
      ColorMatrix.channels(r: 0.96, g: 1.02, b: 1.1, ro: -4, go: 0, bo: 6),
    ]),
    grain: 0.2,
    vignette: 0.35,
  );

  static final List<CameraStyle> all = [film, instant, disposable, bw, golden, chrome];

  static CameraStyle byId(String id) => all.firstWhere((s) => s.id == id, orElse: () => instant);
}

/// Vignette falloff for a normalised distance from the centre (0..~1.41).
double vignetteFactor(double dist, double strength) {
  final t = math.max(0.0, (dist - 0.45) / 0.95);
  return 1 - strength * t * t * 1.6;
}
