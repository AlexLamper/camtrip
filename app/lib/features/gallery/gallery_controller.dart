import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/api.dart';
import '../../main.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../groups/groups_controller.dart';
import '../upload/upload_queue.dart';

/// all / favorites / one person
class GalleryFilter {
  const GalleryFilter.all() : favorites = false, userId = null;
  const GalleryFilter.favorites() : favorites = true, userId = null;
  const GalleryFilter.person(String this.userId) : favorites = false;
  final bool favorites;
  final String? userId;

  Map<String, dynamic> query() => {if (favorites) 'favorites': '1', 'userId': ?userId};

  @override
  bool operator ==(Object other) => other is GalleryFilter && other.favorites == favorites && other.userId == userId;
  @override
  int get hashCode => Object.hash(favorites, userId);
}

class GalleryState {
  const GalleryState({this.photos = const [], this.loading = false, this.hasMore = true, this.filter = const GalleryFilter.all(), this.error});
  final List<Photo> photos;
  final bool loading;
  final bool hasMore;
  final GalleryFilter filter;
  final String? error;

  GalleryState copyWith({List<Photo>? photos, bool? loading, bool? hasMore, GalleryFilter? filter, String? error, bool clearError = false}) =>
      GalleryState(
        photos: photos ?? this.photos,
        loading: loading ?? this.loading,
        hasMore: hasMore ?? this.hasMore,
        filter: filter ?? this.filter,
        error: clearError ? null : (error ?? this.error),
      );

  /// Photos grouped per calendar day, newest day first.
  List<(DateTime, List<Photo>)> get byDay {
    final map = <DateTime, List<Photo>>{};
    for (final p in photos) {
      final l = p.takenAt.toLocal();
      map.putIfAbsent(DateTime(l.year, l.month, l.day), () => []).add(p);
    }
    final keys = map.keys.toList()..sort((a, b) => b.compareTo(a));
    return [for (final k in keys) (k, map[k]!)];
  }
}

final galleryProvider = NotifierProvider.family<GalleryController, GalleryState, String>(GalleryController.new);

class GalleryController extends Notifier<GalleryState> {
  GalleryController(this.groupId);
  final String groupId;

  Map<String, dynamic>? _cursor;
  int _generation = 0;
  StreamSubscription<String>? _sub;

  Api get _api => ref.read(apiProvider);

  @override
  GalleryState build() {
    _sub = ref.read(uploadedProvider).stream.where((g) => g == groupId).listen((_) => refresh());
    ref.onDispose(() => _sub?.cancel());
    Future.microtask(refresh);
    return const GalleryState(loading: true);
  }

  Future<void> setFilter(GalleryFilter f) async {
    if (f == state.filter) return;
    state = GalleryState(filter: f, loading: true);
    await refresh();
  }

  Future<void> refresh() async {
    _cursor = null;
    final gen = ++_generation;
    state = state.copyWith(loading: true, clearError: true);
    try {
      final res = await _api.get('/groups/$groupId/photos', query: state.filter.query());
      if (gen != _generation) return;
      final photos = _parse(res);
      state = state.copyWith(photos: photos, loading: false, hasMore: _cursor != null);
      unawaited(_autoSaveOthers(photos));
    } on ApiException catch (e) {
      if (gen != _generation) return;
      state = state.copyWith(loading: false, error: e.message);
    }
  }

  Future<void> loadMore() async {
    if (state.loading || !state.hasMore || _cursor == null) return;
    final gen = _generation;
    state = state.copyWith(loading: true);
    try {
      final res = await _api.get('/groups/$groupId/photos', query: {...state.filter.query(), ..._cursor!});
      if (gen != _generation) return;
      final more = _parse(res);
      state = state.copyWith(photos: [...state.photos, ...more], loading: false, hasMore: _cursor != null);
    } on ApiException catch (e) {
      state = state.copyWith(loading: false, error: e.message);
    }
  }

  List<Photo> _parse(Map<String, dynamic> res) {
    final next = res['nextCursor'] as Map<String, dynamic>?;
    _cursor = next == null ? null : {'before': next['before'], 'beforeId': next['beforeId']};
    return ((res['photos'] as List?) ?? const []).map((p) => Photo.fromJson(p as Map<String, dynamic>)).toList();
  }

  void _replace(Photo p) {
    state = state.copyWith(photos: [for (final x in state.photos) x.id == p.id ? p : x]);
  }

  Future<void> react(Photo photo, String emoji) async {
    final res = await _api.post('/photos/${photo.id}/react', {'emoji': emoji});
    _replace(Photo.fromJson(res['photo'] as Map<String, dynamic>));
  }

  Future<void> toggleFavorite(Photo photo) async {
    final res = await _api.post('/photos/${photo.id}/favorite');
    final p = Photo.fromJson(res['photo'] as Map<String, dynamic>);
    if (state.filter.favorites && !p.isFavorite) {
      state = state.copyWith(photos: state.photos.where((x) => x.id != p.id).toList());
    } else {
      _replace(p);
    }
  }

  Future<void> delete(Photo photo) async {
    await _api.delete('/photos/${photo.id}');
    state = state.copyWith(photos: state.photos.where((x) => x.id != photo.id).toList());
  }

  /// "Foto's van anderen automatisch opslaan": saves new photos of others once.
  Future<void> _autoSaveOthers(List<Photo> photos) async {
    final prefs = ref.read(prefsProvider);
    if (!prefs.autoSaveOthers) return;
    final me = ref.read(authProvider).value?.id;
    final done = prefs.autoSaved;
    final todo = photos.where((p) => p.userId != me && !done.contains(p.id)).toList();
    if (todo.isEmpty) return;
    final group = ref.read(groupProvider(groupId));
    if (group == null) return;
    try {
      await Downloader.save(_api, group, todo.map((p) => p.id).toList());
      prefs.markAutoSaved(todo.map((p) => p.id));
    } catch (_) {}
  }
}

class DownloadProgress {
  DownloadProgress(this.done, this.total);
  final int done;
  final int total;
}

class Downloader {
  /// Saves photos/videos of a group into the phone's album "CamTrip - groepsnaam".
  /// [ids] empty = everything. Pro gets originals (decided server-side).
  static Future<int> save(Api api, Group group, List<String> ids, {void Function(DownloadProgress)? onProgress}) async {
    final res = await api.get('/groups/${group.id}/download', query: ids.isEmpty ? null : {'ids': ids.join(',')});
    final items = (res['items'] as List).cast<Map<String, dynamic>>();
    if (!await Gal.hasAccess(toAlbum: true)) await Gal.requestAccess(toAlbum: true);
    final tmp = await getTemporaryDirectory();
    var done = 0;
    for (final item in items) {
      final path = '${tmp.path}/dl_${item['id']}.${item['ext']}';
      await Api.download(item['url'] as String, path);
      if (item['kind'] == 'video') {
        await Gal.putVideo(path, album: 'CamTrip - ${group.name}');
      } else {
        await Gal.putImage(path, album: 'CamTrip - ${group.name}');
      }
      try {
        await File(path).delete();
      } catch (_) {}
      done++;
      onProgress?.call(DownloadProgress(done, items.length));
    }
    return done;
  }
}
