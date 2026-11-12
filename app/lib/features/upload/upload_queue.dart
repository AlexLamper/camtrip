import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../core/api.dart';
import '../../main.dart';
import '../auth/auth_controller.dart';

enum UploadStatus { waiting, uploading, failed }

class UploadItem {
  UploadItem({
    required this.id,
    required this.groupId,
    required this.kind,
    required this.style,
    required this.mime,
    required this.takenAt,
    required this.fromRoll,
    required this.width,
    required this.height,
    required this.durationMs,
    required this.originalPath,
    required this.displayPath,
    required this.thumbPath,
    this.status = UploadStatus.waiting,
    this.progress = 0,
    this.error,
    this.photoId,
    this.uploads,
  });

  final String id;
  final String groupId;
  final String kind;
  final String style;
  final String mime;
  final DateTime takenAt;
  final bool fromRoll;
  final int width;
  final int height;
  final int durationMs;
  final String originalPath;
  final String displayPath;
  final String thumbPath;
  UploadStatus status;
  double progress;
  String? error;
  String? photoId;
  Map<String, String>? uploads;

  bool get isVideo => kind == 'video';

  Map<String, dynamic> toJson() => {
        'id': id,
        'groupId': groupId,
        'kind': kind,
        'style': style,
        'mime': mime,
        'takenAt': takenAt.toIso8601String(),
        'fromRoll': fromRoll,
        'width': width,
        'height': height,
        'durationMs': durationMs,
        'originalPath': originalPath,
        'displayPath': displayPath,
        'thumbPath': thumbPath,
        'status': status == UploadStatus.failed ? 'failed' : 'waiting',
        'error': error,
        'photoId': photoId,
        'uploads': uploads,
      };

  factory UploadItem.fromJson(Map<String, dynamic> j) => UploadItem(
        id: j['id'] as String,
        groupId: j['groupId'] as String,
        kind: j['kind'] as String,
        style: j['style'] as String,
        mime: j['mime'] as String,
        takenAt: DateTime.parse(j['takenAt'] as String),
        fromRoll: j['fromRoll'] == true,
        width: (j['width'] as num).toInt(),
        height: (j['height'] as num).toInt(),
        durationMs: (j['durationMs'] as num).toInt(),
        originalPath: j['originalPath'] as String,
        displayPath: j['displayPath'] as String,
        thumbPath: j['thumbPath'] as String,
        status: j['status'] == 'failed' ? UploadStatus.failed : UploadStatus.waiting,
        error: j['error'] as String?,
        photoId: j['photoId'] as String?,
        uploads: (j['uploads'] as Map?)?.cast<String, String>(),
      );
}

/// Emits a group id whenever one of its uploads finished, so its gallery reloads.
final uploadedProvider = Provider((ref) => StreamController<String>.broadcast());

final uploadQueueProvider = NotifierProvider<UploadQueue, List<UploadItem>>(UploadQueue.new);

/// Durable upload queue. A photo is written to disk first, then shared when
/// there is a connection (and wifi, if the user asked for that). Survives app
/// restarts: the queue lives in a JSON file next to the media.
class UploadQueue extends Notifier<List<UploadItem>> {
  Directory? _dir;
  bool _running = false;
  bool _online = true;
  bool _onWifi = true;
  StreamSubscription<List<ConnectivityResult>>? _sub;

  @override
  List<UploadItem> build() {
    ref.onDispose(() => _sub?.cancel());
    unawaited(_load());
    return const [];
  }

  bool get online => _online;
  bool get onWifi => _onWifi;

  Future<Directory> _queueDir() async {
    if (_dir != null) return _dir!;
    final base = await getApplicationSupportDirectory();
    _dir = Directory('${base.path}/upload_queue')..createSync(recursive: true);
    return _dir!;
  }

  Future<void> _load() async {
    final dir = await _queueDir();
    final f = File('${dir.path}/queue.json');
    if (await f.exists()) {
      try {
        final list = (jsonDecode(await f.readAsString()) as List).map((e) => UploadItem.fromJson(e as Map<String, dynamic>));
        state = list.where((i) => File(i.originalPath).existsSync()).toList();
      } catch (_) {}
    }
    final conn = Connectivity();
    _applyConnectivity(await conn.checkConnectivity());
    _sub = conn.onConnectivityChanged.listen((r) {
      _applyConnectivity(r);
      unawaited(process());
    });
    unawaited(process());
  }

  void _applyConnectivity(List<ConnectivityResult> r) {
    _online = r.any((c) => c != ConnectivityResult.none);
    _onWifi = r.contains(ConnectivityResult.wifi) || r.contains(ConnectivityResult.ethernet);
    state = [...state]; // let the queue screen re-read online/wifi
  }

  Future<void> _save() async {
    final dir = await _queueDir();
    await File('${dir.path}/queue.json').writeAsString(jsonEncode(state.map((e) => e.toJson()).toList()));
  }

  /// Stores the media in the queue folder and starts uploading.
  Future<void> enqueue({
    required String groupId,
    required String kind,
    required String style,
    required String mime,
    required DateTime takenAt,
    required bool fromRoll,
    required int width,
    required int height,
    int durationMs = 0,
    required Uint8List original,
    required Uint8List display,
    required Uint8List thumb,
    String originalExt = 'jpg',
  }) async {
    final dir = await _queueDir();
    final id = const Uuid().v4();
    final o = File('${dir.path}/$id.original.$originalExt');
    final d = File('${dir.path}/$id.display.jpg');
    final t = File('${dir.path}/$id.thumb.jpg');
    await Future.wait([o.writeAsBytes(original), d.writeAsBytes(display), t.writeAsBytes(thumb)]);
    state = [
      ...state,
      UploadItem(
        id: id,
        groupId: groupId,
        kind: kind,
        style: style,
        mime: mime,
        takenAt: takenAt,
        fromRoll: fromRoll,
        width: width,
        height: height,
        durationMs: durationMs,
        originalPath: o.path,
        displayPath: d.path,
        thumbPath: t.path,
      ),
    ];
    await _save();
    unawaited(process());
  }

