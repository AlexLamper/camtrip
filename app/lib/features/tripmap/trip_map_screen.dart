import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../gallery/gallery_controller.dart';
import '../groups/groups_controller.dart';
import 'trip_map_controller.dart';
import 'trip_map_data.dart';
import 'trip_tiles.dart';

/// Builds the picture inside a map pin (tests and previews swap it).
typedef TripThumbBuilder = Widget Function(TripPoint point);

/// "Reiskaart + statistieken" (route /group/:id/map): trip stats for every
/// group, and a map of where the photos were taken while the trip map is on.
class TripMapScreen extends ConsumerWidget {
  const TripMapScreen({super.key, required this.groupId, this.tileProvider, this.thumbBuilder});
  final String groupId;

  /// Tests and previews pass a fake tile source; the app uses the network.
  final TileProvider? tileProvider;
  final TripThumbBuilder? thumbBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final group = ref.watch(groupProvider(groupId));
    final data = ref.watch(tripMapProvider(groupId));
    return Scaffold(
      appBar: AppBar(title: Text(l.tripMapTitle)),
      body: data.when(
        loading: () => const Center(child: CircularProgressIndicator(color: CT.ink)),
        error: (e, _) => EmptyState(
          title: l.tripMapLoadFailed,
          message: ApiException.from(e).message,
          action: SizedBox(width: 200, child: CTButton(l.retry, onTap: () => ref.invalidate(tripMapProvider(groupId)))),
        ),
        data: (d) {
          final names = {for (final m in group?.members ?? const <Member>[]) m.id: m.name};
          final stats = TripStatsCard(stats: d.stats, mapOn: d.enabled, memberNames: names);
          if (!d.enabled || d.points.isEmpty) {
            return RefreshIndicator(
              color: CT.ink,
              onRefresh: () => ref.refresh(tripMapProvider(groupId).future),
              child: ListView(padding: const EdgeInsets.fromLTRB(18, 4, 18, 40), children: [
                stats,
                const SizedBox(height: 16),
                if (group != null) _MapPlaceholder(group: group, data: d),
              ]),
            );
          }
          return Column(children: [
            Padding(padding: const EdgeInsets.fromLTRB(18, 4, 18, 12), child: stats),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 12 + MediaQuery.of(context).padding.bottom),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TripMapView(
                    points: d.points,
                    tileProvider: tileProvider,
                    thumbBuilder: thumbBuilder,
                    onOpen: (p) => openTripPhoto(context, ref, groupId, p.photoId),
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}

/// Opens a photo from the map in the viewer. The viewer pages through the
/// gallery's loaded photos, so older pages are loaded until the photo is in.
Future<void> openTripPhoto(BuildContext context, WidgetRef ref, String groupId, String photoId) async {
  final provider = galleryProvider(groupId);
  GalleryState s() => ref.read(provider);
  final ctrl = ref.read(provider.notifier);
  if (s().filter != const GalleryFilter.all() && !s().photos.any((p) => p.id == photoId)) {
    await ctrl.setFilter(const GalleryFilter.all());
  }
  for (var tries = 0; tries < 60 && !s().photos.any((p) => p.id == photoId); tries++) {
    if (s().loading) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
    } else if (s().hasMore) {
      await ctrl.loadMore();
    } else {
      break;
    }
  }
  final i = s().photos.indexWhere((p) => p.id == photoId);
  if (context.mounted) context.push('/group/$groupId/photo/$photoId', extra: i >= 0 ? i : null);
}

// ---------------------------------------------------------------- stats

class TripStatsCard extends StatelessWidget {
  const TripStatsCard({super.key, required this.stats, required this.mapOn, this.memberNames = const {}});
  final TripStats stats;
  final bool mapOn;
  final Map<String, String> memberNames;

  static String km(double v, String locale) =>
      NumberFormat.decimalPatternDigits(locale: locale, decimalDigits: v < 100 && v != v.roundToDouble() ? 1 : 0).format(v);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final locale = L10n.intlLocale;
    String n(num v) => NumberFormat.decimalPattern(locale).format(v);
    final tiles = <(String, String)>[
      (n(stats.days), l.tripMapStatDays),
      (n(stats.photos), l.tripMapStatPhotos),
      if (mapOn) ...[
        (km(stats.distanceKm, locale), l.tripMapStatDistance),
        (n(stats.countries.length), l.tripMapStatCountries),
        (n(stats.places), l.tripMapStatPlaces),
        (n(stats.members), l.tripMapStatMembers),
      ] else ...[
        (n(stats.videos), l.tripMapStatVideos),
        (n(stats.members), l.tripMapStatMembers),
      ],
    ];
    final top = stats.topPhotographerId == null
        ? null
        : (memberNames[stats.topPhotographerId] ?? stats.topPhotographerName ?? l.memberFallbackName);
    final perRow = mapOn ? 3 : 4;
    return Container(
      key: const Key('tripmap-stats'),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(18), boxShadow: CT.cardShadow),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        for (var r = 0; r < tiles.length; r += perRow) ...[
          if (r > 0) const SizedBox(height: 10),
          Row(children: [
            for (final t in tiles.sublist(r, math.min(r + perRow, tiles.length)))
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  FittedBox(fit: BoxFit.scaleDown, child: Text(t.$1, style: CT.title(24))),
                  const SizedBox(height: 2),
                  Text(t.$2, style: CT.text(11.5, color: CT.muted), maxLines: 1, overflow: TextOverflow.ellipsis),
                ]),
              ),
          ]),
        ],
        if (stats.mostActiveDay != null || top != null) ...[
          const Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider(height: 1, color: CT.line)),
          if (stats.mostActiveDay != null)
            _line(Icons.calendar_today_outlined, l.tripMapBusiestDay(Fmt.dayInline(stats.mostActiveDay!), stats.mostActiveDayCount)),
          if (stats.mostActiveDay != null && top != null) const SizedBox(height: 6),
          if (top != null) _line(Icons.camera_alt_outlined, l.tripMapTopPhotographer(top, stats.topPhotographerCount)),
        ],
      ]),
    );
  }

  Widget _line(IconData icon, String text) => Row(children: [
        Icon(icon, size: 16, color: CT.accent),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: CT.text(13, weight: FontWeight.w500))),
      ]);
}

