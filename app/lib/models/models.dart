import 'dart:ui';

import '../l10n/l10n.dart';

DateTime? _date(dynamic v) => v == null ? null : DateTime.tryParse(v.toString());

Color parseColor(String? hex, [Color fallback = const Color(0xFFD9472B)]) {
  if (hex == null || hex.length != 7) return fallback;
  final v = int.tryParse('FF${hex.substring(1)}', radix: 16);
  return v == null ? fallback : Color(v);
}

class AppUser {
  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarColor,
    required this.isPro,
    required this.notifyNewPhotos,
    required this.notifyRecap,
    this.blockedUserIds = const [],
    this.role = 'user',
    this.proSource,
    this.proUntil,
  });

  final String id;
  final String name;
  final String email;
  final String avatarColor;
  final bool isPro;
  final bool notifyNewPhotos;
  final bool notifyRecap;

  /// People whose photos this user hid ("Lid blokkeren").
  final List<String> blockedUserIds;

  /// App-wide role: 'admin' shows "Beheer" in Instellingen.
  final String role;

  /// Why this account has Pro: 'subscription', 'gift' or 'admin' (null without).
  final String? proSource;

  /// When personal Pro ends; null = no end date (or no Pro).
  final DateTime? proUntil;

  bool get isAppAdmin => role == 'admin';

  Color get color => parseColor(avatarColor);
  String get initial => name.isEmpty ? '?' : name.characters.first.toUpperCase();

  factory AppUser.fromJson(Map<String, dynamic> j) {
    final s = (j['settings'] as Map?) ?? const {};
    return AppUser(
      id: j['id'] as String,
      name: (j['name'] as String?) ?? '',
      email: (j['email'] as String?) ?? '',
      avatarColor: (j['avatarColor'] as String?) ?? '#d9472b',
      isPro: j['isPro'] == true,
      notifyNewPhotos: s['notifyNewPhotos'] != false,
      notifyRecap: s['notifyRecap'] != false,
      blockedUserIds: ((j['blockedUserIds'] as List?) ?? const []).map((e) => e.toString()).toList(),
      role: (j['role'] as String?) ?? 'user',
      proSource: j['proSource'] as String?,
      proUntil: _date(j['proUntil']),
    );
  }

  AppUser copyWith({bool? isPro, String? name}) => AppUser(
        id: id,
        name: name ?? this.name,
        email: email,
        avatarColor: avatarColor,
        isPro: isPro ?? this.isPro,
        notifyNewPhotos: notifyNewPhotos,
        notifyRecap: notifyRecap,
        blockedUserIds: blockedUserIds,
        role: role,
        proSource: proSource,
        proUntil: proUntil,
      );
}

extension on String {
  Iterable<String> get characters => runes.map(String.fromCharCode);
}

class Member {
  Member({required this.id, required this.name, required this.avatarColor, required this.role});
  final String id;
  final String name;
  final String avatarColor;
  final String role;

  bool get isAdmin => role == 'admin';
  Color get color => parseColor(avatarColor);
  String get initial => name.isEmpty ? '?' : String.fromCharCode(name.runes.first).toUpperCase();

  factory Member.fromJson(Map<String, dynamic> j) => Member(
        id: j['id'] as String,
        name: (j['name'] as String?) ?? L10n.current.memberFallbackName,
        avatarColor: (j['avatarColor'] as String?) ?? '#d9472b',
        role: (j['role'] as String?) ?? 'member',
      );
}

/// Why a photo is reported ("Foto rapporteren"). Ids match the API.
enum ReportReason {
  ongepast,
  spam,
  anders;

  String get label => switch (this) {
        ongepast => L10n.current.reportReasonInappropriate,
        spam => L10n.current.reportReasonSpam,
        anders => L10n.current.reportReasonOther,
      };
}

enum GroupType { vacation, event, permanent }

