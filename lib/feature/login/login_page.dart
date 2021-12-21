import '/extensions/i18n_ext.dart';
import '/feature/login/login_handler.dart';
import '/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';
  static const String name = 'login';

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final StringValidationCallback urlValidate =
      ValidationBuilder().url('Wrong url schema'.i18n).build();

  @override
  Widget build(BuildContext context) {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            controller: _usernameController,
                            validator: validateInput,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: 'Username'.i18n,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: _clearUsernameInputField,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            controller: _passwordController,
                            validator: validateInput,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: 'Password'.i18n,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: _clearPasswordInputField,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: submitValue,
                          icon: const Icon(Icons.send),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearPasswordInputField() {
    _passwordController.clear();
  }

  void _clearUsernameInputField() {
    _usernameController.clear();
  }

  void submitValue() {
    if (_formKey.currentState!.validate()) {
      loginHandler
          .handleLogin(
              _usernameController.value.text, _passwordController.value.text)
          .then((value) => {print(loginHandler.accessToken())});
    }
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text'.i18n;
    }
    return null;
  }
}
