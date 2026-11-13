import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../models/models.dart';
import '../groups/groups_controller.dart';
import 'trip_map_data.dart';

/// GET /groups/:id/map: stats always, points only while the map is on.
/// ?tz makes "days" and "most active day" follow this phone's calendar.
final tripMapProvider = FutureProvider.autoDispose.family<TripMapData, String>((ref, groupId) async {
  final serverId = ref.read(groupProvider(groupId))?.serverId ?? groupId;
  final res = await ref.read(apiProvider).get(
    '/groups/$serverId/map',
    query: {'tz': DateTime.now().timeZoneOffset.inMinutes.toString()},
  );
  return TripMapData.fromJson(res);
});

final tripMapActionsProvider = Provider((ref) => TripMapActions(ref));

class TripMapActions {
  TripMapActions(this._ref);
  final Ref _ref;

  Api get _api => _ref.read(apiProvider);
  String _serverId(String groupId) => _ref.read(groupProvider(groupId))?.serverId ?? groupId;

  /// My answer to "Deel waar je foto's gemaakt zijn ...?". No = the server
  /// removes every location of my photos in this group.
  Future<Group> setConsent(String groupId, bool consent) =>
      _apply(groupId, _api.put('/groups/${_serverId(groupId)}/map', {'consent': consent}));

  /// Admins only. Off = every location in the group is removed and everyone is asked again next time.
  Future<Group> setEnabled(String groupId, bool enabled) =>
      _apply(groupId, _api.patch('/groups/${_serverId(groupId)}/map', {'enabled': enabled}));

  Future<Group> _apply(String groupId, Future<Map<String, dynamic>> call) async {
    final res = await call;
    final g = Group.fromJson((res['group'] as Map).cast<String, dynamic>());
    _ref.read(groupsProvider.notifier).applyServerGroup(g);
    _ref.invalidate(tripMapProvider(groupId));
    return g;
  }
}
