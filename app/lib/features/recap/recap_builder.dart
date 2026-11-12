import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:ffmpeg_kit_flutter_new_min/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_min/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../models/models.dart';

enum RecapTemplate { goldenHour, snel, filmrol, polaroid }

extension RecapTemplateInfo on RecapTemplate {
  String get label => switch (this) {
        RecapTemplate.goldenHour => 'Golden Hour',
        RecapTemplate.snel => 'Snel',
        RecapTemplate.filmrol => 'Filmrol',
        RecapTemplate.polaroid => 'Polaroid',
      };

  /// Seconds per photo.
  double get secondsPerPhoto => switch (this) {
        RecapTemplate.snel => 0.8,
        RecapTemplate.goldenHour => 1.8,
        RecapTemplate.filmrol => 1.5,
        RecapTemplate.polaroid => 1.7,
      };
}

class RecapTrack {
  const RecapTrack(this.asset, this.title, this.mood);
  final String asset;
  final String title;
  final String mood;

  static const all = [
    RecapTrack('music/zomeravond.m4a', 'Zomeravond', 'lo-fi'),
    RecapTrack('music/golden_hour.m4a', 'Golden Hour', 'warm'),
    RecapTrack('music/roadtrip.m4a', 'Roadtrip', 'vrolijk'),
  ];
}

const recapW = 1080, recapH = 1920;
const maxRecapSeconds = 46.0;

/// Picks the photos for a recap: favourites and the most-loved first, spread
/// over the days, then put back in chronological order.
List<Photo> pickRecapPhotos(List<Photo> all, RecapTemplate t) {
  final photos = all.where((p) => !p.isVideo).toList();
  final maxCount = (maxRecapSeconds / t.secondsPerPhoto).floor() - 2; // title + end card
  if (photos.length <= maxCount) return [...photos]..sort((a, b) => a.takenAt.compareTo(b.takenAt));

  double score(Photo p) => p.favoriteCount * 3 + p.heartCount * 2 + (p.isFavorite ? 2 : 0);
  final byDay = <DateTime, List<Photo>>{};
  for (final p in photos) {
    final d = p.takenAt.toLocal();
    byDay.putIfAbsent(DateTime(d.year, d.month, d.day), () => []).add(p);
  }
  for (final l in byDay.values) {
    l.sort((a, b) => score(b).compareTo(score(a)));
  }
  // round-robin over days so every day of the trip shows up
  final picked = <Photo>[];
  var round = 0;
  while (picked.length < maxCount) {
    var added = false;
    for (final l in byDay.values) {
      if (round < l.length && picked.length < maxCount) {
        picked.add(l[round]);
        added = true;
      }
    }
    if (!added) break;
    round++;
  }
  picked.sort((a, b) => a.takenAt.compareTo(b.takenAt));
  return picked;
}

class RecapFrames {
  RecapFrames(this.paths, this.secondsPerFrame, this.template);
  final List<String> paths; // PNG frames, title first, end card last
  final double secondsPerFrame;
  final RecapTemplate template;

  double get duration => paths.length * secondsPerFrame;
}

class RecapBuilder {
  RecapBuilder(this.group);
  final Group group;
  final Map<String, ui.Image> _decoded = {};
  ui.Image? _logo;

  Future<Directory> _dir() async {
    final base = await getTemporaryDirectory();
    final d = Directory('${base.path}/recap_${group.id}');
    if (!d.existsSync()) d.createSync(recursive: true);
    return d;
  }

  Future<ui.Image> _image(Photo p) async {
    final cached = _decoded[p.id];
    if (cached != null) return cached;
    final dir = await _dir();
    final f = File('${dir.path}/src_${p.id}.jpg');
    if (!f.existsSync()) await Api.download(p.displayUrl, f.path);
    final codec = await ui.instantiateImageCodec(await f.readAsBytes(), targetWidth: 1080);
    final img = (await codec.getNextFrame()).image;
    _decoded[p.id] = img;
    return img;
  }

  Future<ui.Image> _logoImage() async {
    if (_logo != null) return _logo!;
    final data = await rootBundle.load('assets/images/logo_icon.png');
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    return _logo = (await codec.getNextFrame()).image;
  }

