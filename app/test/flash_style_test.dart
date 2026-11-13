import 'dart:io';
import 'dart:typed_data';

import 'package:camtrip/features/camera/processor.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/camera/video_processor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

/// A small "clean phone photo" made in code: grey ramp, skin, white, a
/// dark jacket, green plant and blue jeans: an indoor flash shot (bright
/// subject, darker room) with the slight warmth phones keep indoors.
Uint8List fixtureJpeg() {
  final im = img.Image(width: 320, height: 240);
  for (var y = 0; y < 240; y++) {
    for (var x = 0; x < 320; x++) {
      final v = (x / 319 * 150 + 8).round();
      img.Color c = img.ColorRgb8((v * 1.08).round().clamp(0, 255), v, (v * 0.88).round());
      if (y > 60 && y < 120 && x > 20 && x < 100) c = img.ColorRgb8(214, 168, 142); // skin
      if (y > 60 && y < 120 && x > 120 && x < 200) c = img.ColorRgb8(236, 234, 228); // white shirt
      if (y > 60 && y < 120 && x > 220 && x < 300) c = img.ColorRgb8(34, 33, 36); // dark jacket
      if (y > 150 && y < 210 && x > 20 && x < 100) c = img.ColorRgb8(70, 120, 60); // plant
      if (y > 150 && y < 210 && x > 120 && x < 200) c = img.ColorRgb8(70, 95, 140); // jeans
      if (y > 150 && y < 210 && x > 220 && x < 300) c = img.ColorRgb8(190, 40, 35); // red cup
      im.setPixel(x, y, c);
    }
  }
  return Uint8List.fromList(img.encodeJpg(im, quality: 95));
}

List<double> meanOf(img.Image im, {int x0 = 0, int y0 = 0, int? x1, int? y1}) {
  var r = 0.0, g = 0.0, b = 0.0, n = 0;
  for (var y = y0; y < (y1 ?? im.height); y++) {
    for (var x = x0; x < (x1 ?? im.width); x++) {
      final p = im.getPixel(x, y);
      r += p.r;
      g += p.g;
      b += p.b;
      n++;
    }
  }
  return [r / n, g / n, b / n];
}

void main() {
  group('Flash 400 style', () {
    test('exists, is free, is the default and the fallback', () {
      final s = CameraStyle.byId('flash');
      expect(s.id, 'flash');
      expect(s.pro, isFalse);
      expect(s.look, isNotNull);
      expect(CameraStyle.defaultStyle.id, 'flash');
      expect(CameraStyle.defaultId, 'flash');
      expect(CameraStyle.byId('does-not-exist').id, 'flash');
      expect(CameraStyle.all.first.id, 'flash');
      expect(CameraStyle.all.where((s) => s.id == 'flash'), hasLength(1));
    });

    test('LUT keeps a warm neutral axis: lifted warm blacks, cream whites', () {
      final look = CameraStyle.flash.look!;
      final black = look.grade(0, 0, 0, 1), mid = look.grade(0.5, 0.5, 0.5, 1), white = look.grade(1, 1, 1, 1);
      // blacks lifted and warm (R >= G >= B), around 10-20 / 255
      expect(black[0] * 255, inInclusiveRange(10, 24));
      expect(black[0] >= black[1] && black[1] >= black[2], isTrue);
      // mid grey turns amber: R/G ~1.4, B well below
      expect(mid[0] / mid[1], inInclusiveRange(1.25, 1.6));
      expect(mid[2] / mid[0], inInclusiveRange(0.35, 0.65));
      // white stays bright cream, never pure blue-white
      expect(white[0], greaterThan(0.92));
      expect(white[2], lessThan(0.92));
      // a weaker strength is closer to neutral
      final day = look.grade(0.5, 0.5, 0.5, look.amberMin);
      expect(day[0] / day[2], lessThan(mid[0] / mid[2]));
    });

    test('dark scenes get an exposure lift, bright ones not', () {
      final look = CameraStyle.flash.look!;
      expect(look.liftFor(0.5), 1);
      expect(look.liftFor(0.1), inInclusiveRange(look.liftMax, 0.99));
      expect(look.amberFor(0.25, 1.6), 1);
      expect(look.amberFor(0.6, 0.8), closeTo(look.amberMin, 1e-9));
    });

    test('processing a fixture lands in the warm amber range', () async {
      final out = await processPhoto(fixtureJpeg(), styleId: 'flash');
      final im = img.decodeJpg(out.original)!;
      expect(im.width, 320);
      final all = meanOf(im);
      // whole picture: amber (R > G > B, strong red/blue ratio like the references, 2.5-3.3)
      expect(all[0], greaterThan(all[1]));
      expect(all[1], greaterThan(all[2]));
      expect(all[0] / all[2], inInclusiveRange(2.2, 4.0));
      // white shirt: bright cream (refs: ~[220-240, 140-190, 70-100])
      final shirt = meanOf(im, x0: 130, x1: 190, y0: 70, y1: 110);
      expect(shirt[0], greaterThan(200));
      expect(shirt[1], inInclusiveRange(130, 215));
      expect(shirt[2], inInclusiveRange(55, 150));
      // dark jacket: lifted, warm blacks (refs: ~[20-35, 18-25, 15-18])
      final jacket = meanOf(im, x0: 230, x1: 290, y0: 70, y1: 110);
      expect(jacket[0], inInclusiveRange(12, 50));
      expect(jacket[0], greaterThanOrEqualTo(jacket[2]));
      // red cup stays a saturated red, the plant gets muted
      final cup = meanOf(im, x0: 230, x1: 290, y0: 160, y1: 200);
      expect(cup[0] - cup[1], greaterThan(90));
      final plant = meanOf(im, x0: 30, x1: 90, y0: 160, y1: 200);
      expect(plant[1] - plant[0], lessThan(30));
    });

    test('video uses the curves + hue saturation + grain chain', () {
      final f = VideoProcessor.filterFor(CameraStyle.flash);
      expect(f, contains('curves=r='));
      expect(f, contains('huesaturation='));
      expect(f, contains('noise=c0s='));
      expect(f, endsWith('format=yuv420p'));
    });
  });

  // Renders the inputs in /tmp/filter/in with the real processor, for the
  // comparison sheets in the README. Skipped when the folder does not exist.
  test('render comparison inputs', () async {
    final dir = Directory('/tmp/filter/in');
    if (!dir.existsSync()) return;
    Directory('/tmp/filter/dart_out').createSync(recursive: true);
    for (final f in dir.listSync().whereType<File>().where((f) => f.path.endsWith('.jpg'))) {
      final sw = Stopwatch()..start();
      final out = await processPhoto(f.readAsBytesSync(), styleId: 'flash');
      final name = f.uri.pathSegments.last;
      File('/tmp/filter/dart_out/$name').writeAsBytesSync(out.original);
      // ignore: avoid_print
      print('$name ${out.width}x${out.height} ${sw.elapsedMilliseconds} ms');
    }
    // ignore: avoid_print
    print(VideoProcessor.filterFor(CameraStyle.flash));
  }, tags: ['visual'], timeout: const Timeout(Duration(minutes: 5)));
}
