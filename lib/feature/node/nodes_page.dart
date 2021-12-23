import 'package:CloudNet/feature/node/menu_node_page.dart';
import 'package:CloudNet/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'node_handler.dart';

class NodesPage extends StatelessWidget {
  const NodesPage({Key? key}) : super(key: key);
  static const String route = '/nodes';
  static const String name = 'nodes';

  @override
  Widget build(BuildContext context) {
    final nodes = nodeHandler.nodeUrls.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
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
              child: Icon(Icons.add),
            ),
            right: 16,
            bottom: 16,
          )
        ],
      ),
    );
  }
}
