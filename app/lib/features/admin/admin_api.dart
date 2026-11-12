import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../models/models.dart';

DateTime? _date(dynamic v) => v == null ? null : DateTime.tryParse(v.toString());
int _int(dynamic v) => (v as num?)?.toInt() ?? 0;

/// Dutch label for why someone has Pro.
String proSourceLabel(String? source) => switch (source) {
      'subscription' => 'Abonnement',
      'gift' => 'Cadeau',
      'admin' => 'Beheerder',
      'group' => 'Via groep',
      _ => 'Geen Pro',
    };

/// "Pro (Cadeau) tot 12 dec 2026" / "Pro (Beheerder), geen einddatum" / "Geen Pro".
String proStatusText({required bool isPro, String? source, DateTime? until}) {
  if (!isPro) return 'Geen Pro';
  final end = until == null ? 'geen einddatum' : 'tot ${Fmt.shortYear(until)}';
  return 'Pro (${proSourceLabel(source)}), $end';
}

/// Dutch label for a report reason id.
String reportReasonLabel(String id) {
  for (final r in ReportReason.values) {
    if (r.name == id) return r.label;
  }
  return id;
}

/// The gift choices in "Pro geven". Ids match the API.
enum GrantDuration {
  month('1 maand'),
  year('1 jaar'),
  lifetime('Levenslang'),
  custom('Kies datum');

  const GrantDuration(this.label);
  final String label;
}

class AdminPage<T> {
  AdminPage({required this.items, required this.page, required this.total, required this.hasMore});
  final List<T> items;
  final int page;
  final int total;
  final bool hasMore;

  static AdminPage<T> parse<T>(Map<String, dynamic> j, T Function(Map<String, dynamic>) item) => AdminPage(
        items: ((j['items'] as List?) ?? const []).map((e) => item(e as Map<String, dynamic>)).toList(),
        page: _int(j['page']),
        total: _int(j['total']),
        hasMore: j['hasMore'] == true,
      );
}

class AdminStats {
  AdminStats(this.j);
  final Map<String, dynamic> j;
  Map get _users => (j['users'] as Map?) ?? const {};
  Map get _pro => (j['pro'] as Map?) ?? const {};
  int get usersTotal => _int(_users['total']);
  int get newThisWeek => _int(_users['newThisWeek']);
  int get admins => _int(_users['admins']);
  int get banned => _int(_users['banned']);
  int get groups => _int(j['groups']);
  int get photos => _int(j['photos']);
  int get videos => _int(j['videos']);
  int get proSubscription => _int(_pro['subscription']);
  int get proGift => _int(_pro['gift']);
  int get proGiftOnly => _int(_pro['giftOnly']);
  int get openReports => _int(j['openReports']);
}

class AdminUser {
  AdminUser(this.j);
  final Map<String, dynamic> j;

  String get id => j['id'] as String;
  String get name => (j['name'] as String?) ?? '';
  String get email => (j['email'] as String?) ?? '';
  String get avatarColor => (j['avatarColor'] as String?) ?? '#d9472b';
  bool get isAdmin => j['role'] == 'admin';
  bool get banned => j['banned'] == true;
  bool get isPro => j['isPro'] == true;
  String? get proSource => j['proSource'] as String?;
  DateTime? get proUntil => _date(j['proUntil']);
  DateTime? get createdAt => _date(j['createdAt']);
  String get proText => proStatusText(isPro: isPro, source: proSource, until: proUntil);

  // Detail only.
  bool get emailVerified => j['emailVerified'] == true;
  List<String> get signIns => ((j['signIns'] as List?) ?? const []).map((e) => e.toString()).toList();
  String get bannedReason => (j['bannedReason'] as String?) ?? '';
  int get groupsCount => _int(j['groupsCount']);
  int get photosCount => _int(j['photosCount']);
  bool get subscriptionActive => (j['subscription'] as Map?)?['active'] == true;
  DateTime? get subscriptionExpiresAt => _date((j['subscription'] as Map?)?['expiresAt']);
  Map? get _grant => j['proGrant'] as Map?;
  bool get hasGrant => _grant != null;
  bool get grantActive => _grant?['active'] == true;
  DateTime? get grantUntil => _date(_grant?['until']);
  String get grantReason => (_grant?['reason'] as String?) ?? '';
  String? get grantedByName => (_grant?['grantedBy'] as Map?)?['name'] as String?;
}

