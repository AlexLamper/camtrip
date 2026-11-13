import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/api.dart';
import '../../l10n/l10n.dart';
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

/// "Verborgen foto's": only the photos this user hid in a group.
final hiddenPhotosProvider = NotifierProvider.family<HiddenPhotosController, GalleryState, String>(HiddenPhotosController.new);

/// What a batch delete did: some photos may be skipped (not yours and you are
/// not an admin, or already removed by someone else).
class DeleteResult {
  const DeleteResult(this.deleted, this.forbidden);
  final int deleted;
  final int forbidden;
}

/// Newest first, same order as the server (takenAt desc, then id desc).
int comparePhotos(Photo a, Photo b) {
  final t = b.takenAt.compareTo(a.takenAt);
  return t != 0 ? t : b.id.compareTo(a.id);
}

/// Puts [back] into [current] again (no duplicates, server order kept).
/// Used to roll back optimistic removals and for "Ongedaan maken".
List<Photo> mergePhotos(List<Photo> current, Iterable<Photo> back) {
  final ids = current.map((p) => p.id).toSet();
  return [...current, ...back.where((p) => !ids.contains(p.id))]..sort(comparePhotos);
}

class GalleryController extends Notifier<GalleryState> {
  GalleryController(this.groupId);
  final String groupId;

  Map<String, dynamic>? _cursor;
  int _generation = 0;
  StreamSubscription<String>? _sub;

  Api get _api => ref.read(apiProvider);