/// Shown instead of the map: the map is off (admins can switch it on), or no
/// located photos yet.
class _MapPlaceholder extends ConsumerWidget {
  const _MapPlaceholder({required this.group, required this.data});
  final Group group;
  final TripMapData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final off = !data.enabled;
    if (group.isPersonal) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: CT.cream.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(18)),
      child: Column(children: [
        const Icon(Icons.map_outlined, size: 34, color: CT.muted),
        const SizedBox(height: 10),
        Text(off ? l.tripMapOffTitle : l.tripMapEmptyTitle, style: CT.title(18), textAlign: TextAlign.center),
        const SizedBox(height: 6),
        Text(
          off ? (group.isAdmin ? l.tripMapOffMessageAdmin : l.tripMapOffMessage) : l.tripMapEmptyMessage,
          style: CT.text(13.5, color: CT.muted),
          textAlign: TextAlign.center,
        ),
        if (off && group.isAdmin) ...[
          const SizedBox(height: 14),
          CTButton(l.tripMapEnable, kind: CTButtonKind.primary, icon: Icons.map_outlined, onTap: () async {
            try {
              await ref.read(tripMapActionsProvider).setEnabled(group.id, true);
            } catch (e) {
              if (context.mounted) showMessage(context, ApiException.from(e).message);
            }
          }),
        ],
      ]),
    );
  }
}

// ---------------------------------------------------------------- map

/// The interactive map: cream basemap, a route line per day, clustered photo pins.
class TripMapView extends StatefulWidget {
  const TripMapView({super.key, required this.points, required this.onOpen, this.tileProvider, this.thumbBuilder});
  final List<TripPoint> points;
  final void Function(TripPoint point) onOpen;
  final TileProvider? tileProvider;
  final TripThumbBuilder? thumbBuilder;

  @override
  State<TripMapView> createState() => _TripMapViewState();
}

class _TripMapViewState extends State<TripMapView> {
  final _map = MapController();

  @override
  void dispose() {
    _map.dispose();
    super.dispose();
  }

