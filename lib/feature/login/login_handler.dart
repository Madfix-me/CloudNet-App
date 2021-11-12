import 'dart:convert';

import 'package:cloudnet_v3_flutter/apis/api_service.dart';
import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/auth_response.dart';

LoginHandler loginHandler = LoginHandler();

class LoginHandler {
  LoginHandler();
  String? basicAuth() => base64Hash;
  String? accessToken() => token;

  String base64Hash = "";
  String token = "";

  Future<void> handleLogin(String username, String password) async {
    final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    base64Hash = stringToBase64.encode("$username:$password");
    print(base64Hash);
    final AuthResponse response = await ApiService().authApi.auth();
    token = response.token ?? '';
  }

  bool isLoggedIn() {
    return token != "";
  }
}
