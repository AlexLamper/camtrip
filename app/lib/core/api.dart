import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config.dart';
import 'storage.dart';

/// A failed API call, with the server's Dutch message ready for a snackbar.
class ApiException implements Exception {
  ApiException(this.message, {this.status, this.code});
  final String message;
  final int? status;
  final String? code;

  bool get isOffline => status == null;
  bool get isUnauthorized => status == 401;

  @override
  String toString() => message;

  static ApiException from(Object e) {
    if (e is ApiException) return e;
    if (e is DioException) {
      final data = e.response?.data;
      final status = e.response?.statusCode;
      if (data is Map && data['error'] is String) {
        return ApiException(data['error'] as String, status: status, code: data['code'] as String?);
      }
      if (status == null) return ApiException('Geen verbinding. Probeer het zo nog eens.');
      return ApiException('Er ging iets mis ($status)', status: status);
    }
    return ApiException('Er ging iets mis');
  }
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
        if (e.response?.statusCode == 401) onUnauthorized?.call();
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
