import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../main.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';

final groupsProvider = AsyncNotifierProvider<GroupsController, List<Group>>(GroupsController.new);

class GroupsController extends AsyncNotifier<List<Group>> {
  Api get _api => ref.read(apiProvider);

  @override
  Future<List<Group>> build() async {
    // Refetch for a different account or a Pro change (member limits and
    // retention change with it), not for every profile edit or block.
    final (userId, _) = ref.watch(authProvider.select((a) => (a.value?.id, a.value?.isPro)));
    if (userId == null) return const [];
    final res = await _api.get('/groups');
    final groups = ((res['groups'] as List?) ?? const []).map((g) => Group.fromJson(g as Map<String, dynamic>)).toList();
    _ensureActive(groups);
    return groups;
  }

  /// Groups the camera can shoot into: not closed, not archived by me.
  static bool _usable(Group g) => !g.isClosed && !g.archived;

  void _ensureActive(List<Group> groups) {
    final prefs = ref.read(prefsProvider);
    final active = groups.where(_usable).toList();
    if (active.isEmpty) return;
    if (!active.any((g) => g.id == prefs.activeGroupId)) {
      ref.read(activeGroupIdProvider.notifier).set(active.first.id);
    }
  }

  Future<void> reload() async {
    state = await AsyncValue.guard(build);
  }

  /// Takes a group the server sent back (e.g. after deleting photos, so the
  /// counts and cover are right again).
  void applyServerGroup(Group g) => _upsert(g);

  void _upsert(Group g) {
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

final activeGroupProvider = Provider<Group?>((ref) {
  final id = ref.watch(activeGroupIdProvider);
  final groups = ref.watch(groupsProvider).value ?? const [];
  for (final g in groups) {
    if (g.id == id) return g;
  }
  return null;
});

final groupProvider = Provider.family<Group?, String>((ref, id) {
  final groups = ref.watch(groupsProvider).value ?? const [];
  for (final g in groups) {
    if (g.id == id) return g;
  }
  return null;
});
