import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Soft shutter click and capture haptic, both optional per the settings.
///
/// The click plays as a UI sound: iOS "ambient" category (muted by the ring /
/// silent switch, mixes with the user's music), Android sonification usage
/// without audio focus (follows the system / ringer volume, so silent and
/// vibrate mode keep it quiet).
class ShutterFeedback {
  static const asset = 'sounds/shutter_click.wav';

  AudioPlayer? _player;
  bool _ready = false;

  static final _context = AudioContext(
    iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
    android: const AudioContextAndroid(
      contentType: AndroidContentType.sonification,
      usageType: AndroidUsageType.assistanceSonification,
      audioFocus: AndroidAudioFocus.none,
    ),
  );

  /// Loads the click so the first shot plays without delay.
  Future<void> prepare() async {
    if (_ready) return;
    try {
      final p = _player ??= AudioPlayer(playerId: 'camtrip_shutter');
      await p.setAudioContext(_context);
      await p.setPlayerMode(PlayerMode.lowLatency);
      await p.setReleaseMode(ReleaseMode.stop);
      await p.setSource(AssetSource(asset));
      await p.setVolume(0.6);
      _ready = true;
    } catch (e) {
      debugPrint('shutter sound unavailable: $e');
    }
  }

  Future<void> click() async {
    try {
      if (!_ready) await prepare();
      final p = _player;
      if (p == null || !_ready) return;
      await p.stop();
      await p.resume();
    } catch (e) {
      debugPrint('shutter sound failed: $e');
    }
  }

  void haptic() => HapticFeedback.mediumImpact();

  void dispose() {
    _player?.dispose();
    _player = null;
    _ready = false;
  }
}
