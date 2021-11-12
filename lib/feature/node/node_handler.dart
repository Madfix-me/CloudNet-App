import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

NodeHandler nodeHandler = NodeHandler();

class NodeHandler extends ValueNotifier<bool>{
  NodeHandler(): super(false);

  final LocalStorage storage = LocalStorage('node');

  String nodeUrl = "";
  Set<String> nodeUrls = HashSet();

  String currentBaseUrl() => '$nodeUrl/api/v2';
  Set<String> baseUrls() => nodeUrls;

  Future<void> load() async {
    await storage.ready;
    final dynamic current = storage.getItem('currentBaseUrl');
    if (current != null && current is String) {
      nodeUrl = current;
    }
    final dynamic baseUrls = storage.getItem('baseUrls');
    if (baseUrls != null && baseUrls is Object) {
      nodeUrls = (baseUrls as List).map((dynamic e) => e as String).toSet();
    }
    if (nodeUrl != "" || nodeUrls.isNotEmpty) value = true;
  }

  Future<void> saveUrl(String url) async {
    nodeUrls.add(url);
    await storage.ready;
    storage.setItem('baseUrls', nodeUrls.toList());
  }

  Future<void> deleteUrl(String url) async {
    nodeUrls.remove(url);
    await storage.ready;
    storage.setItem('baseUrls', nodeUrls.toList());
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
