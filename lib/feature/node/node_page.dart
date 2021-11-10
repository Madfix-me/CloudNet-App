import 'package:cloudnet_v3_flutter/utils/const.dart';
import 'package:flutter/material.dart';

class NodePage extends StatefulWidget {
  const NodePage({Key? key}) : super(key: key);
  static const String route = '/node';
  static const String name = 'node';

  @override
  State<StatefulWidget> createState() => _NodePageState();
}

class _NodePageState extends State<NodePage> {
  late TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
                key: _formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: TextFormField(
                          controller: _controller,
                          validator: validateInput,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: 'http://your-cloudnet-address:2812',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: _clearInputField,
                              )
                          )
                      ),
                      width: 360,
                    ),
                    IconButton(onPressed: submitValue, icon: Icon(Icons.send))
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void _clearInputField() {
    _controller.clear();
  }

  void submitValue() {}

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
