import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Self-timer options in the camera's settings sheet.
enum ShutterTimer {
  off(0),
  three(3),
  ten(10);

  const ShutterTimer(this.seconds);
  final int seconds;

  static ShutterTimer fromSeconds(int? s) => values.firstWhere((t) => t.seconds == s, orElse: () => off);
}

/// Capture resolution. Standard keeps files and processing light; high asks
/// the sensor for everything it has (the processor caps at 3200 px anyway).
enum CaptureQuality {
  standard(ResolutionPreset.veryHigh),
  high(ResolutionPreset.max);

  const CaptureQuality(this.preset);
  final ResolutionPreset preset;

  static CaptureQuality byName(String? n) => values.firstWhere((q) => q.name == n, orElse: () => high);
}

/// Per-device camera preferences, edited in the "..." sheet.
@immutable
class CameraSettings {
  const CameraSettings({
    this.grid = false,
    this.haptics = true,
    this.dateStamp = true,
    this.sound = false,
    this.timer = ShutterTimer.off,
    this.mirrorSelfies = true,
    this.saveToRoll = true,
    this.quality = CaptureQuality.high,
  });

  final bool grid;
  final bool haptics;
  final bool dateStamp;
  final bool sound;
  final ShutterTimer timer;
  final bool mirrorSelfies;
  final bool saveToRoll;
  final CaptureQuality quality;

  CameraSettings copyWith({
    bool? grid,
    bool? haptics,
    bool? dateStamp,
    bool? sound,
    ShutterTimer? timer,
    bool? mirrorSelfies,
    bool? saveToRoll,
    CaptureQuality? quality,
  }) =>
      CameraSettings(
        grid: grid ?? this.grid,
        haptics: haptics ?? this.haptics,
        dateStamp: dateStamp ?? this.dateStamp,
        sound: sound ?? this.sound,
        timer: timer ?? this.timer,
        mirrorSelfies: mirrorSelfies ?? this.mirrorSelfies,
        saveToRoll: saveToRoll ?? this.saveToRoll,
        quality: quality ?? this.quality,
      );

  @override
  bool operator ==(Object other) =>
      other is CameraSettings &&
      other.grid == grid &&
      other.haptics == haptics &&
      other.dateStamp == dateStamp &&
      other.sound == sound &&
      other.timer == timer &&
      other.mirrorSelfies == mirrorSelfies &&
      other.saveToRoll == saveToRoll &&
      other.quality == quality;

  @override
  int get hashCode => Object.hash(grid, haptics, dateStamp, sound, timer, mirrorSelfies, saveToRoll, quality);
}

/// Reads and writes [CameraSettings] in shared preferences.
///
/// The date stamp and "save to camera roll" use the same keys as [Prefs]
/// (`date_stamp`, `save_own`), so the app's settings screen and the camera
/// sheet always agree.
class CameraSettingsStore {
  CameraSettingsStore(this._p);
  final SharedPreferences _p;

  static Future<CameraSettingsStore> load() async => CameraSettingsStore(await SharedPreferences.getInstance());

  static const kGrid = 'cam_grid';
  static const kHaptics = 'cam_haptics';
  static const kDateStamp = 'date_stamp';
  static const kSound = 'cam_sound';
  static const kTimer = 'cam_timer';
  static const kMirror = 'cam_mirror_selfies';
  static const kSaveToRoll = 'save_own';
  static const kQuality = 'cam_quality';

  CameraSettings read() {
    const d = CameraSettings();
    return CameraSettings(
      grid: _p.getBool(kGrid) ?? d.grid,
      haptics: _p.getBool(kHaptics) ?? d.haptics,
      dateStamp: _p.getBool(kDateStamp) ?? d.dateStamp,
      sound: _p.getBool(kSound) ?? d.sound,
      timer: ShutterTimer.fromSeconds(_p.getInt(kTimer)),
      mirrorSelfies: _p.getBool(kMirror) ?? d.mirrorSelfies,
      saveToRoll: _p.getBool(kSaveToRoll) ?? d.saveToRoll,
      quality: CaptureQuality.byName(_p.getString(kQuality)),
    );
  }

  Future<void> write(CameraSettings s) async {
    await Future.wait([
      _p.setBool(kGrid, s.grid),
      _p.setBool(kHaptics, s.haptics),
      _p.setBool(kDateStamp, s.dateStamp),
      _p.setBool(kSound, s.sound),
      _p.setInt(kTimer, s.timer.seconds),
      _p.setBool(kMirror, s.mirrorSelfies),
      _p.setBool(kSaveToRoll, s.saveToRoll),
      _p.setString(kQuality, s.quality.name),
    ]);
  }
}

/// What the processor needs to know about a shot, derived from the settings.
@immutable
class PhotoProcessOptions {
  const PhotoProcessOptions({required this.showDateStamp, required this.dateStamp, required this.mirror});
  final bool showDateStamp;
  final String dateStamp;
  final bool mirror;

  /// [stampText] is the formatted date for the shot (e.g. `Fmt.stamp(takenAt)`).
  /// Front-camera captures are unmirrored by the sensor while the preview is
  /// mirrored; "mirror selfies" makes the photo match what you saw.
  factory PhotoProcessOptions.from(CameraSettings s, {required bool frontCamera, required String stampText}) =>
      PhotoProcessOptions(showDateStamp: s.dateStamp, dateStamp: stampText, mirror: frontCamera && s.mirrorSelfies);
}