class Group {
  Group({
    required this.id,
    required String name,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.defaultStyle,
    required this.code,
    required this.status,
    required this.photoCount,
    required this.videoCount,
    required this.coverUrl,
    required this.deleteAfter,
    required this.isProGroup,
    required this.memberLimit,
    required this.myRole,
    required this.ownerId,
    required this.members,
    this.archived = false,
    this.hiddenCount = 0,
    this.proSource,
    this.proByName,
    this.tripPassByName,
    this.rollUsed = 0,
    this.rollLimit,
    DateTime? fetchedAt,
    this.isPersonal = false,
    this.tripMap = TripMapState.off,
    String? serverId,
  })  : _name = name,
        serverId = serverId ?? id,
        fetchedAt = fetchedAt ?? DateTime.now();

  /// The id the app uses for my personal roll ("Mijn rolletje"), whatever
  /// its server id is. The API accepts it wherever a group id goes, so photos
  /// taken offline (before the roll's real id is known) can still be queued.
  static const personalRollId = 'me';

  /// The app-side id: [personalRollId] for the personal roll, else the server id.
  final String id;

  /// The group's id on the server (the same as [id] except for the personal roll).
  final String serverId;

  /// My private personal roll for loose photos: only me, no invite, no
  /// members, never deleted automatically. Shown as "Mijn rolletje".
  final bool isPersonal;

  final String _name;

  /// Shown name. The personal roll gets its label in the app's language.
  String get name => isPersonal ? L10n.current.personalRollTitle : _name;

  /// The phone album its photos are saved to. One stable name for the
  /// personal roll (not translated), so a language switch never makes a second album.
  String get deviceAlbum => isPersonal ? 'CamTrip' : 'CamTrip - $_name';

  /// Is [groupId] this group (by app id or server id)?
  bool isId(String groupId) => groupId == id || groupId == serverId;

  final GroupType type;
  final DateTime? startDate;
  final DateTime? endDate;
  final String defaultStyle;
  final String code;
  final String status;
  final int photoCount;
  final int videoCount;
  final String? coverUrl;
  final DateTime? deleteAfter;
  final bool isProGroup;
  final int? memberLimit;
  final String? myRole;
  final String ownerId;
  final List<Member> members;

  /// Archived by this user only ("Gearchiveerd" in their albums list).
  final bool archived;

  /// Photos this user hid for themselves ("Verborgen foto's").
  final int hiddenCount;

  /// Reiskaart: switched on for the group, and do I share my locations.
  final TripMapState tripMap;

  /// Group Pro: 'self' = my own Pro, 'group' = another member's ("Pro via Sanne").
  /// One Pro in the group = Pro for everyone in it. null when not a Pro group.
  final String? proSource;

  /// Name of the member whose Pro the group uses.
  final String? proByName;

  /// Who bought this group's Trip Pass (Pro for good, for everyone in it); null = no pass.
  final String? tripPassByName;

  /// My free roll here: shots used out of [rollLimit] ("18/24"). [rollLimit]
  /// null = no limit for me here (my own Pro, a Pro member or a Trip Pass).
  /// For my personal roll the 24 start again every calendar month.
  final int rollUsed;
  final int? rollLimit;

  /// When this copy came from the server (to tell it from newer counts the upload queue saw).
  final DateTime fetchedAt;

  bool get hasTripPass => tripPassByName != null;

  /// Pro thanks to a Trip Pass (and not my own Pro).
  bool get isProViaTripPass => isProGroup && proSource == 'tripPass';

  /// Pro thanks to someone else in the group, not my own account.
  bool get isProViaGroup => isProGroup && proSource == 'group';

  bool get isAdmin => myRole == 'admin';

  /// Closed by an admin ("Groep afsluiten"): no new photos, for everyone.
  /// Not the same as [archived], which is personal.
  bool get isArchived => status == 'archived';
  bool get isClosed => isArchived;

