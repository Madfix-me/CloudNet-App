import 'package:cloudnet/apis/cloudnetv3spec/cloudnetv3specapi.dart';

import '/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

NodeHandler nodeHandler = NodeHandler();

class NodeHandler extends ValueNotifier<bool> {
  NodeHandler() : super(false);

  MenuNode nodeUrl = const MenuNode();
  Set<MenuNode> nodeUrls = {};

  String currentBaseUrl() => nodeUrl.toUrl();
  String currentWebsocketUrl() => nodeUrl.toWebSocketUrl();
  Set<MenuNode> baseUrls() => nodeUrls;

  Future<void> load() async {
    final storage = LocalStorage('urls.json');
    await storage.ready;
    final dynamic current = await storage.getItem('currentBaseUrl');
    if (current != null && current is Json) {
      nodeUrl = MenuNode.fromJson(current);
    }
    final dynamic baseUrls = await storage.getItem('baseUrls');
    if (baseUrls != null && baseUrls is List) {
      nodeUrls =
          baseUrls.map((dynamic e) => MenuNode.fromJson(e as Json)).toSet();
    }
    if (nodeUrl.address != null || nodeUrls.isNotEmpty) value = true;
    notifyListeners();
  }

  Future<void> saveUrl(MenuNode url) async {
    final storage = LocalStorage('urls.json');
    nodeUrls.add(url);
    await storage.ready;
    await storage.setItem('baseUrls', nodeUrls.toList());
    value = true;
    notifyListeners();
  }

  Future<void> deleteUrl(MenuNode url) async {
    final storage = LocalStorage('urls.json');
    nodeUrls.remove(url);
    await storage.ready;
    await storage.setItem('baseUrls', nodeUrls.toList());
    value = true;
    notifyListeners();
  }

  Future<void> selectCurrentUrl(MenuNode url) async {
    final storage = LocalStorage('urls.json');
    nodeUrl = url;
    await storage.ready;
    await storage.setItem('currentBaseUrl', nodeUrl);
    value = true;
    notifyListeners();
  }

  bool hasBaseUrl() {
    return nodeUrls.isNotEmpty && nodeUrl.name != null;
  }
}

extension UrlCreator on MenuNode {
  String toUrl() {
    return '${ssl ?? false ? 'https' : 'http'}://$address:$port';
  }

  String toWebSocketUrl() {
    return '${ssl ?? false ? 'wss' : 'ws'}://$address:$port';
  }
}
