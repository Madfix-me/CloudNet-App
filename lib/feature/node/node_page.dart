import 'package:cloudnet_v3_flutter/extensions/i18n_ext.dart';
import 'package:cloudnet_v3_flutter/feature/login/login_page.dart';
import 'package:cloudnet_v3_flutter/feature/node/node_handler.dart';
import 'package:cloudnet_v3_flutter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';

class NodePage extends StatefulWidget {
  const NodePage({Key? key}) : super(key: key);
  static const String route = '/init-node';
  static const String name = 'init-node';

  @override
  State<StatefulWidget> createState() => _NodePageState();
}

class _NodePageState extends State<NodePage> {
  late TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();
  final StringValidationCallback urlValidate = ValidationBuilder().url('Wrong url schema'.i18n).build();

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                        controller: _controller,
                        validator: validateInput,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: 'http://your-cloudnet-address:2812'.i18n,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: _clearInputField,
                            ),
                        ),
                    ),
                  ),
                  IconButton(onPressed: () => submitValue(context), icon: const Icon(Icons.send))
                ],
              ),),
        ),
      ),
    );
  }

  void _clearInputField() {
    _controller.clear();
  }

  void submitValue(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      nodeHandler.saveUrl(_controller.value.text);
      nodeHandler.selectCurrentUrl(_controller.value.text);
      context.go(LoginPage.route);
    }
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text'.i18n;
    }
    return urlValidate(value);
  }
}