  /// Renders all frames for a template. [onProgress] gets 0..1.
  Future<RecapFrames> render(List<Photo> photos, RecapTemplate t, {required bool watermark, void Function(double)? onProgress}) async {
    final dir = await _dir();
    for (final f in dir.listSync().whereType<File>().where((f) => f.path.contains('frame_'))) {
      f.deleteSync();
    }
    final paths = <String>[];
    var n = 0;
    Future<void> save(ui.Picture pic) async {
      final img = await pic.toImage(recapW, recapH);
      final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
      final path = '${dir.path}/frame_${(n++).toString().padLeft(3, '0')}.png';
      await File(path).writeAsBytes(bytes!.buffer.asUint8List());
      paths.add(path);
    }

    await save(_titleCard(t, photos.isEmpty ? null : await _image(photos.first)));
    for (var i = 0; i < photos.length; i++) {
      final img = await _image(photos[i]);
      await save(_photoFrame(t, img, photos[i], i, watermark));
      onProgress?.call((i + 1) / (photos.length + 2));
    }
    await save(_endCard(t, await _logoImage()));
    onProgress?.call(1);
    return RecapFrames(paths, t.secondsPerPhoto, t);
  }

  // ---------------------------------------------------------------- drawing

  static const _cream = Color(0xFFF3ECE0);
  static const _ink = Color(0xFF1D1D1B);
  static const _accent = Color(0xFFD9472B);

  void _text(Canvas c, String s, Offset at, double size, Color color,
      {FontWeight w = FontWeight.w700, String family = 'InterDisplay', TextAlign align = TextAlign.left, double maxWidth = 960, List<Shadow>? shadows}) {
    final tp = TextPainter(
      text: TextSpan(text: s, style: TextStyle(fontFamily: family, fontSize: size, fontWeight: w, color: color, letterSpacing: -size * 0.02, height: 1.05, shadows: shadows)),
      textDirection: TextDirection.ltr,
      textAlign: align,
      maxLines: 3,
      ellipsis: '…',
    )..layout(maxWidth: maxWidth);
    final dx = switch (align) { TextAlign.center => at.dx - tp.width / 2, TextAlign.right => at.dx - tp.width, _ => at.dx };
    tp.paint(c, Offset(dx, at.dy));
  }

  void _cover(Canvas c, ui.Image img, Rect dst, {ColorFilter? filter}) {
    final src = _coverSrc(img, dst.width / dst.height);
    c.drawImageRect(img, src, dst, Paint()..filterQuality = FilterQuality.high..colorFilter = filter);
  }

  Rect _coverSrc(ui.Image img, double ratio) {
    final w = img.width.toDouble(), h = img.height.toDouble();
    if (w / h > ratio) {
      final nw = h * ratio;
      return Rect.fromLTWH((w - nw) / 2, 0, nw, h);
    }
    final nh = w / ratio;
    return Rect.fromLTWH(0, (h - nh) / 2, w, nh);
  }

  static const _warm = ColorFilter.matrix([1.08, 0, 0, 0, 14, 0, 1.02, 0, 0, 6, 0, 0, 0.85, 0, -4, 0, 0, 0, 1, 0]);

  ui.Picture _titleCard(RecapTemplate t, ui.Image? cover) {
    final rec = ui.PictureRecorder();
    final c = Canvas(rec);
    final full = Rect.fromLTWH(0, 0, recapW.toDouble(), recapH.toDouble());
    final subtitle = [
      if (group.startDate != null) Fmt.range(group.startDate, group.endDate),
      '${group.members.length} vrienden',
    ].join(' · ');
    if (t == RecapTemplate.polaroid || cover == null) {
      c.drawRect(full, Paint()..color = _cream);
      _text(c, group.name, const Offset(540, 820), 120, _ink, align: TextAlign.center);
      _text(c, subtitle, const Offset(540, 1000), 44, _ink.withValues(alpha: 0.6), w: FontWeight.w500, family: 'Inter', align: TextAlign.center);
    } else {
      _cover(c, cover, full, filter: t == RecapTemplate.goldenHour ? _warm : null);
      c.drawRect(full, Paint()..shader = ui.Gradient.linear(const Offset(0, 900), Offset(0, recapH.toDouble()), [Colors.transparent, Colors.black.withValues(alpha: 0.65)]));
      const shadow = [Shadow(color: Colors.black54, blurRadius: 20)];
      _text(c, group.name, const Offset(80, 1440), 130, Colors.white, shadows: shadow);
      _text(c, subtitle, const Offset(84, 1640), 46, Colors.white.withValues(alpha: 0.9), w: FontWeight.w500, family: 'Inter', shadows: shadow);
    }
    return rec.endRecording();
  }

