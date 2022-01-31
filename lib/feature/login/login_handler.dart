import 'dart:convert';

import 'package:cloudnet/state/app_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '/feature/node/node_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

LoginHandler loginHandler = LoginHandler();

class LoginHandler extends ValueNotifier<bool> {
  LoginHandler() : super(false);
  String? _token;

  String? accessToken() {
    return _token;
  }

  void resetToken() {
    _token = null;
  }

  Future<void> load(AppState state) async {
    if (state.nodeState.node != null) {
      _token = state.nodeState.node?.token;
    }
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
    value = true;
    return _token!;
  }

  Future<String> handleLogin(String username, String password) async {
    final dio = Dio();
    final token = await dio
        .postUri<String>(
          Uri.parse('${nodeHandler.currentBaseUrl()}/api/v2/auth'),
          data: <String, dynamic>{},
          options: Options(headers: <String, dynamic>{
            'Authorization':
                'Basic ${base64.encode(utf8.encode('$username:$password'))}',
          }),
        )
        .then((response) => response.data!);

    final Map<String, dynamic> response =
        jsonDecode(token) as Map<String, dynamic>;
    _token = response['token'] as String;
    value = true;

    return _token!;
  }

  bool isExpired() {
    return _token != null && JwtDecoder.isExpired(_token!);
  }
}
