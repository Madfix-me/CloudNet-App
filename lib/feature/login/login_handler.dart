import 'dart:convert';
import 'dart:developer';

import 'package:cloudnet_v3_flutter/feature/node/node_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

LoginHandler loginHandler = LoginHandler();

class LoginHandler extends ValueNotifier<bool> {
  LoginHandler() : super(false);
  String? _token;

  String? accessToken() => _token;

  Future<bool> handleLogin(String username, String password) async {
    print('${nodeHandler.currentBaseUrl()}/api/v2/auth');
    final token = await Dio()
        .postUri<String>(
          Uri.parse('${nodeHandler.currentBaseUrl()}/api/v2/auth'),
          data: <String, dynamic>{},
          options: Options(headers: <String, dynamic>{
            'Authorization':
                'Basic ${base64.encode(utf8.encode('$username:$password'))}',
          }),
        )
        .then((response) => response.data!);
    Map<String, dynamic> response = jsonDecode(token) as Map<String, dynamic>;
    _token = response['token'] as String;
    value = true;
    return true;
  }
}
