import 'package:CloudNet/state/actions/node_actions.dart';
import 'package:async_redux/async_redux.dart';
import 'package:dio/dio.dart';
import 'package:form_validator/form_validator.dart';
import '/apis/cloudnetv3spec/model/menu_node.dart';
import '/extensions/i18n_ext.dart';
import '/feature/dashboard/dashboard_page.dart';
import '/feature/login/login_handler.dart';
import '/feature/node/node_handler.dart';
import '/state/app_state.dart';
import '/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NodePage extends StatefulWidget {
  const NodePage({Key? key}) : super(key: key);
  static const String route = '/node';
  static const String name = 'node';

  @override
  State<StatefulWidget> createState() => _NodePageState();
}

class _NodePageState extends State<NodePage> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _portController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();
  late bool ssl = false;

  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _portController =
        TextEditingController.fromValue(const TextEditingValue(text: '2812'));
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        nodeHandler.load();
        final nodes = nodeHandler.nodeUrls.map(
          (e) => DropdownMenuItem<String>(
            child: Text(e.name!),
            value: e.name!,
          ),
        );
        final menu = List<DropdownMenuItem<String>>.empty(growable: true);
        menu.addAll(nodes);
        menu.add(DropdownMenuItem<String>(
          child: const Text('Add node'),
          value: "Add node",
        ));
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
                    child: DropdownButtonFormField(
                      validator: ValidationBuilder().required().build(),
                      items: menu,
                      onChanged: (String? value) {
                        if (value == 'Add node') {
                          _showAddNodeMask();
                        } else {
                          nodeHandler.selectCurrentUrl(nodeHandler.nodeUrls
                              .firstWhere((element) => element.name == value));
                        }
                      },
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

  void _showAddNodeMask() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintText: 'Name',
                          labelText: 'Node Name',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _clearInputField(_nameController),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: TextFormField(
                        controller: _addressController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelText: 'Network Address',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () =>
                                _clearInputField(_addressController),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: TextFormField(
                        controller: _portController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelText: 'Port',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () =>
                                _clearInputField(_addressController),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          const Text('SSL'),
                          Switch(
                            value: ssl,
                            onChanged: (value) => {
                              setState(
                                () {
                                  ssl = value;
                                },
                              )
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2.0),
                ),
              ),
              title: const Text('Add node'),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      this.setState(
                        () {
                          final menuNode = MenuNode(
                            url:
                                '${ssl ? 'https' : 'http'}://${_addressController.value.text}:${_portController.text}',
                            name: _nameController.value.text,
                          );
                          nodeHandler.saveUrl(menuNode);
                          _formKey.currentState!.reset();
                          Navigator.pop(context);
                        },
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                )
              ],
            );
          },
        );
      },
    );
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