  void _tap(TripCluster c) {
    if (c.count == 1) return widget.onOpen(c.cover);
    final camera = _map.camera;
    final coords = [for (final p in c.points) LatLng(p.lat, p.lng)];
    final spread = coords.any((x) => x != coords.first);
    if (!spread || camera.zoom >= TripTiles.maxZoom - 0.5) return widget.onOpen(c.cover);
    _map.fitCamera(CameraFit.coordinates(
      coordinates: coords,
      padding: const EdgeInsets.all(80),
      maxZoom: math.min(TripTiles.maxZoom, camera.zoom + 4),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final coords = [for (final p in widget.points) LatLng(p.lat, p.lng)];
    final routes = routeByDay(widget.points);
    return FlutterMap(
      mapController: _map,
      options: MapOptions(
        backgroundColor: CT.cream,
        initialCenter: coords.isEmpty ? const LatLng(52.1, 5.1) : coords.last,
        initialZoom: 5,
        initialCameraFit: coords.isEmpty
            ? null
            : CameraFit.coordinates(coordinates: coords, padding: const EdgeInsets.fromLTRB(56, 64, 56, 56), maxZoom: 14),
        minZoom: 2,
        maxZoom: TripTiles.maxZoom,
        interactionOptions: const InteractionOptions(flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
      ),
      children: [
        TripTiles.layer(tileProvider: widget.tileProvider, retina: RetinaMode.isHighDensity(context)),
        PolylineLayer(polylines: [
          // The whole trip in time order, light and dotted: connects the days.
          if (coords.length > 1)
            Polyline(
              points: coords,
              color: CT.ink.withValues(alpha: 0.35),
              strokeWidth: 2.5,
              pattern: const StrokePattern.dotted(spacingFactor: 2),
            ),
          // Each day's route, solid.
          for (final day in routes)
            Polyline(
              points: [for (final p in day) LatLng(p.lat, p.lng)],
              color: CT.accent.withValues(alpha: 0.8),
              strokeWidth: 3,
              borderColor: Colors.white.withValues(alpha: 0.9),
              borderStrokeWidth: 1.5,
              strokeCap: StrokeCap.round,
              strokeJoin: StrokeJoin.round,
            ),
        ]),
        _ClusterLayer(points: widget.points, onTap: _tap, thumbBuilder: widget.thumbBuilder),
        TripTiles.attribution(),
      ],
    );
  }
}

class _ClusterLayer extends StatelessWidget {
  const _ClusterLayer({required this.points, required this.onTap, this.thumbBuilder});
  final List<TripPoint> points;
  final void Function(TripCluster) onTap;
  final TripThumbBuilder? thumbBuilder;

  static const _size = 58.0;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);
    final clusters = clusterPoints(points, (p) => camera.projectAtZoom(LatLng(p.lat, p.lng)), radiusPx: _size + 6);
    return MarkerLayer(
      markers: [
        for (final c in clusters)
          Marker(
            key: ValueKey('tripmap-pin-${c.cover.photoId}'),
            point: LatLng(c.lat, c.lng),
            width: _size + 12,
            height: _size + 12,
            child: GestureDetector(onTap: () => onTap(c), child: TripPin(cluster: c, thumbBuilder: thumbBuilder, size: _size)),
          ),
      ],
    );
  }
}

/// A small instant print with the photo, and the number of photos when it stands for more.
class TripPin extends StatelessWidget {
  const TripPin({super.key, required this.cluster, this.thumbBuilder, this.size = 58});
  final TripCluster cluster;
  final TripThumbBuilder? thumbBuilder;
  final double size;

  @override
  Widget build(BuildContext context) {
    final p = cluster.cover;
    final thumb = thumbBuilder?.call(p) ??
        (p.thumbUrl.isEmpty ? Container(color: CT.cream) : NetPhoto(p.thumbUrl, cacheKey: 'thumb_${p.photoId}'));
    return Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
      Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9), boxShadow: CT.printShadow),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(fit: StackFit.expand, children: [
            thumb,
            if (p.isVideo) const Align(alignment: Alignment.bottomLeft, child: Padding(padding: EdgeInsets.all(2), child: Icon(Icons.play_circle_fill, size: 14, color: Colors.white))),
          ]),
        ),
      ),
      if (cluster.count > 1)
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            constraints: const BoxConstraints(minWidth: 22),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(11), border: Border.all(color: Colors.white, width: 1.5)),
            child: Text('${cluster.count}', textAlign: TextAlign.center, style: CT.text(11, color: Colors.white, weight: FontWeight.w700, height: 1.2)),
          ),
        ),
    ]);
  }
}
