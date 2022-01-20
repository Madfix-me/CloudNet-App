import 'package:cloudnet/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:cloudnet/utils/app_config.dart';
import 'package:cloudnet/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloudnet/i18n/strings.g.dart';

import 'node_handler.dart';

class MenuNodePage extends StatefulWidget {
  const MenuNodePage({Key? key, required this.node}) : super(key: key);
  static const String route = '/menu-node';
  static const String name = 'menu-nod';
  final MenuNode node;

  @override
  State<StatefulWidget> createState() => _MenuNodePageState(node);
}

class _MenuNodePageState extends State<MenuNodePage> {
  MenuNode node;
  late MenuNode newNode;
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _portController;
  final _formKey = GlobalKey<FormState>();
  late bool ssl = node.ssl ?? false;

  _MenuNodePageState(this.node) {
    newNode = node;
  }

  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController.fromValue(
        TextEditingValue(text: newNode.name ?? ''));
    _addressController = TextEditingController.fromValue(
        TextEditingValue(text: newNode.address ?? ''));
    _portController = TextEditingController.fromValue(
        TextEditingValue(text: (newNode.port ?? 2812).toString()));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig().appName),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
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
                    hintText: t.page.menu_node.name,
                    labelText: t.page.menu_node.node_name,
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: t.page.menu_node.address,
                    labelText: t.page.menu_node.network_address,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => _clearInputField(_addressController),
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
                    hintText: t.page.menu_node.port,
                    labelText: t.page.menu_node.port,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => _clearInputField(_portController),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(t.page.menu_node.ssl),
                    Switch(
                      value: ssl,
                      onChanged: (value) =>
                      {
                        setState(
                              () {
                            ssl = value;
                          },
                        )
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: TextButton(
                        onPressed: () {
                          nodeHandler
                              .deleteUrl(newNode)
                              .then((value) => GoRouter.of(context).pop());
                        },
                        child: Text(t.general.button.delete),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            newNode = newNode.copyWith(
                                name: _nameController.text,
                                address: _addressController.text,
                                port: int.tryParse(_portController.text),
                                ssl: ssl);
                            if (node.address != null) {
                              nodeHandler.deleteUrl(node).then((value) => null);
                            }
                            nodeHandler
                                .saveUrl(newNode)
                                .then((value) =>
                                setState(() => GoRouter.of(context).pop()),);
                          }
                        },
                        child: Text(t.general.button.save),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Theme
                                .of(context)
                                .colorScheme
                                .secondary),
                            foregroundColor: MaterialStateProperty.all(Theme
                                .of(context)
                                .colorScheme
                                .onSecondary)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearInputField(TextEditingController controller) {
    controller.clear();
  }
}
