
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/utils/json_response_converter.dart';

class DioInstance {
  static Dio init({
    bool requireAuth = true,
    ResponseType? responseType = ResponseType.json,
    String? token,
  }) {
    Dio dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(minutes: 60),
      receiveTimeout: const Duration(minutes: 60),
      responseType: responseType,
    );
    dio.interceptors.addAll([
      interceptorsWrapper(),
      JsonResponseConverter(),
    ]);

    return dio;
  }

  static InterceptorsWrapper interceptorsWrapper() => InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('-- onRequest interceptor --');
          debugPrint('options.baseUrl: ${options.baseUrl}');
          debugPrint('options.uri: ${options.uri}');
          debugPrint('options.path: ${options.path}');
          debugPrint('options.method: ${options.method}');
          debugPrint(
              'options.queryParameters: ${options.queryParameters.toString()}');
          debugPrint('options.headers: ${options.headers.toString()}');

          if (options.data.runtimeType == FormData) {
            FormData formData = options.data;
            for (var element in formData.files) {
              debugPrint(' -- options.files: ${element.key}');
              debugPrint(' -- : ${element.value.filename}');
              debugPrint(' -- : ${element.value.length / 1000000} MB');
              debugPrint(' -- : ${element.value.contentType}');
              debugPrint(' -- : ${element.value.headers}');
            }
          } else {
            debugPrint('options.data: ${options.data.toString()}');
          }
          debugPrint('--  --');
          _requestInterceptor(options, handler);
        },
        onError: (error, handler) => _errorInterceptor(error, handler),
      );

  static Future<void> _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint('-- _requestInterceptor --');
    options.contentType = 'application/json';
    options.headers['Accept'] = 'application/json';

    options.headers['Authorization'] = 'Bearer token';

    return handler.next(options);
  }

  static Future<void> _errorInterceptor(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    handler.next(error);
  }
}