  /// "Reis afronden" makes sense for dated groups that have not ended yet.
  bool get canFinishTrip => type != GroupType.permanent && (endDate == null || endDate!.isAfter(DateTime.now()));
  bool get hasEnded => endDate != null && endDate!.isBefore(DateTime.now().subtract(const Duration(hours: 12)));
  int get totalCount => photoCount + videoCount;
  bool get isFull => memberLimit != null && members.length >= memberLimit!;

  Member? member(String userId) {
    for (final m in members) {
      if (m.id == userId) return m;
    }
    return null;
  }

  /// Stand-in for my personal roll before the server sent it (first start, offline).
  factory Group.personalPlaceholder({required String ownerId, bool isPro = false}) => Group(
        id: personalRollId,
        name: '',
        type: GroupType.permanent,
        startDate: null,
        endDate: null,
        defaultStyle: 'flash',
        code: '',
        status: 'active',
        photoCount: 0,
        videoCount: 0,
        coverUrl: null,
        deleteAfter: null,
        isProGroup: isPro,
        memberLimit: null,
        myRole: 'admin',
        ownerId: ownerId,
        members: const [],
        proSource: isPro ? 'self' : null,
        isPersonal: true,
      );

  factory Group.fromJson(Map<String, dynamic> j) => Group(
        id: j['isPersonal'] == true ? personalRollId : j['id'] as String,
        serverId: j['id'] as String,
        isPersonal: j['isPersonal'] == true,
        name: j['name'] as String,
        type: GroupType.values.firstWhere((t) => t.name == j['type'], orElse: () => GroupType.vacation),
        startDate: _date(j['startDate']),
        endDate: _date(j['endDate']),
        defaultStyle: (j['defaultStyle'] as String?) ?? 'flash',
        code: (j['code'] as String?) ?? '',
        status: (j['status'] as String?) ?? 'active',
        photoCount: (j['photoCount'] as num?)?.toInt() ?? 0,
        videoCount: (j['videoCount'] as num?)?.toInt() ?? 0,
        coverUrl: j['coverUrl'] as String?,
        deleteAfter: _date(j['deleteAfter']),
        isProGroup: j['isProGroup'] == true,
        memberLimit: (j['memberLimit'] as num?)?.toInt(),
        myRole: j['myRole'] as String?,
        ownerId: (j['ownerId'] as String?) ?? '',
        members: ((j['members'] as List?) ?? const []).map((m) => Member.fromJson(m as Map<String, dynamic>)).toList(),
        archived: j['archived'] == true,
        hiddenCount: (j['hiddenCount'] as num?)?.toInt() ?? 0,
        proSource: j['proSource'] as String?,
        proByName: (j['proBy'] as Map?)?['name'] as String?,
        tripMap: TripMapState.fromJson(j['tripMap']),
        tripPassByName: (j['tripPass'] as Map?)?['purchasedByName'] as String?,
        rollUsed: ((j['roll'] as Map?)?['used'] as num?)?.toInt() ?? 0,
        rollLimit: ((j['roll'] as Map?)?['limit'] as num?)?.toInt(),
      );

  Group copyWith({String? name, bool? archived, int? hiddenCount, int? photoCount, int? videoCount, DateTime? endDate}) => Group(
        id: id,
        serverId: serverId,
        isPersonal: isPersonal,
        name: name ?? _name,
        type: type,
        startDate: startDate,
        endDate: endDate ?? this.endDate,
        defaultStyle: defaultStyle,
        code: code,
        status: status,
        photoCount: photoCount ?? this.photoCount,
        videoCount: videoCount ?? this.videoCount,
        coverUrl: coverUrl,
        deleteAfter: deleteAfter,
        isProGroup: isProGroup,
        memberLimit: memberLimit,
        myRole: myRole,
        ownerId: ownerId,
        members: members,
        archived: archived ?? this.archived,
        hiddenCount: hiddenCount ?? this.hiddenCount,
        proSource: proSource,
        proByName: proByName,
        tripMap: tripMap,
        tripPassByName: tripPassByName,
        rollUsed: rollUsed,
        rollLimit: rollLimit,
        fetchedAt: fetchedAt,
      );
}

