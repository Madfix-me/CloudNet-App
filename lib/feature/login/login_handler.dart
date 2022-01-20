import 'dart:convert';
import 'dart:io';

import 'package:cloudnet/feature/login/login_page.dart';
import 'package:cloudnet/utils/router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:localstorage/localstorage.dart';

import '/feature/node/node_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

LoginHandler loginHandler = LoginHandler();

class LoginHandler extends ValueNotifier<bool> {
  LoginHandler() : super(false);
  String? _token;

  String? accessToken() {
    if (_token == null) {
      router.routerDelegate.navigatorKey.currentState?.context
          .go(LoginPage.route);
    } else {
      return _token;
    }
  }

  void resetToken() {
    _token = null;
    _delete().then((value) {});
  }

  Future<void> load() async {
    final storage = LocalStorage('token.json');
    await storage.ready;
    final dynamic token = await storage.getItem('token');
    if (token != null && token is String) {
      _token = token;
    }
  }

  Future<void> _delete() async {
    final storage = LocalStorage('token.json');
    await storage.ready;
    await storage.deleteItem('token');
  }

  Future<void> _save(String token) async {
    final storage = LocalStorage('token.json');
    await storage.ready;
    await storage.setItem('token', token);
  }

  Future<String> sessionRefresh() async {
    final token = await Dio()
        .postUri<String>(
          Uri.parse('${nodeHandler.currentBaseUrl()}/api/v2/session/refresh'),
          data: <String, dynamic>{},
          options: Options(headers: <String, dynamic>{
            'Authorization': 'Bearer $_token',
          }),
        )
        .then((response) => response.data!);
    final Map<String, dynamic> response =
        jsonDecode(token) as Map<String, dynamic>;
    _token = response['token'] as String;
    await _save(_token!);
    value = true;
    return _token!;
  }

  Future<String> handleLogin(String username, String password) async {
    final dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
    dio.interceptors.add(
        InterceptorsWrapper(
          onError: (err, handler) {
            if (err.error is SocketException) {
              print(err.error);
              handler.reject(err);
            }
            if (err.response?.statusCode != null && err.response!.statusCode == 403) {
              print(err.error);
              handler.reject(err);
            }
          },
        ),
    );
    final token = await dio
        .postUri<String>(
          Uri.parse('${nodeHandler.currentBaseUrl()}/api/v2/auth'),
          data: <String, dynamic>{},
          options: Options(headers: <String, dynamic>{
            'Authorization':
                'Basic ${base64.encode(utf8.encode('$username:$password'))}',
          }),
        )
        .then((response) => response.data!)
        .catchError((dynamic error) => {print(error)});

    final Map<String, dynamic> response =
        jsonDecode(token) as Map<String, dynamic>;
    _token = response['token'] as String;
    await _save(_token!);
    value = true;

    return _token!;
  }

  bool isExpired() {
    return _token != null && JwtDecoder.isExpired(_token!);
  }
}
