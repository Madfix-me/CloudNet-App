

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef AccessTokenProvider = String? Function();
typedef AccessBaseUrlProvider = String? Function();

class ApiClient {
  ApiClient(
      this.baseUrl,
      this.tokenProvider
  ) {
    dio = Dio()
      ..options.baseUrl = baseUrl()!
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = tokenProvider();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
              handler.next(options);
            } else {
              handler.reject(DioError(requestOptions: options));
            }
          },
          onError: (err, handler) {
            if (err.error is SocketException) {
              handler.reject(err);
            }
            if (err.response?.statusCode != null && err.response!.statusCode == 401) {
              handler.reject(err);
            }
          },
        ),
      );
    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
    }
  }
  final AccessBaseUrlProvider baseUrl;
  final AccessTokenProvider tokenProvider;
  late Dio dio;
}