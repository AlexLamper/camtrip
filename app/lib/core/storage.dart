import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Session token in the keychain / keystore.
class SessionStorage {
  static const _key = 'camtrip_session';
  final _secure = const FlutterSecureStorage();
  String? _cache;

  Future<String?> token() async {
    _cache ??= await _secure.read(key: _key);
    return (_cache?.isEmpty ?? true) ? null : _cache;
  }

  Future<void> save(String token) async {
    _cache = token;
    await _secure.write(key: _key, value: token);
  }

  Future<void> clear() async {
    _cache = '';
    await _secure.delete(key: _key);
  }
}

/// Small device preferences.
class Prefs {
  Prefs(this._p);
  final SharedPreferences _p;

  static Future<Prefs> load() async => Prefs(await SharedPreferences.getInstance());

  bool get onboarded => _p.getBool('onboarded') ?? false;
  set onboarded(bool v) => _p.setBool('onboarded', v);

  String? get activeGroupId => _p.getString('active_group');
  set activeGroupId(String? v) => v == null ? _p.remove('active_group') : _p.setString('active_group', v);

  String get cameraStyle => _p.getString('camera_style') ?? 'instant';
  set cameraStyle(String v) => _p.setString('camera_style', v);

  bool get dateStamp => _p.getBool('date_stamp') ?? true;
  set dateStamp(bool v) => _p.setBool('date_stamp', v);

  bool get saveOwnToAlbum => _p.getBool('save_own') ?? true;
  set saveOwnToAlbum(bool v) => _p.setBool('save_own', v);

  bool get autoSaveOthers => _p.getBool('auto_save_others') ?? false;
  set autoSaveOthers(bool v) => _p.setBool('auto_save_others', v);

  bool get wifiOnly => _p.getBool('wifi_only') ?? false;
  set wifiOnly(bool v) => _p.setBool('wifi_only', v);

  bool get videosWifiOnly => _p.getBool('videos_wifi_only') ?? true;
  set videosWifiOnly(bool v) => _p.setBool('videos_wifi_only', v);

  String get flashMode => _p.getString('flash') ?? 'auto';
  set flashMode(String v) => _p.setString('flash', v);

  /// Photo ids already saved to the album by "auto-save others", per device.
  Set<String> get autoSaved => (_p.getStringList('auto_saved') ?? const []).toSet();
  void markAutoSaved(Iterable<String> ids) {
    final all = {...autoSaved, ...ids};
    // keep the list bounded
    final list = all.toList();
    _p.setStringList('auto_saved', list.length > 5000 ? list.sublist(list.length - 5000) : list);
  }
}