  /// Extra query for every page; the hidden-photos view adds hidden=1.
  Map<String, dynamic> get baseQuery => const {};

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
      final res = await _api.get('/groups/$groupId/photos', query: {...baseQuery, ...state.filter.query()});
      if (gen != _generation) return;
      final photos = _parse(res);
      state = state.copyWith(photos: photos, loading: false, hasMore: _cursor != null);
      if (baseQuery.isEmpty) unawaited(_autoSaveOthers(photos));
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
      final res = await _api.get('/groups/$groupId/photos', query: {...baseQuery, ...state.filter.query(), ..._cursor!});
      if (gen != _generation) return;
      final more = _parse(res);
      state = state.copyWith(photos: [...state.photos, ...more], loading: false, hasMore: _cursor != null);
    } on ApiException catch (e) {
      if (gen != _generation) return;
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

  /// "Foto rapporteren": the server hides it for this user from now on.
  Future<void> report(Photo photo, ReportReason reason) async {
    await _api.post('/photos/${photo.id}/report', {'reason': reason.name});
    state = state.copyWith(photos: state.photos.where((x) => x.id != photo.id).toList());
  }

  Future<DeleteResult> delete(Photo photo) => deletePhotos([photo.id]);

  /// Removes the photos for the whole group. Optimistic: they leave the grid
  /// at once and come back if the server fails. Photos the server skipped
  /// because you may not delete them come back too; ones already gone stay gone.
  /// The phone's own album ("CamTrip - groep") is never touched.
  Future<DeleteResult> deletePhotos(List<String> ids) async {
    if (ids.isEmpty) return const DeleteResult(0, 0);
    final removed = _removeLocal(ids.toSet());
    try {
      final res = await _api.post('/groups/$groupId/photos/batch-delete', {'photoIds': ids});
      final skipped = ((res['skipped'] as List?) ?? const []).cast<Map<String, dynamic>>();
      final forbidden = skipped.where((s) => s['reason'] == 'forbidden').map((s) => s['id'] as String).toSet();
      if (forbidden.isNotEmpty) _restore(removed.where((p) => forbidden.contains(p.id)));
      _applyGroup(res['group']);
      return DeleteResult(((res['deleted'] as List?) ?? const []).length, forbidden.length);
    } catch (_) {
      _restore(removed);
      rethrow;
    }
  }

  /// "Verplaats naar album": moves my own photos from my personal roll into
  /// the album [target] (the server checks it: own photos, a group I am in,
  /// and that group's Pro rules for Pro camera styles). Optimistic: they
  /// leave the roll at once and come back if the server says no. Returns how
  /// many were moved.
  Future<int> moveTo(List<String> ids, Group target) async {
    if (ids.isEmpty) return 0;
    final removed = _removeLocal(ids.toSet());
    try {
      final res = await _api.post('/photos/move', {'photoIds': ids, 'groupId': target.serverId});
      _applyGroup(res['group']);
      // The roll's counts and cover changed too; the album and "Alle foto's" reload.
      unawaited(ref.read(personalRollProvider.notifier).reload().then((_) {}, onError: (_) {}));
      ref.read(uploadedProvider).add(target.id);
      return (res['moved'] as num?)?.toInt() ?? removed.length;
    } catch (_) {
      _restore(removed);
      rethrow;
    }
  }

  /// "Verbergen voor mij": gone from this user's gallery only. Optimistic.
  /// Returns the hidden photos, so a SnackBar can offer "Ongedaan maken".
  Future<List<Photo>> hide(List<String> ids) async {
    if (ids.isEmpty) return const [];
    final removed = _removeLocal(ids.toSet());
    _bumpHidden(removed.length);
    try {
      final res = await _api.post('/groups/$groupId/photos/hide', {'photoIds': ids, 'hidden': true});
      _applyGroup(res['group']);
      return removed;
    } catch (_) {
      _restore(removed);
      _bumpHidden(-removed.length);
      rethrow;
    }
  }

  /// Shows hidden photos again (undo, or from "Verborgen foto's").
  Future<void> unhide(List<Photo> photos) async {
    if (photos.isEmpty) return;
    final ids = photos.map((p) => p.id).toList();
    final wasHere = state.photos.where((p) => ids.contains(p.id)).toList();
    _onUnhide(photos);
    _bumpHidden(-photos.length);
    try {
      final res = await _api.post('/groups/$groupId/photos/hide', {'photoIds': ids, 'hidden': false});
      _applyGroup(res['group']);
    } catch (_) {
      _onUnhideFailed(photos, wasHere);
      _bumpHidden(photos.length);
      rethrow;
    }
  }

  /// In the gallery an unhidden photo comes back into the grid.
  void _onUnhide(List<Photo> photos) {
    if (!state.filter.favorites && state.filter.userId == null) {
      state = state.copyWith(photos: mergePhotos(state.photos, photos));
    } else {
      state = state.copyWith(photos: mergePhotos(state.photos, photos.where(_matchesFilter)));
    }
  }

  void _onUnhideFailed(List<Photo> photos, List<Photo> wasHere) {
    final keep = wasHere.map((p) => p.id).toSet();
    state = state.copyWith(photos: state.photos.where((p) => keep.contains(p.id) || !photos.any((x) => x.id == p.id)).toList());
  }

  bool _matchesFilter(Photo p) =>
      (!state.filter.favorites || p.isFavorite) && (state.filter.userId == null || state.filter.userId == p.userId);

  /// Favorite (or not) for several photos at once. Optimistic.
  Future<void> setFavorite(List<String> ids, bool favorite) async {
    if (ids.isEmpty) return;
    final set = ids.toSet();
    final before = state.photos.where((p) => set.contains(p.id)).toList();
    final changed = [
      for (final p in before)
        if (p.isFavorite != favorite) p.copyWith(isFavorite: favorite, favoriteCount: (p.favoriteCount + (favorite ? 1 : -1)).clamp(0, 1 << 30)),
    ];
    _applyFavorites(changed);
    try {
      await _api.post('/groups/$groupId/photos/batch-favorite', {'photoIds': ids, 'favorite': favorite});
    } catch (_) {
      _applyFavorites(before);
      rethrow;
    }
  }

  void _applyFavorites(List<Photo> photos) {
    if (photos.isEmpty) return;
    final byId = {for (final p in photos) p.id: p};
    if (state.filter.favorites) {
      // In "Favorieten" an unfavorited photo leaves the grid; a re-favorited one returns.
      final kept = [for (final p in state.photos) if (!(byId.containsKey(p.id) && !byId[p.id]!.isFavorite)) byId[p.id] ?? p];
      state = state.copyWith(photos: mergePhotos(kept, photos.where((p) => p.isFavorite)));
    } else {
      state = state.copyWith(photos: [for (final p in state.photos) byId[p.id] ?? p]);
    }
  }

  List<Photo> _removeLocal(Set<String> ids) {
    final removed = state.photos.where((p) => ids.contains(p.id)).toList();
    state = state.copyWith(photos: state.photos.where((p) => !ids.contains(p.id)).toList());
    return removed;
  }

  void _restore(Iterable<Photo> photos) {
    state = state.copyWith(photos: mergePhotos(state.photos, photos));
  }

  void _applyGroup(Object? json) {
    if (json is! Map<String, dynamic>) return;
    try {
      ref.read(groupsProvider.notifier).applyServerGroup(Group.fromJson(json));
    } catch (_) {}
  }

  void _bumpHidden(int by) {
    final g = ref.read(groupProvider(groupId));
    if (g == null) return;
    try {
      ref.read(groupsProvider.notifier).applyServerGroup(g.copyWith(hiddenCount: (g.hiddenCount + by).clamp(0, 1 << 30)));
    } catch (_) {}
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

/// Same paging as the gallery, but only the photos the user hid. Showing one
/// again takes it out of this list and puts it back into the gallery.
class HiddenPhotosController extends GalleryController {
  HiddenPhotosController(super.groupId);

  @override
  Map<String, dynamic> get baseQuery => const {'hidden': '1'};

  @override
  void _onUnhide(List<Photo> photos) {
    final ids = photos.map((p) => p.id).toSet();
    state = state.copyWith(photos: state.photos.where((p) => !ids.contains(p.id)).toList());
    // The gallery (if open) picks them up again.
    if (ref.exists(galleryProvider(groupId))) ref.read(galleryProvider(groupId).notifier).refresh();
  }

  @override
  void _onUnhideFailed(List<Photo> photos, List<Photo> wasHere) => _restore(wasHere);
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
    final items = await list(api, group.id, ids);
    if (items.isEmpty) return 0;
    if (!await Gal.hasAccess(toAlbum: true) && !await Gal.requestAccess(toAlbum: true)) {
      throw ApiException(L10n.current.photoAccessToSave);
    }
    final tmp = await getTemporaryDirectory();
    var done = 0;
    for (final item in items) {
      final path = '${tmp.path}/dl_${item['id']}.${item['ext']}';
      await Api.download(item['url'] as String, path);
      try {
        if (item['kind'] == 'video') {
          await Gal.putVideo(path, album: group.deviceAlbum);
        } else {
          await Gal.putImage(path, album: group.deviceAlbum);
        }
      } on GalException catch (e) {
        throw ApiException(e.type == GalExceptionType.notEnoughSpace ? L10n.current.phoneFull : L10n.current.albumSaveFailedShort);
      }
      try {
        await File(path).delete();
      } catch (_) {}
      done++;
      onProgress?.call(DownloadProgress(done, items.length));
    }
    return done;
  }

  static String mimeFor(String ext, {required bool video}) => switch (ext.toLowerCase()) {
        'jpg' || 'jpeg' => 'image/jpeg',
        'png' => 'image/png',
        'heic' => 'image/heic',
        'webp' => 'image/webp',
        'mov' => 'video/quicktime',
        'mp4' || 'm4v' => 'video/mp4',
        _ => video ? 'video/mp4' : 'image/jpeg',
      };

  /// The download list of a group: signed URLs with id, kind and ext. Pro
  /// gets originals, free the display version (decided server-side).
  /// [ids] empty = everything.
  static Future<List<Map<String, dynamic>>> list(Api api, String groupId, List<String> ids) async {
    final res = await api.get('/groups/$groupId/download', query: ids.isEmpty ? null : {'ids': ids.join(',')});
    return ((res['items'] as List?) ?? const []).cast<Map<String, dynamic>>();
  }

  /// Downloads photos/videos of one group into [dir] (for the share sheet),
  /// same quality as [save]. Items that fail are skipped; throws only when
  /// nothing could be downloaded. [onFile] runs after every finished item.
  static Future<List<({String path, String mime})>> toFiles(Api api, String groupId, List<String> ids, Directory dir,
      {void Function()? onFile}) async {
    final items = await list(api, groupId, ids);
    final out = <({String path, String mime})>[];
    Object? error;
    for (final item in items) {
      final path = '${dir.path}/camtrip_${item['id']}.${item['ext']}';
      try {
        await Api.download(item['url'] as String, path);
        out.add((path: path, mime: mimeFor(item['ext'] as String? ?? '', video: item['kind'] == 'video')));
      } catch (e) {
        error = e;
      }
      onFile?.call();
    }
    if (out.isEmpty && error != null) throw ApiException.from(error);
    return out;
  }
}
