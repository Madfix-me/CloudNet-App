import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import '/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

NodeHandler nodeHandler = NodeHandler();

class NodeHandler extends ValueNotifier<bool>{
  NodeHandler(): super(false);

  final LocalStorage storage = LocalStorage('urls');

  MenuNode nodeUrl = const MenuNode(url: '');
  List<MenuNode> nodeUrls = List.empty(growable: true);

  String currentBaseUrl() => nodeUrl.url!;
  List<MenuNode> baseUrls() => nodeUrls;

  Future<void> load() async {
    await storage.ready;
    final dynamic current = storage.getItem('currentBaseUrl');
    if (current != null && current is MenuNode) {
      nodeUrl = current;
    }
    final dynamic baseUrls = storage.getItem('baseUrls');
    print(baseUrls);
    if (baseUrls != null && baseUrls is List<MenuNode>) {
      nodeUrls = baseUrls;
    }
    if (nodeUrl != null || nodeUrls.isNotEmpty) value = true;
  }

  Future<void> saveUrl(MenuNode url) async {
    nodeUrls.add(url);
    await storage.ready;
    print(url);
    storage.setItem('baseUrls', jsonEncode(nodeUrls));
    print(storage.getItem('baseUrls'));

  }

  Future<void> deleteUrl(MenuNode url) async {
    nodeUrls.remove(url);
    await storage.ready;
    storage.setItem('baseUrls', nodeUrls);
  }

  Future<void> selectCurrentUrl(MenuNode url) async {
    nodeUrl = url;
    await storage.ready;
    storage.setItem('currentBaseUrl', nodeUrl);
  }

  bool hasBaseUrl() {
    return nodeUrl != null && nodeUrls.isNotEmpty;
  }
}