class AdminPerson {
  AdminPerson(Map? j)
      : id = (j?['id'] as String?) ?? '',
        name = (j?['name'] as String?) ?? 'Onbekend',
        email = (j?['email'] as String?) ?? '',
        banned = j?['banned'] == true;
  final String id;
  final String name;
  final String email;
  final bool banned;
}

class AdminReport {
  AdminReport(Map<String, dynamic> j)
      : id = j['id'] as String,
        status = (j['status'] as String?) ?? 'open',
        reason = (j['reason'] as String?) ?? 'anders',
        note = (j['note'] as String?) ?? '',
        createdAt = _date(j['createdAt']),
        photoId = (j['photo'] as Map?)?['id'] as String?,
        thumbUrl = (j['photo'] as Map?)?['thumbUrl'] as String?,
        displayUrl = (j['photo'] as Map?)?['displayUrl'] as String?,
        isVideo = (j['photo'] as Map?)?['kind'] == 'video',
        openOnPhoto = _int(j['openReportsOnPhoto']),
        groupName = ((j['group'] as Map?)?['name'] as String?) ?? '',
        reporter = AdminPerson(j['reporter'] as Map?),
        photoUser = AdminPerson(j['photoUser'] as Map?);

  final String id;
  final String status;
  final String reason;
  final String note;
  final DateTime? createdAt;
  final String? photoId;
  final String? thumbUrl;
  final String? displayUrl;
  final bool isVideo;
  final int openOnPhoto;
  final String groupName;
  final AdminPerson reporter;
  final AdminPerson photoUser;

  bool get photoGone => photoId == null;
  String get reasonLabel => reportReasonLabel(reason);
}

/// Calls to /api/mobile/admin/** (only works for app admins).
class AdminApi {
  AdminApi(this._api);
  final Api _api;

  Future<AdminStats> stats() async => AdminStats(await _api.get('/admin/stats'));

  Future<AdminPage<AdminUser>> users({String q = '', int page = 1, int limit = 20}) async =>
      AdminPage.parse(await _api.get('/admin/users', query: {'q': q, 'page': page, 'limit': limit}), AdminUser.new);

  Future<AdminUser> user(String id) async => AdminUser((await _api.get('/admin/users/$id'))['user'] as Map<String, dynamic>);

  Future<AdminUser> grantPro(String id, {required GrantDuration duration, DateTime? until, required String reason}) async {
    final res = await _api.post('/admin/users/$id/pro', {
      'duration': duration.name,
      if (duration == GrantDuration.custom && until != null) 'until': until.toUtc().toIso8601String(),
      'reason': reason,
    });
    return AdminUser(res['user'] as Map<String, dynamic>);
  }

  Future<AdminUser> revokePro(String id) async => AdminUser((await _api.delete('/admin/users/$id/pro'))['user'] as Map<String, dynamic>);

  Future<AdminUser> setBanned(String id, {required bool banned, String? reason}) async {
    final res = await _api.post('/admin/users/$id/ban', {'banned': banned, 'reason': ?reason});
    return AdminUser(res['user'] as Map<String, dynamic>);
  }

  Future<AdminPage<AdminReport>> reports({int page = 1, int limit = 20}) async =>
      AdminPage.parse(await _api.get('/admin/reports', query: {'status': 'open', 'page': page, 'limit': limit}), AdminReport.new);

  /// action: 'dismiss' | 'delete_photo' | 'ban_user'
  Future<void> reportAction(String reportId, String action) => _api.post('/admin/reports/$reportId', {'action': action});
}

final adminApiProvider = Provider((ref) => AdminApi(ref.watch(apiProvider)));
