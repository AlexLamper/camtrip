import 'dart:ui';

DateTime? _date(dynamic v) => v == null ? null : DateTime.tryParse(v.toString());

Color parseColor(String? hex, [Color fallback = const Color(0xFFD9472B)]) {
  if (hex == null || hex.length != 7) return fallback;
  return Color(int.parse('FF${hex.substring(1)}', radix: 16));
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
  });

  final String id;
  final String name;
  final String email;
  final String avatarColor;
  final bool isPro;
  final bool notifyNewPhotos;
  final bool notifyRecap;

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
        name: (j['name'] as String?) ?? 'Vriend',
        avatarColor: (j['avatarColor'] as String?) ?? '#d9472b',
        role: (j['role'] as String?) ?? 'member',
      );
}

enum GroupType { vacation, event, permanent }

class Group {
  Group({
    required this.id,
    required this.name,
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
  });

  final String id;
  final String name;
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

  bool get isAdmin => myRole == 'admin';
  bool get isArchived => status == 'archived';
  bool get hasEnded => endDate != null && endDate!.isBefore(DateTime.now().subtract(const Duration(hours: 12)));
  int get totalCount => photoCount + videoCount;
  bool get isFull => memberLimit != null && members.length >= memberLimit!;

  Member? member(String userId) {
    for (final m in members) {
      if (m.id == userId) return m;
    }
    return null;
  }

  factory Group.fromJson(Map<String, dynamic> j) => Group(
        id: j['id'] as String,
        name: j['name'] as String,
        type: GroupType.values.firstWhere((t) => t.name == j['type'], orElse: () => GroupType.vacation),
        startDate: _date(j['startDate']),
        endDate: _date(j['endDate']),
        defaultStyle: (j['defaultStyle'] as String?) ?? 'instant',
        code: j['code'] as String,
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
      );
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
        thumbUrl: j['thumbUrl'] as String,
        displayUrl: j['displayUrl'] as String,
        videoUrl: j['videoUrl'] as String?,
        reactions: ((j['reactions'] as List?) ?? const [])
            .map((r) => Reaction((r as Map)['emoji'] as String, (r['count'] as num).toInt()))
            .toList(),
        myReactions: ((j['myReactions'] as List?) ?? const []).cast<String>(),
        favoriteCount: (j['favoriteCount'] as num?)?.toInt() ?? 0,
        isFavorite: j['isFavorite'] == true,
      );
}
