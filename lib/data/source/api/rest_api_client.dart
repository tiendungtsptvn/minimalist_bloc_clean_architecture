import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_error.dart';
import 'api_response.dart';

class RestClientBase {
  static const Duration defaultTimeout = Duration(seconds: 15);
  static const String formUrlEncodedContentType = 'application/json;charset=UTF-8';

  RestClientBase(
    this.baseUrl,
    this.interceptors, {
    this.timeout = defaultTimeout,
  }) : _dio = _createDio(baseUrl, timeout) {
    _dio.interceptors.addAll(interceptors);
    // _dio.interceptors.add(RefreshTokenInterceptor(_dio));
  }

  final Dio _dio;
  final String baseUrl;
  final List<Interceptor> interceptors;
  final Duration timeout;

  static Dio _createDio(String baseUrl, Duration timeout) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      contentType: formUrlEncodedContentType,
      responseType: ResponseType.json,
    );
    return Dio(options);
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      ApiResponse res = _mapResponse(response.data);
      return res.data;
    } catch (e) {
      throw _mapError(e);
    }
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    List<String>? mapDataError,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      ApiResponse res = _mapResponse(response.data);
      return res.data;
    } catch (e) {
      throw _mapError(e);
    }
  }

  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.patch<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      ApiResponse res = _mapResponse(response.data);
      return res.data;
    } catch (e) {
      throw _mapError(e);
    }
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      ApiResponse res = _mapResponse(response.data);

      if (res.code != '0') {
        throw response;
      }
      return res.data;
    } catch (e) {
      throw _mapError(e);
    }
  }

  Future<dynamic> delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final Response<dynamic> response = await _dio.delete<dynamic>(path,
          data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);

      ApiResponse res = _mapResponse(response.data);

      if (res.code != '0') {
        throw response;
      }
      return res.data;
    } catch (e) {
      throw _mapError(e);
    }
  }

  ApiError _mapError(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return const ApiError(
              code: 'CONNECT_TIMEOUT', message: 'CONNECT_TIMEOUT (timeout)', data: '');
        case DioExceptionType.sendTimeout:
          return const ApiError(
              code: 'SEND_TIMEOUT', message: 'SEND_TIMEOUT (send timeout)', data: '');
        case DioExceptionType.receiveTimeout:
          return const ApiError(
              code: 'RECEIVE_TIMEOUT', message: 'RECEIVE_TIMEOUT (receive timeout)', data: '');
        case DioExceptionType.cancel:
          return const ApiError(code: 'CANCEL', message: 'CANCEL (cancel)', data: '');
        case DioExceptionType.unknown:
          // https://github.com/flutterchina/dio/issues/817
          return const ApiError(
            code: 'unknown',
            message: 'unknown',
            data: '',
          );
        default:
          return ApiError(
            code: '${e.error}',
            message: '${e.message}',
          );
      }
    }
    return ApiError(code: '${e.code}', message: '${e.message}', data: '${e.data}');
  }

  ApiResponse _mapResponse(dynamic response) {
    if (response is String) {
      response = jsonDecode(response);
    }

    return ApiResponse.fromJson(response);
  }
}
