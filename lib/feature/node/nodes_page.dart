import 'package:cloudnet/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:cloudnet/feature/node/menu_node_page.dart';
import 'package:cloudnet/utils/app_config.dart';
import 'package:cloudnet/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'node_handler.dart';

class NodesPage extends StatefulWidget {
  const NodesPage({Key? key}) : super(key: key);
  static const String route = '/nodes';
  static const String name = 'nodes';

  @override
  State<StatefulWidget> createState() => _NodesPageState();
}

class _NodesPageState extends State<NodesPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig().appName),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: nodes.length,
            itemBuilder: (context, index) {
              final node = nodes[index];
              return ListTile(
                title: Text(node.name ?? ''),
                subtitle: Text(node.toUrl()),
                trailing: IconButton(
                  onPressed: () {
                    context.push(MenuNodePage.route, extra: node);
                  },
                  icon: const Icon(Icons.edit),
                ),
              );
            },
          ),
          Positioned(
            child: FloatingActionButton(
              onPressed: () {
                context.push(MenuNodePage.route, extra: null);
              },
              child: const Icon(Icons.add),
            ),
            right: 16,
            bottom: 16,
          )
        ],
      ),
    );
  }
}
