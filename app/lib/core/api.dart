import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import 'config.dart';
import 'storage.dart';

/// A failed API call, with a message in the app's language ready for a snackbar.
class ApiException implements Exception {
  ApiException(this.message, {this.status, this.code, this.data});
  final String message;
  final int? status;
  final String? code;

  /// The error body's other fields (e.g. {limit, used} with roll_full).
  final Map<String, dynamic>? data;

  /// The free roll is full here (402 roll_full).
  bool get isRollFull => code == 'roll_full';

  bool get isOffline => status == null;
  bool get isUnauthorized => status == 401;

  /// Blocked by CamTrip ("Beheer"): sign-in and every call are refused.
  bool get isBanned => code == 'account_banned';

  @override
  String toString() => message;

  static ApiException from(Object e) {
    if (e is ApiException) return e;
    final l = L10n.current;
    if (e is DioException) {
      final data = e.response?.data;
      final status = e.response?.statusCode;
      if (data is Map && data['error'] is String) {
        final code = data['code'] as String?;
        return ApiException(localizeServerError(code, data['error'] as String),
            status: status, code: code, data: Map<String, dynamic>.from(data));
      }
      if (status == null) return ApiException(l.errorOffline);
      return ApiException(l.errorSomethingWrongStatus(status), status: status);
    }
    return ApiException(l.errorSomethingWrong);
  }
}

/// The API answers in Dutch ({error, code}). Known codes, and the most common
/// messages without a code, are shown in the app's language; anything else
/// falls back to the server's own text.
String localizeServerError(String? code, String serverMessage) {
  final l = L10n.current;
  switch (code) {
    case 'invalid_credentials':
      return l.apiInvalidCredentials;
    case 'invalid_code':
      return serverMessage.contains('6 cijfers') ? l.validationCodeDigits : l.apiInvalidCode;
    case 'email_taken':
      if (serverMessage.contains('met Apple')) return l.apiEmailTakenProvider('Apple');
      if (serverMessage.contains('met Google')) return l.apiEmailTakenProvider('Google');
      return l.apiEmailTaken;
    case 'invalid_email':
      return serverMessage.startsWith('Vul') ? l.validationEmailRequired : l.validationEmailInvalid;
    case 'weak_password':
      return serverMessage.contains('te lang') ? l.validationPasswordTooLong : l.apiWeakPassword(8);
    case 'invalid_name':
      return serverMessage.startsWith('Vul') ? l.validationNameRequired : l.apiNameTooLong(40);
    case 'rate_limited':
      return l.apiRateLimited;
    case 'account_banned':
      return l.apiAccountBanned('support@camtrip.app');
    case 'pro_required':
      return l.apiProRequired;
    case 'archived':
      return l.apiGroupClosed;
    case 'not_found':
      return l.apiGroupCodeNotFound;
    case 'group_full':
    case 'member_limit':
      final max = RegExp(r'max\. (\d+)').firstMatch(serverMessage)?.group(1);
      return l.apiGroupFull(int.tryParse(max ?? '') ?? 10);
    case 'last_member':
      return l.apiLastMember;
    case 'admin_required':
      return l.apiAdminRequired;
    case 'upload_incomplete':
      return l.apiUploadIncomplete;
    case 'roll_full':
      return l.apiRollFull(int.tryParse(RegExp(r'/(\d+)\)').firstMatch(serverMessage)?.group(1) ?? '') ?? 24);
    case 'trip_pass_exists':
      return l.apiTripPassExists;
    case 'trip_pass_used':
    case 'trip_pass_refunded':
    case 'trip_pass_not_found':
      return l.apiTripPassFailed;
  }
  return switch (serverMessage) {
    'Er ging iets mis' => l.errorSomethingWrong,
    'Ongeldige invoer' => l.apiInvalidInput,
    'Niet ingelogd' => l.apiNotSignedIn,
    'Account bestaat niet meer' => l.apiAccountGone,
    'Foto niet gevonden' => l.apiPhotoNotFound,
    'Groep niet gevonden' => l.apiGroupNotFound,
    'Lid niet gevonden' => l.apiMemberNotFound,
    'Persoon niet gevonden' => l.apiPersonNotFound,
    'Gebruiker niet gevonden' => l.apiUserNotFound,
    'Geen groep gevonden met deze code' => l.apiGroupCodeNotFound,
    'Deze groep is afgesloten' => l.apiGroupClosed,
    'Alleen de beheerder kan dit doen' => l.apiAdminOnly,
    'Je kunt jezelf niet blokkeren' => l.apiCannotBlockSelf,
    'Je kunt je eigen foto niet rapporteren' => l.apiCannotReportOwn,
    'Je kunt alleen je eigen foto’s verwijderen' => l.apiDeleteOwnOnly,
    'De maker van de groep kan niet verwijderd worden' => l.apiOwnerCannotBeRemoved,
    'De maker blijft beheerder' => l.apiOwnerStaysAdmin,
    'Een groep heeft minstens één beheerder nodig' => l.apiNeedsOneAdmin,
    'Einddatum ligt voor de begindatum' => l.apiEndBeforeStart,
    'Een groep die altijd open is heeft geen einddatum' => l.apiPermanentNoEndDate,
    'Inloggen met Apple is mislukt' => l.signInAppleFailed,
    'Inloggen met Google is mislukt' => l.signInGoogleFailed,
    'Een beheerder kan niet geblokkeerd worden' => l.apiCannotBanAdmin,
    'Melding niet gevonden' => l.apiReportNotFound,
    'De maker van deze foto is niet meer bekend' => l.apiPhotoOwnerUnknown,
    _ => serverMessage,
  };
}

