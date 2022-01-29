import 'package:cloudnet/apis/cloudnetv3spec/model/app/cloudnet_node.dart';
import 'package:cloudnet/state/app_state.dart';

import 'package:flutter/material.dart';

NodeHandler nodeHandler = NodeHandler();

class NodeHandler extends ValueNotifier<bool> {
  NodeHandler() : super(false);

  String currentBaseUrl() => _node!.toUrl();
  String currentWebsocketUrl() => _node!.toWebSocketUrl();
  CloudNetNode? currentNode() => _node;
  CloudNetNode? _node;

  Future<void> load(AppState state) async {
    if (state.nodeState.node != null) {
      _node = state.nodeState.node!;
    }
    notifyListeners();
  }

  bool hasBaseUrl() {
    return _node?.name != null;
  }
}

extension UrlCreator on CloudNetNode {
  String toUrl() {
    return '${ssl ? 'https' : 'http'}://$host:$port';
  }

  String toWebSocketUrl() {
    return '${ssl ? 'wss' : 'ws'}://$host:$port';
  }
}
