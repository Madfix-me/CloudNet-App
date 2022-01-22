import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet_node.dart';
import 'package:cloudnet/feature/node/nodes_page.dart';
import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/utils/app_config.dart';
import 'package:form_validator/form_validator.dart';
import '/feature/dashboard/dashboard_page.dart';
import '/feature/login/login_handler.dart';
import '/feature/node/node_handler.dart';
import '/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloudnet/i18n/strings.g.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.nodes,
    required this.node,
    Key? key,
  }) : super(key: key);
  final List<CloudNetNode> nodes;
  final CloudNetNode? node;

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
    final menuNodes = widget.nodes
        .map(
          (e) => DropdownMenuItem<String>(
            child: Text(e.name!),
            value: e.name!,
          ),
        )
        .toSet()
        .toList();
    String? value;
    if (nodeHandler.nodeUrl.name == null && menuNodes.isNotEmpty) {
      value = widget.nodes.first.name;
    } else {
      value = nodeHandler.nodeUrl.name;
    }
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppConfig().appName),
            centerTitle: true,
          ),
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
                              nodeHandler.selectCurrentUrl(nodeHandler.nodeUrls
                                  .firstWhere(
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
            _usernameController.text,
            _passwordController.text,
          )
          .then((value) => {
                StoreProvider.dispatch(context, UpdateToken(value)),
                context.go(DashboardPage.route)
              })
          .catchError((dynamic e) {
        SnackBar snackBar = SnackBar(
          content: Text(t.page.login.username_password_wrong),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future<dynamic>.value();
      });
    }
  }
}
