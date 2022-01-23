import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet_node.dart';
import 'package:cloudnet/feature/dashboard/dashboard_page.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloudnet/i18n/strings.g.dart';

class MenuNodePage extends StatefulWidget {
  const MenuNodePage({required this.node, Key? key}) : super(key: key);
  static const String route = '/node';
  static const String name = 'nod';
  final CloudNetNode? node;

  @override
  State<StatefulWidget> createState() => _MenuNodePageState();
}

class _MenuNodePageState extends State<MenuNodePage> {
  CloudNetNode? oldNode;
  CloudNetNode newNode = const CloudNetNode();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _portController;
  final _formKey = GlobalKey<FormState>();
  late bool ssl = oldNode?.ssl ?? false;

  @override
  void initState() {
    oldNode = widget.node;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _nameController = TextEditingController.fromValue(
        TextEditingValue(text: oldNode?.name ?? ''));
    _addressController = TextEditingController.fromValue(
        TextEditingValue(text: oldNode?.host ?? ''));
    _portController = TextEditingController.fromValue(
        TextEditingValue(text: (oldNode?.port ?? 2812).toString()));
    return StoreConnector<AppState, AppState>(
      builder: (context, vm) => Center(
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
                          GoRouter.of(context).pop();
                        },
                        child: Text(t.general.button.cancel),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            newNode = newNode.copyWith(
                                name: _nameController.text,
                                host: _addressController.text,
                                port: int.tryParse(_portController.text),
                                ssl: ssl);
                            if (oldNode != null) {
                              StoreProvider.dispatch(context,
                                  UpdateCloudNetNode(oldNode!, newNode));
                              Navigator.pop(context);
                            } else {
                              StoreProvider.dispatch(
                                  context, AddCloudNetNode(newNode));
                              context.go(DashboardPage.route);
                            }
                          }
                        },
                        child: Text(t.general.button.save),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.secondary),
                            foregroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.onSecondary)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      converter: (store) => store.state,
    );
  }

  void _clearInputField(TextEditingController controller) {
    controller.clear();
  }
}
