import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Session token in the keychain / keystore.
class SessionStorage {
  static const _key = 'camtrip_session';
  final _secure = const FlutterSecureStorage();
  String? _cache;

  /// Whether the keychain has been read (main() does this before the first
  /// frame, so the auth controller can decide the start screen synchronously).
  bool get loaded => _cache != null;

  /// The token without touching the keychain; only meaningful when [loaded].
  String? get cachedToken => (_cache?.isEmpty ?? true) ? null : _cache;

  Future<String?> token() async {
    _cache ??= await _secure.read(key: _key) ?? '';
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

  /// Last `/me` user JSON, so a signed-in launch shows the albums at once and
  /// refreshes in the background. Cleared on sign-out.
  Map<String, dynamic>? get cachedUser => _json('cache_me');
  set cachedUser(Map<String, dynamic>? v) => _setJson('cache_me', v);

  /// Last `/groups` list, as `{userId, groups: [...]}`.
  Map<String, dynamic>? get cachedGroups => _json('cache_groups');
  set cachedGroups(Map<String, dynamic>? v) => _setJson('cache_groups', v);

  /// My personal roll ("Mijn rolletje") as last sent by the server: {userId, group}.
  Map<String, dynamic>? get cachedPersonalRoll => _json('cache_personal_roll');
  set cachedPersonalRoll(Map<String, dynamic>? v) => _setJson('cache_personal_roll', v);

  Map<String, dynamic>? _json(String key) {
    final raw = _p.getString(key);
    if (raw == null) return null;
    try {
      final v = jsonDecode(raw);
      return v is Map<String, dynamic> ? v : null;
    } catch (_) {
      return null;
    }
  }

  void _setJson(String key, Map<String, dynamic>? v) => v == null ? _p.remove(key) : _p.setString(key, jsonEncode(v));

  /// The app language picked in Settings ("nl", "pt_BR", "zh_Hant"), or null
  /// to follow the phone's language.
  String? get language => _p.getString('language');
  set language(String? v) => v == null ? _p.remove('language') : _p.setString('language', v);

  bool get onboarded => _p.getBool('onboarded') ?? false;
  set onboarded(bool v) => _p.setBool('onboarded', v);

  String? get activeGroupId => _p.getString('active_group');
  set activeGroupId(String? v) => v == null ? _p.remove('active_group') : _p.setString('active_group', v);

  String get cameraStyle => _p.getString('camera_style') ?? 'flash';
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