  Future<void> retry(String id) async {
    for (final i in state) {
      if (i.id == id) {
        i.status = UploadStatus.waiting;
        i.error = null;
      }
    }
    state = [...state];
    await _save();
    unawaited(process());
  }

  Future<void> retryAll() async {
    for (final i in state) {
      if (i.status == UploadStatus.uploading) continue;
      i.status = UploadStatus.waiting;
      i.error = null;
    }
    state = [...state];
    await _save();
    unawaited(process());
  }

  /// Empties the queue and its files (account deleted).
  Future<void> clear() async {
    for (final id in state.map((i) => i.id).toList()) {
      await remove(id);
    }
  }

  Future<void> remove(String id) async {
    final item = state.where((i) => i.id == id).firstOrNull;
    if (item == null) return;
    state = state.where((i) => i.id != id).toList();
    for (final p in [item.originalPath, item.displayPath, item.thumbPath]) {
      try {
        await File(p).delete();
      } catch (_) {}
    }
    await _save();
  }

  bool _allowed(UploadItem i) {
    if (!_online) return false;
    final prefs = ref.read(prefsProvider);
    if (prefs.wifiOnly && !_onWifi) return false;
    if (i.isVideo && prefs.videosWifiOnly && !_onWifi) return false;
    return true;
  }

  Future<void> process() async {
    if (_running) return;
    if (ref.read(authProvider).value == null) return;
    _running = true;
    try {
      // Each item is tried at most once per pass; an item that stays waiting
      // (no connection after all) ends the pass instead of looping forever.
      final tried = <String>{};
      while (true) {
        final next = state.where((i) => i.status == UploadStatus.waiting && _allowed(i) && !tried.contains(i.id)).firstOrNull;
        if (next == null) break;
        tried.add(next.id);
        final result = await _upload(next);
        if (result == _Result.offline || !_online) break;
        if (result == _Result.retry) tried.remove(next.id);
      }
    } finally {
      _running = false;
    }
  }

  void _touch(UploadItem i) => state = [...state];

  Future<_Result> _upload(UploadItem i) async {
    final api = ref.read(apiProvider);
    i.status = UploadStatus.uploading;
    i.progress = 0;
    _touch(i);
    try {
      if (i.photoId == null || i.uploads == null) {
        final res = await api.post('/groups/${i.groupId}/photos', {
          'kind': i.kind,
          'style': i.style,
          'mime': i.mime,
          'width': i.width,
          'height': i.height,
          'durationMs': i.durationMs,
          'takenAt': i.takenAt.toUtc().toIso8601String(),
          'fromRoll': i.fromRoll,
        });
        i.photoId = res['photoId'] as String;
        i.uploads = (res['uploads'] as Map).cast<String, String>();
        await _save();
      }
      final original = await File(i.originalPath).readAsBytes();
      final display = await File(i.displayPath).readAsBytes();
      final thumb = await File(i.thumbPath).readAsBytes();
      final total = original.length + display.length + thumb.length;
      var done = 0;

      Future<void> put(String key, Uint8List bytes, String type) async {
        try {
          await Api.putFile(i.uploads![key]!, bytes, type, onProgress: (sent, _) {
            i.progress = (done + sent) / total;
            _touch(i);
          });
        } on ApiException catch (e) {
          // Presigned URLs expire after 30 min; a queued photo may be older.
          if (!e.isOffline) throw _ExpiredUpload();
          rethrow;
        }
        done += bytes.length;
      }

      await put('thumb', thumb, 'image/jpeg');
      await put('display', display, 'image/jpeg');
      await put('original', original, i.mime);
      try {
        await api.post('/photos/${i.photoId}/complete');
      } on ApiException catch (e) {
        // The server did not find all three files: upload again with fresh URLs.
        if (e.code == 'upload_incomplete') throw _ExpiredUpload();
        rethrow;
      }
      await remove(i.id);
      ref.read(uploadedProvider).add(i.groupId);
      return _Result.done;
    } on _ExpiredUpload {
      // Ask for fresh upload URLs (a new reservation) on the next pass.
      i.uploads = null;
      i.photoId = null;
      i.status = i.error == 'retry' ? UploadStatus.failed : UploadStatus.waiting;
      i.error = i.status == UploadStatus.failed ? 'Upload mislukt' : 'retry';
      _touch(i);
      await _save();
      return i.status == UploadStatus.waiting ? _Result.retry : _Result.failed;
    } on ApiException catch (e) {
      final offline = e.isOffline;
      if (offline) {
        i.status = UploadStatus.waiting;
      } else {
        i.status = UploadStatus.failed;
        i.error = switch (e.code) {
          'pro_required' => 'Deze stijl hoort bij CamTrip Pro',
          'archived' => 'Deze groep is afgesloten',
          _ => e.message,
        };
      }
      _touch(i);
      await _save();
      return offline ? _Result.offline : _Result.failed;
    } catch (e) {
      i.status = UploadStatus.failed;
      i.error = 'Upload mislukt';
      _touch(i);
      await _save();
      return _Result.failed;
    }
  }
}

enum _Result { done, retry, failed, offline }

class _ExpiredUpload implements Exception {}