class Api {
  Api(this._storage, {this.onUnauthorized}) {
    dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Accept': 'application/json'},
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.token();
        if (token != null) options.headers['Authorization'] = 'Bearer $token';
        handler.next(options);
      },
      onError: (e, handler) {
        final data = e.response?.data;
        final banned = data is Map && data['code'] == 'account_banned';
        if (e.response?.statusCode == 401 || banned) onUnauthorized?.call();
        handler.next(e);
      },
    ));
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: false, responseBody: false));
    }
  }

  final SessionStorage _storage;
  final void Function()? onUnauthorized;
  late final Dio dio;

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) => _wrap(() => dio.get(path, queryParameters: query));
  Future<Map<String, dynamic>> post(String path, [Object? data]) => _wrap(() => dio.post(path, data: data ?? {}));
  Future<Map<String, dynamic>> patch(String path, Object data) => _wrap(() => dio.patch(path, data: data));
  Future<Map<String, dynamic>> put(String path, Object data) => _wrap(() => dio.put(path, data: data));
  Future<Map<String, dynamic>> delete(String path, [Object? data]) => _wrap(() => dio.delete(path, data: data));

  Future<Map<String, dynamic>> _wrap(Future<Response<dynamic>> Function() call) async {
    try {
      final res = await call();
      final data = res.data;
      return data is Map<String, dynamic> ? data : <String, dynamic>{};
    } catch (e) {
      throw ApiException.from(e);
    }
  }

  /// Uploads a file to a presigned R2 URL (no auth header: the URL is the auth).
  static final Dio _raw = Dio(BaseOptions(connectTimeout: const Duration(seconds: 20), receiveTimeout: const Duration(minutes: 10)));

  static Future<void> putFile(String url, List<int> bytes, String contentType, {void Function(int, int)? onProgress}) async {
    try {
      await _raw.put(
        url,
        data: Stream.fromIterable([bytes]),
        options: Options(headers: {Headers.contentLengthHeader: bytes.length, Headers.contentTypeHeader: contentType}),
        onSendProgress: onProgress,
      );
    } catch (e) {
      throw ApiException.from(e);
    }
  }

  static Future<void> download(String url, String savePath, {void Function(int, int)? onProgress}) async {
    try {
      await _raw.download(url, savePath, onReceiveProgress: onProgress);
    } catch (e) {
      throw ApiException.from(e);
    }
  }
}

final sessionStorageProvider = Provider((ref) => SessionStorage());

/// Set by the auth controller so a 401 anywhere signs the user out.
class UnauthorizedHandler {
  void Function()? callback;
}

final unauthorizedHandlerProvider = Provider((ref) => UnauthorizedHandler());

final apiProvider = Provider((ref) => Api(
      ref.watch(sessionStorageProvider),
      onUnauthorized: () => ref.read(unauthorizedHandlerProvider).callback?.call(),
    ));
