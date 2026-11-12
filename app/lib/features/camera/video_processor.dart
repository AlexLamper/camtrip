import 'dart:io';

import 'package:ffmpeg_kit_flutter_new_min/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_min/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'styles.dart';

/// Bakes a camera style into a recorded video and makes a thumbnail.
/// Falls back to the untouched recording if the device can't encode.
class VideoProcessor {
  static String _encoder() => Platform.isIOS ? 'h264_videotoolbox' : 'h264_mediacodec';

  static String _filter(CameraStyle s) {
    final m = s.matrix.m;
    String f(double v) => v.toStringAsFixed(3);
    // colorchannelmixer has no offsets; approximate the matrix offsets with eq brightness.
    final avgOffset = (m[4] + m[9] + m[14]) / 3 / 255;
    final parts = <String>[
      'colorchannelmixer=rr=${f(m[0])}:rg=${f(m[1])}:rb=${f(m[2])}:gr=${f(m[5])}:gg=${f(m[6])}:gb=${f(m[7])}:br=${f(m[10])}:bg=${f(m[11])}:bb=${f(m[12])}',
      'eq=brightness=${f(avgOffset)}',
      if (s.vignette > 0) 'vignette=angle=${(0.35 + s.vignette * 0.5).toStringAsFixed(2)}',
      if (s.grain > 0) 'noise=alls=${(s.grain * 22).round()}:allf=t',
      'format=yuv420p',
    ];
    return parts.join(',');
  }

  static Future<File> applyStyle(File input, CameraStyle style) async {
    final dir = await getTemporaryDirectory();
    final out = File('${dir.path}/styled_${DateTime.now().millisecondsSinceEpoch}.mp4');
    for (final codec in [_encoder(), 'mpeg4']) {
      final quality = codec == 'mpeg4' ? '-q:v 4' : '-b:v 8M';
      final cmd = '-y -i "${input.path}" -vf "${_filter(style)}" -c:v $codec $quality -c:a aac -b:a 128k -movflags +faststart "${out.path}"';
      final session = await FFmpegKit.execute(cmd);
      if (ReturnCode.isSuccess(await session.getReturnCode()) && await out.exists() && await out.length() > 0) return out;
      debugPrint('ffmpeg $codec failed: ${await session.getAllLogsAsString()}');
    }
    return input;
  }

  /// First frame as a JPEG.
  static Future<File?> thumbnail(File video, {int width = 720}) async {
    final dir = await getTemporaryDirectory();
    final out = File('${dir.path}/vthumb_${DateTime.now().microsecondsSinceEpoch}.jpg');
    final session = await FFmpegKit.execute('-y -ss 0.3 -i "${video.path}" -frames:v 1 -vf "scale=$width:-2" -q:v 4 "${out.path}"');
    if (ReturnCode.isSuccess(await session.getReturnCode()) && await out.exists()) return out;
    return null;
  }
}