/// Reiskaart (trip map) state of a group for me. The map is off by default;
/// a group admin switches it on. Each member then chooses whether their own
/// photos get a (coarse) location: [myConsent] null = not asked yet.
class TripMapState {
  const TripMapState({required this.enabled, this.myConsent});
  static const off = TripMapState(enabled: false);

  final bool enabled;
  final bool? myConsent;

  /// Only when both are on does the camera read the location.
  bool get sharesLocation => enabled && myConsent == true;

  /// Ask "Deel waar je foto's gemaakt zijn ...?" before the first photo.
  bool get needsConsent => enabled && myConsent == null;

  factory TripMapState.fromJson(Object? j) {
    if (j is! Map) return off;
    final c = j['myConsent'];
    return TripMapState(enabled: j['enabled'] == true, myConsent: c is bool ? c : null);
  }
}

class Reaction {
  Reaction(this.emoji, this.count);
  final String emoji;
  final int count;
}

class Photo {
  Photo({
    required this.id,
    required this.groupId,
    required this.userId,
    required this.kind,
    required this.style,
    required this.width,
    required this.height,
    required this.durationMs,
    required this.takenAt,
    required this.fromRoll,
    required this.thumbUrl,
    required this.displayUrl,
    required this.videoUrl,
    required this.reactions,
    required this.myReactions,
    required this.favoriteCount,
    required this.isFavorite,
  });

  final String id;
  final String groupId;
  final String userId;
  final String kind;
  final String style;
  final int width;
  final int height;
  final int durationMs;
  final DateTime takenAt;
  final bool fromRoll;
  final String thumbUrl;
  final String displayUrl;
  final String? videoUrl;
  final List<Reaction> reactions;
  final List<String> myReactions;
  final int favoriteCount;
  final bool isFavorite;

  bool get isVideo => kind == 'video';

  /// The photographer, or any admin, may delete a photo for the whole group.
  bool canDelete(String? me, Group? group) => userId == me || (group?.isAdmin ?? false);

  Photo copyWith({bool? isFavorite, int? favoriteCount}) => Photo(
        id: id,
        groupId: groupId,
        userId: userId,
        kind: kind,
        style: style,
        width: width,
        height: height,
        durationMs: durationMs,
        takenAt: takenAt,
        fromRoll: fromRoll,
        thumbUrl: thumbUrl,
        displayUrl: displayUrl,
        videoUrl: videoUrl,
        reactions: reactions,
        myReactions: myReactions,
        favoriteCount: favoriteCount ?? this.favoriteCount,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  int get heartCount => reactions.fold(0, (a, r) => a + r.count);

  factory Photo.fromJson(Map<String, dynamic> j) => Photo(
        id: j['id'] as String,
        groupId: j['groupId'] as String,
        userId: j['userId'] as String,
        kind: (j['kind'] as String?) ?? 'photo',
        style: (j['style'] as String?) ?? 'instant',
        width: (j['width'] as num?)?.toInt() ?? 0,
        height: (j['height'] as num?)?.toInt() ?? 0,
        durationMs: (j['durationMs'] as num?)?.toInt() ?? 0,
        takenAt: _date(j['takenAt']) ?? DateTime.now(),
        fromRoll: j['fromRoll'] == true,
        thumbUrl: (j['thumbUrl'] as String?) ?? '',
        displayUrl: (j['displayUrl'] as String?) ?? '',
        videoUrl: j['videoUrl'] as String?,
        reactions: ((j['reactions'] as List?) ?? const [])
            .map((r) => Reaction((r as Map)['emoji'] as String, (r['count'] as num?)?.toInt() ?? 0))
            .toList(),
        myReactions: ((j['myReactions'] as List?) ?? const []).map((e) => e.toString()).toList(),
        favoriteCount: (j['favoriteCount'] as num?)?.toInt() ?? 0,
        isFavorite: j['isFavorite'] == true,
      );
}
