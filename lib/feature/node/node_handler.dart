import 'package:CloudNet/apis/cloudnetv3spec/cloudnetv3specapi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

NodeHandler nodeHandler = NodeHandler();

class NodeHandler extends ValueNotifier<bool>{
  NodeHandler() : super(false);

  MenuNode nodeUrl = const MenuNode(url: null);
  List<MenuNode> nodeUrls = List.empty(growable: true);

  String currentBaseUrl() => nodeUrl.url!;
  List<MenuNode> baseUrls() => nodeUrls;

  Future<void> load() async {
    final storage = LocalStorage('urls.json');
    await storage.ready;
    final dynamic current = await storage.getItem('currentBaseUrl');
    if (current != null && current is Json) {
      nodeUrl = MenuNode.fromJson(current);
    }
    final dynamic baseUrls = await storage.getItem('baseUrls');
    if (baseUrls != null && baseUrls is List) {
      nodeUrls = baseUrls.map((dynamic e) => MenuNode.fromJson(e as Json)).toList();
    }
    if (nodeUrl != null || nodeUrls.isNotEmpty) value = true;
  }

  Future<void> saveUrl(MenuNode url) async {
    final storage = LocalStorage('urls.json');
    nodeUrls.add(url);
    await storage.ready;
    await storage.setItem('baseUrls', nodeUrls);
  }

  Future<void> deleteUrl(MenuNode url) async {
    final storage = LocalStorage('urls.json');
    nodeUrls.remove(url);
    await storage.ready;
    await storage.setItem('baseUrls', nodeUrls);
  }

  Future<void> selectCurrentUrl(MenuNode url) async {
    final storage = LocalStorage('urls.json');
    nodeUrl = url;
    await storage.ready;
    await storage.setItem('currentBaseUrl', nodeUrl);
  }

  bool hasBaseUrl() {
    return nodeUrls.isNotEmpty && nodeUrl.url != null;
  }
}
