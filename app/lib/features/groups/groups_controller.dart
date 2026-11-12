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
    final user = ref.watch(authProvider).value;
    if (user == null) return const [];
    final res = await _api.get('/groups');
    final groups = ((res['groups'] as List?) ?? const []).map((g) => Group.fromJson(g as Map<String, dynamic>)).toList();
    _ensureActive(groups);
    return groups;
  }

  void _ensureActive(List<Group> groups) {
    final prefs = ref.read(prefsProvider);
    final active = groups.where((g) => !g.isArchived).toList();
    if (active.isEmpty) return;
    if (!active.any((g) => g.id == prefs.activeGroupId)) {
      ref.read(activeGroupIdProvider.notifier).set(active.first.id);
    }
  }

  Future<void> reload() async {
    state = await AsyncValue.guard(build);
  }

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

  Future<void> leave(String id) async {
    await _api.post('/groups/$id/leave');
    _drop(id);
  }

  Future<void> deleteGroup(String id) async {
    await _api.delete('/groups/$id');
    _drop(id);
  }

  void _drop(String id) {
    final list = (state.value ?? const <Group>[]).where((g) => g.id != id).toList();
    state = AsyncData(list);
    if (ref.read(activeGroupIdProvider) == id) {
      final next = list.where((g) => !g.isArchived).firstOrNull;
      ref.read(activeGroupIdProvider.notifier).set(next?.id);
    }
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