  ui.Picture _photoFrame(RecapTemplate t, ui.Image img, Photo p, int i, bool watermark) {
    final rec = ui.PictureRecorder();
    final c = Canvas(rec);
    final full = Rect.fromLTWH(0, 0, recapW.toDouble(), recapH.toDouble());
    switch (t) {
      case RecapTemplate.goldenHour:
      case RecapTemplate.snel:
        _cover(c, img, full, filter: t == RecapTemplate.goldenHour ? _warm : null);
        if (t == RecapTemplate.goldenHour) {
          c.drawRect(full, Paint()..shader = ui.Gradient.radial(const Offset(540, 960), 1100, [Colors.transparent, Colors.black.withValues(alpha: 0.45)], [0.55, 1]));
          _text(c, Fmt.stamp(p.takenAt), const Offset(1000, 1740), 54, const Color(0xFFFF8A2A),
              family: 'Inter', align: TextAlign.right, shadows: const [Shadow(color: Color(0xFFFF781E), blurRadius: 14)]);
        }
      case RecapTemplate.filmrol:
        c.drawRect(full, Paint()..color = const Color(0xFF151413));
        // sprocket holes
        final hole = Paint()..color = const Color(0xFFE9E2D3);
        for (var y = 40.0; y < recapH; y += 90) {
          c.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(26, y, 44, 56), const Radius.circular(8)), hole);
          c.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(recapW - 70, y, 44, 56), const Radius.circular(8)), hole);
        }
        final frame = Rect.fromLTWH(110, 300, recapW - 220, 1320);
        _cover(c, img, frame);
        _text(c, 'CAMTRIP 400', const Offset(110, 220), 34, const Color(0xFFE9A23B), family: 'Inter', w: FontWeight.w600);
        _text(c, '${i + 1}A', const Offset(970, 220), 34, const Color(0xFFE9A23B), family: 'Inter', w: FontWeight.w600, align: TextAlign.right);
        _text(c, Fmt.day(p.takenAt), const Offset(110, 1660), 44, Colors.white.withValues(alpha: 0.85), family: 'Inter', w: FontWeight.w500);
      case RecapTemplate.polaroid:
        c.drawRect(full, Paint()..color = _cream);
        final angle = ((i % 5) - 2) * 0.035;
        c.save();
        c.translate(540, 900);
        c.rotate(angle);
        const pw = 860.0, ph = 1040.0;
        final printRect = Rect.fromCenter(center: Offset.zero, width: pw, height: ph);
        c.drawRRect(RRect.fromRectAndRadius(printRect.shift(const Offset(0, 16)), const Radius.circular(8)), Paint()..color = Colors.black.withValues(alpha: 0.12)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 24));
        c.drawRRect(RRect.fromRectAndRadius(printRect, const Radius.circular(6)), Paint()..color = Colors.white);
        _cover(c, img, Rect.fromLTWH(-pw / 2 + 40, -ph / 2 + 40, pw - 80, pw - 80));
        _text(c, Fmt.day(p.takenAt).toLowerCase(), Offset(-pw / 2 + 50, ph / 2 - 120), 44, const Color(0xFF555550), family: 'Inter', w: FontWeight.w500);
        c.restore();
    }
    if (watermark) {
      _text(c, 'Gemaakt met CamTrip', const Offset(540, 1830), 34, Colors.white.withValues(alpha: 0.85),
          family: 'Inter', w: FontWeight.w600, align: TextAlign.center, shadows: const [Shadow(color: Colors.black45, blurRadius: 10)]);
    }
    return rec.endRecording();
  }

  ui.Picture _endCard(RecapTemplate t, ui.Image logo) {
    final rec = ui.PictureRecorder();
    final c = Canvas(rec);
    c.drawRect(Rect.fromLTWH(0, 0, recapW.toDouble(), recapH.toDouble()), Paint()..color = _cream);
    final logoRect = Rect.fromCenter(center: const Offset(540, 820), width: 220, height: 220);
    c.save();
    c.clipRRect(RRect.fromRectAndRadius(logoRect, const Radius.circular(50)));
    c.drawImageRect(logo, Rect.fromLTWH(0, 0, logo.width.toDouble(), logo.height.toDouble()), logoRect, Paint()..filterQuality = FilterQuality.high);
    c.restore();
    final tp = TextPainter(
      text: const TextSpan(children: [
        TextSpan(text: 'Cam', style: TextStyle(color: _ink)),
        TextSpan(text: 'Trip', style: TextStyle(color: _accent)),
      ], style: TextStyle(fontFamily: 'InterDisplay', fontSize: 110, fontWeight: FontWeight.w700, letterSpacing: -3)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, Offset(540 - tp.width / 2, 980));
    _text(c, 'Eén rolletje voor de hele groep', const Offset(540, 1140), 40, _ink.withValues(alpha: 0.6), family: 'Inter', w: FontWeight.w500, align: TextAlign.center);
    _text(c, 'camtrip.app', const Offset(540, 1220), 40, _accent, family: 'Inter', w: FontWeight.w600, align: TextAlign.center);
    return rec.endRecording();
  }

  // ---------------------------------------------------------------- export

  /// Encodes the frames + music into an MP4 (1080x1920). Returns the file.
  Future<File> export(RecapFrames frames, RecapTrack track, {void Function(double)? onProgress}) async {
    final dir = await _dir();
    final audio = File('${dir.path}/audio.m4a');
    final data = await rootBundle.load('assets/${track.asset}');
    await audio.writeAsBytes(data.buffer.asUint8List());

    // concat list with a duration per frame (last frame repeated, ffmpeg quirk)
    final list = StringBuffer();
    for (final p in frames.paths) {
      list.writeln("file '$p'");
      list.writeln('duration ${frames.secondsPerFrame.toStringAsFixed(2)}');
    }
    list.writeln("file '${frames.paths.last}'");
    final listFile = File('${dir.path}/frames.txt')..writeAsStringSync(list.toString());

    final out = File('${dir.path}/CamTrip_${group.name.replaceAll(RegExp(r'[^A-Za-z0-9]'), '_')}.mp4');
    if (out.existsSync()) out.deleteSync();
    final total = frames.duration;
    final fadeStart = math.max(0, total - 2.0);

    for (final codec in [Platform.isIOS ? 'h264_videotoolbox' : 'h264_mediacodec', 'mpeg4']) {
      final quality = codec == 'mpeg4' ? '-q:v 3' : '-b:v 10M';
      final cmd = '-y -f concat -safe 0 -i "${listFile.path}" -i "${audio.path}" '
          '-vf "fps=30,scale=1080:1920,format=yuv420p" -c:v $codec $quality '
          '-af "afade=t=out:st=${fadeStart.toStringAsFixed(2)}:d=2" -c:a aac -b:a 160k '
          '-t ${total.toStringAsFixed(2)} -shortest -movflags +faststart "${out.path}"';
      final session = await FFmpegKit.executeAsync(cmd, null, null, (stats) {
        onProgress?.call((stats.getTime() / 1000 / total).clamp(0, 1).toDouble());
      });
      // executeAsync returns immediately; wait for completion
      while ((await session.getReturnCode()) == null) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      }
      if (ReturnCode.isSuccess(await session.getReturnCode()) && out.existsSync() && out.lengthSync() > 0) return out;
    }
    throw Exception('Video maken lukte niet op dit toestel');
  }
}
