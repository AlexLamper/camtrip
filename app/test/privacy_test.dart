import 'dart:typed_data';

import 'package:camtrip/features/camera/processor.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/camera/video_processor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

/// A 40x20 JPEG with a GPS location, camera make and "rotate 90° CW" in EXIF,
/// like a photo straight from a phone's camera roll.
Uint8List phoneJpeg() {
  final image = img.Image(width: 40, height: 20);
  img.fill(image, color: img.ColorRgb8(200, 120, 40));
  image.exif.gpsIfd.setGpsLocation(latitude: 51.7486, longitude: 4.1713);
  image.exif.imageIfd.make = 'PhoneMaker';
  image.exif.imageIfd.orientation = 6;
  return Uint8List.fromList(img.encodeJpg(image));
}

bool hasExifSegment(Uint8List jpeg) {
  // APP1 marker (FF E1) followed by length and "Exif\0\0".
  for (var i = 0; i + 9 < jpeg.length; i++) {
    if (jpeg[i] == 0xFF && jpeg[i + 1] == 0xE1 && jpeg[i + 4] == 0x45 && jpeg[i + 5] == 0x78 && jpeg[i + 6] == 0x69 && jpeg[i + 7] == 0x66) {
      return true;
    }
  }
  return false;
}

void main() {
  test('the test input really carries GPS and orientation', () {
    final exif = img.decodeJpgExif(phoneJpeg())!;
    expect(exif.gpsIfd.hasGPSLatitude, isTrue);
    expect(exif.imageIfd.orientation, 6);
    expect(hasExifSegment(phoneJpeg()), isTrue);
  });

  for (final (label, style) in [('camera-roll path (no style)', false), ('camera path (style applied)', true)]) {
    test('$label: uploads carry no EXIF/GPS, orientation is baked into the pixels', () async {
      final out = await processPhoto(phoneJpeg(), styleId: style ? 'film' : 'none', applyStyle: style);
      for (final bytes in [out.original, out.display, out.thumb]) {
        expect(hasExifSegment(bytes), isFalse);
        final exif = img.decodeJpgExif(bytes);
        expect(exif == null || exif.isEmpty, isTrue);
        expect(exif?.gpsIfd.hasGPSLatitude ?? false, isFalse);
        expect(String.fromCharCodes(bytes).contains('PhoneMaker'), isFalse);
      }
      // 40x20 rotated by 90° = portrait.
      final decoded = img.decodeJpg(out.original)!;
      expect(decoded.width, 20);
      expect(decoded.height, 40);
      expect(out.width, 20);
      expect(out.height, 40);
    });
  }

  test('processRollPhoto-style input without EXIF still works', () async {
    final plain = Uint8List.fromList(img.encodeJpg(img.Image(width: 8, height: 8)));
    final out = await processPhoto(plain, styleId: 'none', applyStyle: false);
    expect(hasExifSegment(out.original), isFalse);
  });

  group('video metadata', () {
    test('every ffmpeg command drops metadata, chapters and the location keys', () {
      final cmds = [
        VideoProcessor.styleCommand('/in.mov', '/out.mp4', CameraStyle.byId('film'), 'h264_videotoolbox'),
        VideoProcessor.styleCommand('/in.mov', '/out.mp4', CameraStyle.byId('bw'), 'mpeg4'),
        VideoProcessor.stripCommand('/in.mov', '/out.mp4'),
      ];
      for (final cmd in cmds) {
        expect(cmd, contains('-map_metadata -1'));
        expect(cmd, contains('-map_chapters -1'));
        expect(cmd, contains('-metadata location= '));
        expect(cmd, contains('-metadata com.apple.quicktime.location.ISO6709= '));
        expect(cmd, contains('-movflags +faststart'));
        // Only the picture and sound: no timed metadata tracks.
        expect(cmd, contains('-map 0:v:0 -map 0:a:0?'));
        // Output options come after the input.
        expect(cmd.indexOf('-map_metadata'), greaterThan(cmd.indexOf('-i "/in.mov"')));
      }
      expect(VideoProcessor.stripCommand('/in.mov', '/out.mp4'), contains('-c copy'));
    });
  });
}
