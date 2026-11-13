import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../core/storage.dart';
import '../../main.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../upload/upload_queue.dart';

final groupsProvider = AsyncNotifierProvider<GroupsController, List<Group>>(GroupsController.new);

class GroupsController extends AsyncNotifier<List<Group>> {
  Api get _api => ref.read(apiProvider);

  @override
  FutureOr<List<Group>> build() {
    // Refetch for a different account or a Pro change (member limits and
    // retention change with it), not for every profile edit or block.
    final (userId, _) = ref.watch(authProvider.select((a) => (a.value?.id, a.value?.isPro)));
    if (userId == null) return const [];
    // Cold start: show the last known list at once and refresh in the background.
    final cached = _cached(userId);
    if (cached != null) {
      Timer.run(() async {
        if (ref.mounted) _ensureActive(cached); // not during build: it writes another provider
        try {
          final fresh = await _fetch(userId);
          if (ref.mounted) state = AsyncData(fresh);
        } catch (_) {} // offline: keep the cached list
      });
      return cached;
    }
    return _fetch(userId);
  }

  Future<List<Group>> _fetch(String userId) async {
    final res = await _api.get('/groups');
    final list = (res['groups'] as List?) ?? const [];
    final groups = list.map((g) => Group.fromJson(g as Map<String, dynamic>)).toList();
    if (userId.isNotEmpty) _prefsOrNull?.cachedGroups = {'userId': userId, 'groups': list};
    _ensureActive(groups);
    return groups;
  }

  /// The groups cached for [userId] (or for the offline placeholder, id '').
  List<Group>? _cached(String userId) {
    final c = _prefsOrNull?.cachedGroups;
    if (c == null || (userId.isNotEmpty && c['userId'] != userId)) return null;
    try {
      return ((c['groups'] as List?) ?? const []).map((g) => Group.fromJson(g as Map<String, dynamic>)).toList();
    } catch (_) {
      return null;
    }
  }

  Prefs? get _prefsOrNull {
    try {
      return ref.read(prefsProvider);
    } catch (_) {
      return null;
    }
  }

  /// Groups the camera can shoot into: not closed, not archived by me.
  static bool _usable(Group g) => !g.isClosed && !g.archived;

  void _ensureActive(List<Group> groups) {
    final prefs = ref.read(prefsProvider);
    // The personal roll was picked on purpose: keep it.
    if (prefs.activeGroupId == Group.personalRollId) return;
    final active = groups.where(_usable).toList();
    if (active.isEmpty) return;
    if (!active.any((g) => g.id == prefs.activeGroupId)) {
      ref.read(activeGroupIdProvider.notifier).set(active.first.id);
    }
  }

  Future<void> reload() async {
    final userId = ref.read(authProvider).value?.id;
    if (userId == null) return;
    state = await AsyncValue.guard(() => _fetch(userId));
  }

  /// Takes a group the server sent back (e.g. after deleting photos, so the
  /// counts and cover are right again).
  void applyServerGroup(Group g) => _upsert(g);

  void _upsert(Group g) {
    // The personal roll is not in the albums list; it has its own provider.
    if (g.isPersonal) return ref.read(personalRollProvider.notifier).apply(g);
    final list = [...(state.value ?? const <Group>[])];
    final i = list.indexWhere((x) => x.id == g.id);
    if (i >= 0) {
      list[i] = g;
    } else {
      list.insert(0, g);
    }
    state = AsyncData(list);
  }

  Future<Group> create({
    required String name,
    required GroupType type,
    DateTime? start,
    DateTime? end,
    required String style,
  }) async {
    final res = await _api.post('/groups', {
      'name': name,
      'type': type.name,
      'startDate': ?start?.toIso8601String(),
      'endDate': ?end?.toIso8601String(),
      'defaultStyle': style,
    });
    final g = Group.fromJson(res['group'] as Map<String, dynamic>);
    _upsert(g);
    ref.read(activeGroupIdProvider.notifier).set(g.id);
    return g;
  }

