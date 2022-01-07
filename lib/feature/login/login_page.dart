import 'package:cloudnet/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:cloudnet/feature/node/nodes_page.dart';
import 'package:cloudnet/state/actions/app_actions.dart';
import 'package:async_redux/async_redux.dart';
import 'package:form_validator/form_validator.dart';
import '/feature/dashboard/dashboard_page.dart';
import '/feature/login/login_handler.dart';
import '/feature/node/node_handler.dart';
import '/state/app_state.dart';
import '/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloudnet/i18n/strings.g.dart';

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
  final _loginFormKey = GlobalKey<FormState>();
  late bool ssl = false;
  List<MenuNode> nodes = nodeHandler.nodeUrls.toList();
  @override
  void initState() {
    nodeHandler.addListener(updateNodes);
    super.initState();
  }

  void updateNodes() {
    setState(() {
      nodes = nodeHandler.nodeUrls.toList();
    });
  }

  @override
  void dispose() {
    nodeHandler.removeListener(updateNodes);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        final menuNodes = nodes.map(
          (e) => DropdownMenuItem<String>(
            child: Text(e.name!),
            value: e.name!,
          ),
        ).toSet().toList();
        String? value;
        if (nodeHandler.nodeUrl.name == null && menuNodes.isNotEmpty) {
          value = nodes.first.name;
        } else {
          value = nodeHandler.nodeUrl.name;
        }

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
                            items: menuNodes,
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
                        labelText: t.page.login.username,
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
                        labelText: t.page.login.password,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () =>
                              _clearInputField(_passwordController),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => login(), child: Text(t.page.login.login))
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

  void login() {
    if (_loginFormKey.currentState!.validate()) {
      loginHandler
          .handleLogin(
            _passwordController.text,
            _usernameController.text,
          )
          .then((value) => {
                StoreProvider.dispatch(context, UpdateTokenInfoAction(value)),
                StoreProvider.dispatch(context, InitAppStateAction()),
                context.go(DashboardPage.route)
              })
          .catchError((dynamic e) {
        SnackBar snackBar = SnackBar(
          content: Text(t.page.login.username_password_wrong),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
}
