import 'dart:math' as math;

import '../../l10n/l10n.dart';
import 'film_look.dart';

export 'film_look.dart' show FilmLook;

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
    required this.matrix,
    this.pro = false,
    this.grain = 0.25,
    this.vignette = 0.35,
    this.leak = 0.0,
    this.frame = FrameKind.none,
    this.forceFlash = false,
    this.blur = 0.0,
    this.look,
  });

  final String id;

  /// Shown name in the app's language ("Wegwerp" / "Disposable").
  String get name => nameIn(L10n.current);

  /// One-line description in the app's language.
  String get description => descriptionIn(L10n.current);

  String nameIn(AppLocalizations l) => switch (id) {
        'film' => l.styleFilm,
        'instant' => l.styleInstant,
        'disposable' => l.styleDisposable,
        'bw' => l.styleBw,
        'golden' => l.styleGolden,
        'chrome' => l.styleChrome,
        'summer' => l.cameraPickerStyleSummer,
        'night' => l.cameraPickerStyleNight,
        'sepia' => l.cameraPickerStyleSepia,
        'lomo' => l.cameraPickerStyleLomo,
        'mint' => l.cameraPickerStyleMint,
        'pastel' => l.cameraPickerStylePastel,
        'super8' => l.cameraPickerStyleSuper8,
        'flash' => l.styleFlash,
        _ => id,
      };

  String descriptionIn(AppLocalizations l) => switch (id) {
        'film' => l.styleFilmDescription,
        'instant' => l.styleInstantDescription,
        'disposable' => l.styleDisposableDescription,
        'bw' => l.styleBwDescription,
        'golden' => l.styleGoldenDescription,
        'chrome' => l.styleChromeDescription,
        'summer' => l.cameraPickerStyleSummerDescription,
        'night' => l.cameraPickerStyleNightDescription,
        'sepia' => l.cameraPickerStyleSepiaDescription,
        'lomo' => l.cameraPickerStyleLomoDescription,
        'mint' => l.cameraPickerStyleMintDescription,
        'pastel' => l.cameraPickerStylePastelDescription,
        'super8' => l.cameraPickerStyleSuper8Description,
        'flash' => l.styleFlashDescription,
        _ => '',
      };
  /// Product shot of the camera that makes this look, for the camera picker.
  String get art => 'assets/images/cameras/$id.png';

  final ColorMatrix matrix;
  final bool pro;
  final double grain; // 0..1
  final double vignette; // 0..1
  final double leak; // 0..1 light leak strength
  final FrameKind frame;
  final bool forceFlash;
  final double blur; // slight softness, 0..1

  /// Curve/LUT based grade used instead of [matrix] for the final photo; the
  /// matrix is then only the live-preview approximation.
  final FilmLook? look;

  /// Default look: compact camera with direct flash on consumer 400 film.
  /// Strong amber cast, warm lifted blacks, cream highlights, punchy
  /// reds/oranges, muted greens/blues, fine grain. Fitted on reference prints
  /// (see README, "Tweaking the Flash look"). Free for everyone.
  static final flash = CameraStyle(
    id: 'flash',
    // live-preview approximation of the look (least-squares fit of the LUT at
    // indoor strength); the saved photo uses [look].
    matrix: const ColorMatrix([0.581, 0.456, -0.115, 0, 10.6, 0.106, 0.501, 0.094, 0, 4.5, 0.117, -0.148, 0.539, 0, 2.4, 0, 0, 0, 1, 0]),
    grain: 0.3,
    vignette: 0.3,
    look: const FilmLook(curves: [
      [17, 25, 34, 46, 60, 75, 91, 107, 123, 139, 153, 165, 177, 190, 203, 219, 240],
      [15, 22, 28, 36, 46, 57, 68, 80, 91, 100, 109, 118, 129, 142, 158, 192, 232],
      [10, 16, 21, 26, 33, 41, 47, 53, 59, 66, 72, 79, 87, 96, 111, 149, 190],
    ]),
  );

  /// Style for new users, and the fallback when a Pro style is not allowed.
  static CameraStyle get defaultStyle => flash;
  static const defaultId = 'flash';

  static final film = CameraStyle(
    id: 'film',
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
    pro: true,
    matrix: ColorMatrix.compose([ColorMatrix.saturation(0), ColorMatrix.contrast(1.25), ColorMatrix.fade(0.04)]),
    grain: 0.45,
    vignette: 0.45,
  );

  static final golden = CameraStyle(
    id: 'golden',
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
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.35),
      ColorMatrix.contrast(1.18),
      ColorMatrix.channels(r: 0.96, g: 1.02, b: 1.1, ro: -4, go: 0, bo: 6),
    ]),
    grain: 0.2,
    vignette: 0.35,
  );

  // ---- more looks (all Pro) ----

  /// Warm, faded 90s point-and-shoot: summer holiday prints.
  static final summer = CameraStyle(
    id: 'summer',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.1),
      ColorMatrix.contrast(0.94),
      ColorMatrix.channels(r: 1.08, g: 1.03, b: 0.88, ro: 14, go: 10, bo: 4),
      ColorMatrix.fade(0.12),
    ]),
    grain: 0.3,
    vignette: 0.3,
    leak: 0.22,
  );

  /// Tungsten cinema stock: teal shadows, warm highlights, lots of grain.
  static final night = CameraStyle(
    id: 'night',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(0.92),
      ColorMatrix.contrast(1.12),
      // red gain > 1 with a negative offset: shadows lose red (teal), highlights gain it (warm)
      ColorMatrix.channels(r: 1.2, g: 1.04, b: 0.9, ro: -22, go: 0, bo: 18),
      ColorMatrix.fade(0.05),
    ]),
    grain: 0.55,
    vignette: 0.5,
  );

  /// Old brown print from a shoebox.
  static final sepia = CameraStyle(
    id: 'sepia',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(0),
      ColorMatrix.contrast(1.08),
      ColorMatrix.channels(r: 1.07, g: 0.95, b: 0.76, ro: 20, go: 10, bo: 0),
      ColorMatrix.fade(0.14),
    ]),
    grain: 0.4,
    vignette: 0.55,
    blur: 0.1,
  );

  /// Toy camera, cross-processed: punchy colours, yellow-green cast, dark corners.
  static final lomo = CameraStyle(
    id: 'lomo',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.45),
      ColorMatrix.contrast(1.25),
      ColorMatrix.channels(r: 1.04, g: 1.08, b: 0.8, ro: 0, go: 4, bo: 22),
    ]),
    grain: 0.32,
    vignette: 0.85,
    leak: 0.15,
  );

  /// Soft green-tinted consumer film, gentle on skin.
  static final mint = CameraStyle(
    id: 'mint',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(0.88),
      ColorMatrix.contrast(0.96),
      ColorMatrix.channels(r: 0.95, g: 1.04, b: 0.98, ro: 2, go: 10, bo: 6),
      ColorMatrix.fade(0.1),
    ]),
    grain: 0.28,
    vignette: 0.3,
  );

  /// Pastel instant print with pink highlights.
  static final pastel = CameraStyle(
    id: 'pastel',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(0.78),
      ColorMatrix.contrast(0.86),
      ColorMatrix.channels(r: 1.04, g: 0.97, b: 1.0, ro: 18, go: 8, bo: 16),
      ColorMatrix.fade(0.12),
    ]),
    grain: 0.16,
    vignette: 0.2,
    frame: FrameKind.instant,
    blur: 0.18,
  );

  /// Home-movie cine film: warm, soft and grainy with heavy corners.
  static final super8 = CameraStyle(
    id: 'super8',
    pro: true,
    matrix: ColorMatrix.compose([
      ColorMatrix.saturation(1.05),
      ColorMatrix.contrast(1.1),
      ColorMatrix.channels(r: 1.1, g: 1.0, b: 0.82, ro: 10, go: 2, bo: -4),
      ColorMatrix.fade(0.1),
    ]),
    grain: 0.6,
    vignette: 0.8,
    leak: 0.3,
    blur: 0.3,
  );

  static final List<CameraStyle> all = [flash, film, instant, disposable, bw, golden, chrome, summer, night, sepia, lomo, mint, pastel, super8];

  static CameraStyle byId(String id) => all.firstWhere((s) => s.id == id, orElse: () => defaultStyle);
}

/// Vignette falloff for a normalised distance from the centre (0..~1.41).
double vignetteFactor(double dist, double strength) {
  final t = math.max(0.0, (dist - 0.45) / 0.95);
  return 1 - strength * t * t * 1.6;
}
