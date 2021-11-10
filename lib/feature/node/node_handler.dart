import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

NodeHandler nodeHandler = NodeHandler();

class NodeHandler extends ValueNotifier<bool>{
  NodeHandler(): super(false);

  final LocalStorage storage = new LocalStorage('appstate');

  String nodeUrl = "";
  List<String> nodeUrls = List.empty();

  String? currentBaseUrl() => nodeUrl;
  List<String> baseUrls() => nodeUrls;

  Future<void> load() async {
    await storage.ready;
    final dynamic current = storage.getItem('currentBaseUrl');
    if (current != null && current is String) {
      nodeUrl = current;
    }
    final dynamic baseUrls = storage.getItem('baseUrls');
    if (baseUrls != null && baseUrls is List<String>) {
      nodeUrls = baseUrls;
    }
    if (nodeUrl != null || nodeUrls.isNotEmpty) value = true;
  }

  Future<void> saveUrl(String url) async {
    nodeUrls.add(url);
    await storage.ready;
    storage.setItem('baseUrls', nodeUrls);
  }

  Future<void> deleteUrl(String url) async {
    nodeUrls.remove(url);
    await storage.ready;
    storage.setItem('baseUrls', nodeUrls);
  }

  Future<void> selectCurrentUrl(String url) async {
    nodeUrl = url;
    await storage.ready;
    storage.setItem('currentBaseUrl', nodeUrl);
  }

  bool hasBaseUrl() {
    return nodeUrl != "" && nodeUrls.isNotEmpty;
  }
}
