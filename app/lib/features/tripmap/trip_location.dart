import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../groups/groups_controller.dart';
import 'trip_map_controller.dart';
import 'trip_map_data.dart';

/// Reiskaart location capture. Privacy rules:
/// - Photos and videos never carry a location: processor.dart and
///   video_processor.dart strip all metadata, also with the map on.
/// - The phone's location is read only when the group's trip map is on AND
///   I said yes for this group, at low accuracy ("when in use" permission).
/// - It is rounded to ~100 m here (and again on the server) and sent as two
///   separate fields on upload init.

/// A coarse location, rounded to 3 decimals (~100 m).
class TripLatLng {
  TripLatLng(double lat, double lng)
      : lat = coarsenCoord(lat),
        lng = coarsenCoord(lng);
  final double lat;
  final double lng;
}

/// The device side, swappable in tests.
abstract class TripLocator {
  /// Asks for "when in use" location access if needed. True when granted.
  Future<bool> ensurePermission();

  /// The current position, or null (no permission, no fix in time, ...). Never asks.
  Future<TripLatLng?> current();
}

class GeolocatorTripLocator implements TripLocator {
  const GeolocatorTripLocator();

  /// A fix this recent is good enough: saves battery and time per shot.
  static const _maxAge = Duration(minutes: 2);

  static bool _granted(LocationPermission p) => p == LocationPermission.whileInUse || p == LocationPermission.always;

  @override
  Future<bool> ensurePermission() async {
    try {
      var p = await Geolocator.checkPermission();
      if (p == LocationPermission.denied) p = await Geolocator.requestPermission();
      return _granted(p);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<TripLatLng?> current() async {
    try {
      if (!_granted(await Geolocator.checkPermission())) return null;
      if (!await Geolocator.isLocationServiceEnabled()) return null;
      final last = await Geolocator.getLastKnownPosition();
      if (last != null && DateTime.now().difference(last.timestamp) < _maxAge) return TripLatLng(last.latitude, last.longitude);
      // Low accuracy is plenty for ~100 m and works with iOS "approximate location".
      final p = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.low, timeLimit: Duration(seconds: 6)),
      );
      return TripLatLng(p.latitude, p.longitude);
    } catch (_) {
      return null;
    }
  }
}

final tripLocatorProvider = Provider<TripLocator>((_) => const GeolocatorTripLocator());

final tripLocationProvider = Provider((ref) => TripLocation(ref));

class TripLocation {
  TripLocation(this._ref);
  final Ref _ref;

  /// Where a photo just taken in [groupId] was made, or null when the map is
  /// off for the group, I did not say yes, or there is no fix.
  Future<TripLatLng?> forCapture(String groupId) async {
    final g = _ref.read(groupProvider(groupId));
    if (g == null || g.isPersonal || !g.tripMap.sharesLocation) return null;
    return _ref.read(tripLocatorProvider).current();
  }
}

/// Groups for which the consent question is on screen right now (no double prompts).
final _asking = <String>{};

/// Before the first photo in a group with the trip map on: "Deel waar je
/// foto's gemaakt zijn op de reiskaart van deze groep?" Ja / Nee. Asked once
/// per group; the answer can be changed in the group settings.
Future<void> askTripMapConsentIfNeeded(BuildContext context, WidgetRef ref, Group group) async {
  final g = ref.read(groupProvider(group.id)) ?? group;
  if (g.isPersonal || !g.tripMap.needsConsent || _asking.contains(g.id)) return;
  _asking.add(g.id);
  try {
    final yes = await showTripMapConsentDialog(context);
    if (yes == null || !context.mounted) return;
    await setTripMapConsent(context, ref, g.id, yes);
  } finally {
    _asking.remove(g.id);
  }
}

/// Saves my answer; for yes also asks the phone for location access.
Future<void> setTripMapConsent(BuildContext context, WidgetRef ref, String groupId, bool yes) async {
  try {
    await ref.read(tripMapActionsProvider).setConsent(groupId, yes);
  } catch (e) {
    if (context.mounted) showMessage(context, ApiException.from(e).message);
    return;
  }
  if (!yes) return;
  final granted = await ref.read(tripLocatorProvider).ensurePermission();
  if (!granted && context.mounted) showMessage(context, context.l10n.tripMapLocationDenied);
}

/// The consent question. true = Ja, false = Nee.
Future<bool?> showTripMapConsentDialog(BuildContext context) {
  final l = context.l10n;
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (c) => AlertDialog(
      icon: const Icon(Icons.map_outlined, color: CT.accent, size: 30),
      title: Text(l.tripMapConsentTitle, style: CT.title(20), textAlign: TextAlign.center),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(l.tripMapConsentQuestion, style: CT.text(15, weight: FontWeight.w500), textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Text(l.tripMapConsentDetail, style: CT.text(13, color: CT.muted), textAlign: TextAlign.center),
      ]),
      actions: [
        TextButton(
          key: const Key('tripmap-consent-no'),
          onPressed: () => Navigator.pop(c, false),
          child: Text(l.tripMapConsentNo, style: CT.text(15, color: CT.muted)),
        ),
        TextButton(
          key: const Key('tripmap-consent-yes'),
          onPressed: () => Navigator.pop(c, true),
          child: Text(l.tripMapConsentYes, style: CT.text(15, color: CT.accent, weight: FontWeight.w600)),
        ),
      ],
    ),
  );
}
