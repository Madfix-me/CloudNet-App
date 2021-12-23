import 'package:CloudNet/feature/node/nodes_page.dart';
import 'package:CloudNet/state/actions/app_actions.dart';
import 'package:async_redux/async_redux.dart';
import 'package:form_validator/form_validator.dart';
import '/extensions/i18n_ext.dart';
import '/feature/dashboard/dashboard_page.dart';
import '/feature/login/login_handler.dart';
import '/feature/node/node_handler.dart';
import '/state/app_state.dart';
import '/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final _loginFormKey = GlobalKey<FormState>();
  late bool ssl = false;

  @override
  Widget build(BuildContext context) {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        nodeHandler.load();
        final nodes = nodeHandler.nodeUrls.toList().map(
          (e) => DropdownMenuItem<String>(
            child: Text(e.name!),
            value: e.name!,
          ),
        ).toList();
        final String? value = nodeHandler.nodeUrl.name;
        return Scaffold(
          appBar: AppBar(title: const Text(appTitle)),
          body: Center(
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            validator: ValidationBuilder().required().build(),
                            items: nodes,
                            value: value,
                            onChanged: (String? value) {
                              nodeHandler.selectCurrentUrl(
                                  nodeHandler.nodeUrls.firstWhere(
                                          (element) => element.name == value));
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4.0),
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              context.push(NodesPage.route);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: ValidationBuilder().required().build(),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        hintText: 'Username'.i18n,
                        labelText: 'Username'.i18n,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () =>
                              _clearInputField(_usernameController),
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
                        border: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Password'.i18n,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () =>
                              _clearInputField(_passwordController),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => login(), child: const Text('Login'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _clearInputField(TextEditingController controller) {
    controller.clear();
  }

  void submitValue() {
    _formKey.currentState!.validate();
  }

  void navigation(int value) {
    switch (value) {
      case 1:
        {
          login();
        }
    }
  }

  void login() {
    if (_loginFormKey.currentState!.validate()) {
      loginHandler
          .handleLogin(
            _passwordController.text,
            _usernameController.text,
          )
          .then((value) => {
                StoreProvider.dispatch(context, UpdateTokenInfoAction(value)),
                context.go(DashboardPage.route)
              })
          .catchError((dynamic e) {
        const snackBar = SnackBar(
          content: Text('Password or Username is wrong!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
}