  Future<Group> join(String code) async {
    final res = await _api.post('/groups/join', {'code': code});
    final g = Group.fromJson(res['group'] as Map<String, dynamic>);
    _upsert(g);
    ref.read(activeGroupIdProvider.notifier).set(g.id);
    return g;
  }

  Future<Group> refreshOne(String id) async {
    if (id == Group.personalRollId) return ref.read(personalRollProvider.notifier).reload();
    final res = await _api.get('/groups/$id');
    final g = Group.fromJson(res['group'] as Map<String, dynamic>);
    _upsert(g);
    return g;
  }

  Future<Group> updateGroup(String id, Map<String, dynamic> patch) async {
    final res = await _api.patch('/groups/$id', patch);
    final g = Group.fromJson(res['group'] as Map<String, dynamic>);
    _upsert(g);
    return g;
  }

  Future<Group> removeMember(String groupId, String userId) async {
    final res = await _api.delete('/groups/$groupId/members/$userId');
    final g = Group.fromJson(res['group'] as Map<String, dynamic>);
    _upsert(g);
    return g;
  }

  Future<Group> setRole(String groupId, String userId, String role) async {
    final res = await _api.patch('/groups/$groupId/members/$userId', {'role': role});
    final g = Group.fromJson(res['group'] as Map<String, dynamic>);
    _upsert(g);
    return g;
  }

  /// Replaces one group locally and returns the previous version (for rollback).
  Group? _patchLocal(String id, Group Function(Group) change) {
    final list = [...(state.value ?? const <Group>[])];
    final i = list.indexWhere((x) => x.id == id);
    if (i < 0) return null;
    final before = list[i];
    list[i] = change(before);
    state = AsyncData(list);
    return before;
  }

  /// Optimistic: the name changes at once and goes back if the server says no.
  Future<Group> rename(String id, String name) async {
    final before = _patchLocal(id, (g) => g.copyWith(name: name));
    try {
      return await updateGroup(id, {'name': name});
    } catch (_) {
      if (before != null) _upsert(before);
      rethrow;
    }
  }

  /// "Reis afronden": the trip ends now (admins).
  Future<Group> finishTrip(String id) => updateGroup(id, {'endNow': true});

  /// "Als omslag instellen" (admins).
  Future<Group> setCover(String groupId, String photoId) => updateGroup(groupId, {'coverPhotoId': photoId});

  /// Archives a group for me only (optimistic, rolled back on error). The
  /// camera moves on to another group when this was the active one.
  Future<void> setArchived(String id, bool archived) async {
    final before = _patchLocal(id, (g) => g.copyWith(archived: archived));
    final previousActive = ref.read(activeGroupIdProvider);
    if (archived && previousActive == id) _pickNextActive(except: id);
    try {
      final res = await _api.patch('/groups/$id/archive', {'archived': archived});
      _upsert(Group.fromJson(res['group'] as Map<String, dynamic>));
    } catch (_) {
      if (before != null) _upsert(before);
      if (archived && previousActive == id) ref.read(activeGroupIdProvider.notifier).set(previousActive);
      rethrow;
    }
  }

  Future<void> leave(String id) => _removeOptimistic(id, () => _api.post('/groups/$id/leave'));

  /// Deletes the group and all its photos for everyone (admins only).
  Future<void> deleteGroup(String id) => _removeOptimistic(id, () => _api.delete('/groups/$id'));

  /// Removes the group from the list at once; puts it back if the call fails.
  Future<void> _removeOptimistic(String id, Future<Object?> Function() call) async {
    final before = state.value ?? const <Group>[];
    final previousActive = ref.read(activeGroupIdProvider);
    _drop(id);
    try {
      await call();
    } catch (_) {
      state = AsyncData(before);
      ref.read(activeGroupIdProvider.notifier).set(previousActive);
      rethrow;
    }
  }

