import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import 'gallery_controller.dart' show mergePhotos;
import '../upload/upload_queue.dart';

/// "Alle foto's": every photo and video the user made, across all their
/// albums, newest first (GET /me/photos).
class AllPhotosState {
  const AllPhotosState({
    this.photos = const [],
    this.groupNames = const {},
    this.loading = false,
    this.hasMore = true,
    this.loaded = false,
    this.error,
  });

  final List<Photo> photos;

  /// groupId -> album name, from the items' groupName.
  final Map<String, String> groupNames;
  final bool loading;
  final bool hasMore;

  /// The first page has arrived (so an empty list really is empty).
  final bool loaded;
  final String? error;

  AllPhotosState copyWith({
    List<Photo>? photos,
    Map<String, String>? groupNames,
    bool? loading,
    bool? hasMore,
    bool? loaded,
    String? error,
    bool clearError = false,
  }) => AllPhotosState(
    photos: photos ?? this.photos,
    groupNames: groupNames ?? this.groupNames,
    loading: loading ?? this.loading,
    hasMore: hasMore ?? this.hasMore,
    loaded: loaded ?? this.loaded,
    error: clearError ? null : (error ?? this.error),
  );
}

final allPhotosProvider = NotifierProvider<AllPhotosController, AllPhotosState>(AllPhotosController.new);

class AllPhotosController extends Notifier<AllPhotosState> {
  static const pageSize = 60;

  String? _cursor;
  int _generation = 0;

  Api get _api => ref.read(apiProvider);

  @override
  AllPhotosState build() {
    _generation++; // drops answers that belong to a previous account
    // Another account signs in: start over.
    final userId = ref.watch(authProvider.select((a) => a.value?.id));
    if (userId == null) return const AllPhotosState(loading: true);
    final sub = ref.read(uploadedProvider).stream.listen((_) => refresh());
    ref.onDispose(sub.cancel);
    Future.microtask(refresh);
    return const AllPhotosState(loading: true);
  }

  Future<void> refresh() async {
    _cursor = null;
    final gen = ++_generation;
    state = state.copyWith(loading: true, clearError: true);
    try {
      final res = await _api.get('/me/photos', query: {'limit': pageSize});
      if (gen != _generation) return;
      final (photos, names) = _parse(res);
      state = state.copyWith(photos: photos, groupNames: names, loading: false, loaded: true, hasMore: _cursor != null);
    } on ApiException catch (e) {
      if (gen != _generation) return;
      state = state.copyWith(loading: false, loaded: true, error: e.message);
    }
  }

  Future<void> loadMore() async {
    if (state.loading || !state.hasMore || _cursor == null) return;
    final gen = _generation;
    state = state.copyWith(loading: true);
    try {
      final res = await _api.get('/me/photos', query: {'limit': pageSize, 'cursor': _cursor});
      if (gen != _generation) return;
      final (more, names) = _parse(res);
      final seen = state.photos.map((p) => p.id).toSet();
      state = state.copyWith(
        photos: [...state.photos, ...more.where((p) => !seen.contains(p.id))],
        groupNames: {...state.groupNames, ...names},
        loading: false,
        hasMore: _cursor != null,
      );
    } on ApiException catch (e) {
      if (gen != _generation) return;
      state = state.copyWith(loading: false, error: e.message);
    }
  }

  /// Takes photos out of the grid at once (deleted or hidden elsewhere).
  /// Returns what was removed, so it can be put back.
  List<Photo> removeLocal(Set<String> ids) {
    final removed = state.photos.where((p) => ids.contains(p.id)).toList();
    if (removed.isNotEmpty) state = state.copyWith(photos: state.photos.where((p) => !ids.contains(p.id)).toList());
    return removed;
  }

  /// Puts photos back (a failed delete, or "Ongedaan maken").
  void restoreLocal(Iterable<Photo> photos) => state = state.copyWith(photos: mergePhotos(state.photos, photos));

  /// Keeps the favorite mark in step with the album galleries.
  void setFavoriteLocal(Set<String> ids, bool favorite) => state = state.copyWith(photos: [
        for (final p in state.photos)
          if (ids.contains(p.id) && p.isFavorite != favorite)
            p.copyWith(isFavorite: favorite, favoriteCount: (p.favoriteCount + (favorite ? 1 : -1)).clamp(0, 1 << 30))
          else
            p,
      ]);

  (List<Photo>, Map<String, String>) _parse(Map<String, dynamic> res) {
    _cursor = res['nextCursor'] as String?;
    final items = [
      for (final j in ((res['photos'] as List?) ?? const []).cast<Map<String, dynamic>>())
        // My personal roll goes by its app id ("me") and its name in the app's language.
        if (j['groupPersonal'] == true) {...j, 'groupId': Group.personalRollId, 'groupName': L10n.current.personalRollTitle} else j,
    ];
    final names = <String, String>{
      for (final j in items)
        if ((j['groupName'] as String?)?.isNotEmpty ?? false) j['groupId'] as String: j['groupName'] as String,
    };
    return (items.map(Photo.fromJson).toList(), names);
  }
}

/// "0:07" / "1:23" / "1:02:03" for the video badge.
String formatDuration(int ms) {
  final s = (ms / 1000).round();
  final h = s ~/ 3600, m = (s % 3600) ~/ 60, sec = s % 60;
  String two(int v) => v.toString().padLeft(2, '0');
  return h > 0 ? '$h:${two(m)}:${two(sec)}' : '$m:${two(sec)}';
}
