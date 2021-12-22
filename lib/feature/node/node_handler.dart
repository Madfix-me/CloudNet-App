import '/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

NodeHandler nodeHandler = NodeHandler();

class NodeHandler extends ValueNotifier<bool>{
  NodeHandler() : super(false) {
    storage = LocalStorage('urls.json');
  }

  late LocalStorage storage;

  MenuNode nodeUrl = const MenuNode(url: '');
  List<MenuNode> nodeUrls = List.empty(growable: true);

  String currentBaseUrl() => nodeUrl.url!;
  List<MenuNode> baseUrls() => nodeUrls;

  Future<void> load() async {
    await storage.ready;
    final dynamic current = await storage.getItem('currentBaseUrl');
    if (current != null && current is MenuNode) {
      nodeUrl = current;
    }
    final dynamic baseUrls = await storage.getItem('baseUrls');
    print(baseUrls);
    if (baseUrls != null && baseUrls is List<MenuNode>) {
      nodeUrls = baseUrls;
    }
    if (nodeUrl != null || nodeUrls.isNotEmpty) value = true;
  }

  Future<void> saveUrl(MenuNode url) async {
    nodeUrls.add(url);
    await storage.ready;
    await storage.setItem('baseUrls', nodeUrls);
  }

  Future<void> deleteUrl(MenuNode url) async {
    nodeUrls.remove(url);
    await storage.ready;
    await storage.setItem('baseUrls', nodeUrls);
  }

  Future<void> selectCurrentUrl(MenuNode url) async {
    nodeUrl = url;
    await storage.ready;
    await storage.setItem('currentBaseUrl', nodeUrl);
  }

  bool hasBaseUrl() {
    return nodeUrls.isNotEmpty;
  }
}
