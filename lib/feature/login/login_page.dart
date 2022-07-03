import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/i18n/strings.g.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';

import '/feature/dashboard/dashboard_page.dart';
import '/feature/login/login_handler.dart';
import '/state/app_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/login';
  static const String name = 'login';

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Center(
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: ValidationBuilder().required().build(),
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: t.page.login.username,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _clearInputField(_usernameController),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 32),
                  child: TextFormField(
                    validator: ValidationBuilder().required().build(),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: t.page.login.password,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _clearInputField(_passwordController),
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () => login(), child: Text(t.page.login.login))
              ],
            ),
          ),
        );
      },
    );
  }

  void _clearInputField(TextEditingController controller) {
    controller.clear();
  }

  void login() {
    if (_loginFormKey.currentState!.validate()) {
      loginHandler
          .handleLogin(_usernameController.text, _passwordController.text)
          .then((value) => {
                StoreProvider.dispatch(context, UpdateToken(value)),
                context.go(DashboardPage.route)
              })
          .onError((error, stackTrace) {
        if (error is DioError) {
          final DioError dioError = error;
          final Response? response = dioError.response;
          switch (response?.statusCode) {
            case 404:
              {
                SnackBar snackBar =
                    SnackBar(content: Text(t.page.login.no_rest_api_installed));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              break;
            case 403:
              {
                SnackBar snackBar = SnackBar(
                    content: Text(t.page.login.username_password_wrong));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
          }
        }

        return Future.error(error!, stackTrace);
      });
    }
  }
}
