import 'dart:math' as math;
import 'dart:ui' show Offset;

/// Reiskaart data from GET /groups/:id/map, plus the pure helpers the map
/// screen uses (route per day, clustering). No Flutter widgets in here, so
/// it is easy to test.

DateTime? _date(Object? v) => v == null ? null : DateTime.tryParse(v.toString());

/// One photo or video on the map. Coordinates are already coarse (~100 m).
class TripPoint {
  const TripPoint({
    required this.photoId,
    required this.userId,
    required this.lat,
    required this.lng,
    required this.takenAt,
    this.thumbUrl = '',
    this.kind = 'photo',
    this.countryCode,
  });

  final String photoId;
  final String userId;
  final double lat;
  final double lng;
  final DateTime takenAt;
  final String thumbUrl;
  final String kind;
  final String? countryCode;

  bool get isVideo => kind == 'video';

  factory TripPoint.fromJson(Map<String, dynamic> j) => TripPoint(
        photoId: j['photoId'] as String,
        userId: (j['userId'] as String?) ?? '',
        lat: (j['lat'] as num).toDouble(),
        lng: (j['lng'] as num).toDouble(),
        takenAt: _date(j['takenAt']) ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
        thumbUrl: (j['thumbUrl'] as String?) ?? '',
        kind: (j['kind'] as String?) ?? 'photo',
        countryCode: j['countryCode'] as String?,
      );
}

class TripStats {
  const TripStats({
    this.days = 0,
    this.photos = 0,
    this.videos = 0,
    this.members = 0,
    this.mostActiveDay,
    this.mostActiveDayCount = 0,
    this.topPhotographerId,
    this.topPhotographerName,
    this.topPhotographerCount = 0,
    this.located = 0,
    this.distanceKm = 0,
    this.countries = const [],
    this.places = 0,
  });

  final int days;
  final int photos;
  final int videos;
  final int members;

  /// Local calendar day (from the server's "YYYY-MM-DD", in my time zone).
  final DateTime? mostActiveDay;
  final int mostActiveDayCount;
  final String? topPhotographerId;
  final String? topPhotographerName;
  final int topPhotographerCount;

  // Only filled while the trip map is on.
  final int located;
  final double distanceKm;
  final List<String> countries;
  final int places;

  bool get isEmpty => photos + videos == 0;

  factory TripStats.fromJson(Map<String, dynamic> j) {
    final day = j['mostActiveDay'] as Map?;
    final top = j['topPhotographer'] as Map?;
    DateTime? parseDay(Object? v) {
      final p = v?.toString().split('-');
      if (p == null || p.length != 3) return null;
      final y = int.tryParse(p[0]), m = int.tryParse(p[1]), d = int.tryParse(p[2]);
      return y == null || m == null || d == null ? null : DateTime(y, m, d);
    }

    int n(Object? v) => (v as num?)?.toInt() ?? 0;
    return TripStats(
      days: n(j['days']),
      photos: n(j['photos']),
      videos: n(j['videos']),
      members: n(j['members']),
      mostActiveDay: parseDay(day?['date']),
      mostActiveDayCount: n(day?['count']),
      topPhotographerId: top?['userId'] as String?,
      topPhotographerName: top?['name'] as String?,
      topPhotographerCount: n(top?['count']),
      located: n(j['located']),
      distanceKm: (j['distanceKm'] as num?)?.toDouble() ?? 0,
      countries: ((j['countries'] as List?) ?? const []).map((e) => e.toString()).toList(),
      places: n(j['places']),
    );
  }
}

class TripMapData {
  const TripMapData({required this.enabled, required this.myConsent, required this.stats, required this.points});

  final bool enabled;
  final bool? myConsent;
  final TripStats stats;

  /// Oldest first.
  final List<TripPoint> points;

  factory TripMapData.fromJson(Map<String, dynamic> j) {
    final tm = (j['tripMap'] as Map?) ?? const {};
    final c = tm['myConsent'];
    final points = ((j['points'] as List?) ?? const []).map((p) => TripPoint.fromJson((p as Map).cast<String, dynamic>())).toList()
      ..sort((a, b) => a.takenAt.compareTo(b.takenAt));
    return TripMapData(
      enabled: tm['enabled'] == true,
      myConsent: c is bool ? c : null,
      stats: TripStats.fromJson(((j['stats'] as Map?) ?? const {}).cast<String, dynamic>()),
      points: points,
    );
  }
}

// ---------------------------------------------------------------- helpers

/// Rounds a coordinate to 3 decimals (about 100 m), the most the app sends.
double coarsenCoord(double v) {
  final r = (v * 1000).roundToDouble() / 1000;
  return r == 0 ? 0 : r; // no -0.0
}

const _earthRadiusKm = 6371.0088;

/// Great-circle distance in km (the same formula as the server).
double haversineKm(double lat1, double lng1, double lat2, double lng2) {
  const toRad = math.pi / 180;
  final dLat = (lat2 - lat1) * toRad;
  final dLng = (lng2 - lng1) * toRad;
  final h = math.pow(math.sin(dLat / 2), 2) + math.cos(lat1 * toRad) * math.cos(lat2 * toRad) * math.pow(math.sin(dLng / 2), 2);
  return 2 * _earthRadiusKm * math.asin(math.min(1, math.sqrt(h)));
}

/// The route lines: points in time order, one line per local calendar day.
/// A day with one point has no line and is left out.
List<List<TripPoint>> routeByDay(List<TripPoint> points) {
  final sorted = [...points]..sort((a, b) => a.takenAt.compareTo(b.takenAt));
  final days = <String, List<TripPoint>>{};
  for (final p in sorted) {
    final l = p.takenAt.toLocal();
    days.putIfAbsent('${l.year}-${l.month}-${l.day}', () => []).add(p);
  }
  return [
    for (final d in days.values)
      if (d.length > 1) d,
  ];
}

/// Points that sit close together on screen, shown as one pin.
class TripCluster {
  TripCluster(this.points);

  /// Oldest first.
  final List<TripPoint> points;

  /// The newest photo is the face of the pin.
  TripPoint get cover => points.last;
  int get count => points.length;
  double get lat => points.fold<double>(0, (a, p) => a + p.lat) / points.length;
  double get lng => points.fold<double>(0, (a, p) => a + p.lng) / points.length;
}

/// Groups points that would overlap on screen into one pin: a point joins
/// the first pin whose anchor (its first point, projected with [project] at
/// the current zoom) is closer than [radiusPx]; otherwise it starts a new pin.
/// Stable: the same input gives the same pins, in time order of their first point.
List<TripCluster> clusterPoints(List<TripPoint> points, Offset Function(TripPoint) project, {double radiusPx = 64}) {
  final sorted = [...points]..sort((a, b) => a.takenAt.compareTo(b.takenAt));
  final anchors = <Offset>[];
  final groups = <List<TripPoint>>[];
  for (final p in sorted) {
    final o = project(p);
    var i = 0;
    while (i < anchors.length && (anchors[i] - o).distance >= radiusPx) {
      i++;
    }
    if (i == anchors.length) {
      anchors.add(o);
      groups.add([p]);
    } else {
      groups[i].add(p);
    }
  }
  return [for (final g in groups) TripCluster(g)];
}