  void _pickNextActive({required String except}) {
    final next = (state.value ?? const <Group>[]).where((g) => g.id != except && _usable(g)).firstOrNull;
    ref.read(activeGroupIdProvider.notifier).set(next?.id);
  }

  void _drop(String id) {
    final list = (state.value ?? const <Group>[]).where((g) => g.id != id).toList();
    state = AsyncData(list);
    if (ref.read(activeGroupIdProvider) == id) _pickNextActive(except: id);
  }
}

/// My personal roll ("Mijn rolletje"): loose photos that are not for an
/// album. Always available, also offline and before the server created it:
/// it starts as the cached copy (or a placeholder with id
/// [Group.personalRollId]) and is fetched from GET /me/roll, which creates it
/// on first use. Uploads use the id "me", which the API resolves.
final personalRollProvider = NotifierProvider<PersonalRollController, Group>(PersonalRollController.new);

class PersonalRollController extends Notifier<Group> {
  @override
  Group build() {
    final (userId, isPro) = ref.watch(authProvider.select((a) => (a.value?.id, a.value?.isPro ?? false)));
    final placeholder = Group.personalPlaceholder(ownerId: userId ?? '', isPro: isPro);
    if (userId == null) return placeholder;
    final sub = ref.read(uploadedProvider).stream.where((g) => g == Group.personalRollId).listen((_) => _refreshQuietly());
    ref.onDispose(sub.cancel);
    Timer.run(_refreshQuietly);
    return _cached(userId) ?? placeholder;
  }

  Group? _cached(String userId) {
    final c = _prefs?.cachedPersonalRoll;
    if (c == null || c['userId'] != userId) return null;
    try {
      return Group.fromJson((c['group'] as Map).cast<String, dynamic>());
    } catch (_) {
      return null;
    }
  }

  Prefs? get _prefs {
    try {
      return ref.read(prefsProvider);
    } catch (_) {
      return null;
    }
  }

  Future<void> _refreshQuietly() async {
    if (!ref.mounted) return;
    try {
      await reload();
    } catch (_) {} // offline: keep what we have
  }

  Future<Group> reload() async {
    final res = await ref.read(apiProvider).get('/me/roll');
    final json = (res['group'] as Map).cast<String, dynamic>();
    final g = Group.fromJson(json);
    if (ref.mounted) {
      final userId = ref.read(authProvider).value?.id;
      if (userId != null) _prefs?.cachedPersonalRoll = {'userId': userId, 'group': json};
      state = g;
    }
    return g;
  }

  /// Takes the roll as the server sent it back (e.g. after a delete or a new cover).
  void apply(Group g) => state = g;
}

/// The group the camera shoots into.
final activeGroupIdProvider = NotifierProvider<ActiveGroupId, String?>(ActiveGroupId.new);

class ActiveGroupId extends Notifier<String?> {
  @override
  String? build() => ref.read(prefsProvider).activeGroupId;

  void set(String? id) {
    ref.read(prefsProvider).activeGroupId = id;
    state = id;
  }
}

/// The group the camera shoots into. My personal roll when I picked it, or
/// when there is no usable album to shoot into (no groups, or the picked one
/// is gone, closed or archived).
final activeGroupProvider = Provider<Group?>((ref) {
  final id = ref.watch(activeGroupIdProvider);
  final roll = ref.watch(personalRollProvider);
  if (id == null || roll.isId(id)) return roll;
  final groups = ref.watch(groupsProvider).value;
  if (groups == null) return null; // still loading: don't shoot into the wrong place
  for (final g in groups) {
    if (g.id == id && !g.isClosed && !g.archived) return g;
  }
  return roll;
});

/// A group by id: an album from the list, or my personal roll (by "me" or its server id).
final groupProvider = Provider.family<Group?, String>((ref, id) {
  final roll = ref.watch(personalRollProvider);
  if (roll.isId(id)) return roll;
  final groups = ref.watch(groupsProvider).value ?? const [];
  for (final g in groups) {
    if (g.id == id) return g;
  }
  return null;
});
