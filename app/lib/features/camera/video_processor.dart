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

  @visibleForTesting
  static String filterFor(CameraStyle s) => _filter(s);

  static String _filter(CameraStyle s) {
    // Curve-based looks (Flash 400) get their own chain: curves, hue-selective
    // saturation, vignette and luminance grain.
    final look = s.look;
    if (look != null) return '${look.ffmpegFilter(vignette: s.vignette)},format=yuv420p';
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

  /// ffmpeg options that keep location and other metadata out of an
  /// uploaded video: no global/stream/chapter metadata, only the first video
  /// and audio stream (iOS can add timed metadata tracks with the location),
  /// the QuickTime location keys explicitly empty, and the index up front.
  @visibleForTesting
  static const privacyArgs = '-map 0:v:0 -map 0:a:0? -dn -sn '
      '-map_metadata -1 -map_chapters -1 '
      '-metadata location= -metadata location-eng= -metadata com.apple.quicktime.location.ISO6709= '
      '-movflags +faststart';

  /// The ffmpeg command that bakes [style] into [input] with [codec].
  @visibleForTesting
  static String styleCommand(String input, String output, CameraStyle style, String codec) {
    final quality = codec == 'mpeg4' ? '-q:v 4' : '-b:v 8M';
    return '-y -i "$input" $privacyArgs -vf "${_filter(style)}" -c:v $codec $quality -c:a aac -b:a 128k "$output"';
  }

  /// The ffmpeg command that only drops metadata: a remux, no re-encode.
  @visibleForTesting
  static String stripCommand(String input, String output) => '-y -i "$input" $privacyArgs -c copy "$output"';

  /// Bakes [style] into the recording; every result is free of metadata.
  /// If the device cannot encode, the untouched picture is remuxed without
  /// metadata instead. Throws when not even that works, so a video with its
  /// location is never uploaded.
  static Future<File> applyStyle(File input, CameraStyle style) async {
    final dir = await getTemporaryDirectory();
    final out = File('${dir.path}/styled_${DateTime.now().millisecondsSinceEpoch}.mp4');
    for (final codec in [_encoder(), 'mpeg4']) {
      if (await _run(styleCommand(input.path, out.path, style, codec), out)) return out;
    }
    return stripMetadata(input);
  }

  /// Copies [input] without any metadata (location, device, dates in tags).
  /// Cheap: the streams are copied, not re-encoded. Use for every video that
  /// is uploaded without [applyStyle], e.g. from the camera roll.
  static Future<File> stripMetadata(File input) async {
    final dir = await getTemporaryDirectory();
    final out = File('${dir.path}/clean_${DateTime.now().microsecondsSinceEpoch}.mp4');
    if (await _run(stripCommand(input.path, out.path), out)) return out;
    throw const VideoMetadataException();
  }

  static Future<bool> _run(String cmd, File out) async {
    final session = await FFmpegKit.execute(cmd);
    if (ReturnCode.isSuccess(await session.getReturnCode()) && await out.exists() && await out.length() > 0) return true;
    debugPrint('ffmpeg failed ($cmd): ${await session.getAllLogsAsString()}');
    return false;
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

/// The video could not be cleaned of its metadata, so it is not uploaded.
class VideoMetadataException implements Exception {
  const VideoMetadataException();
  @override
  String toString() => 'VideoMetadataException: could not strip metadata';
}
