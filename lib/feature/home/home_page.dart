import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/node_info.dart';
import 'package:cloudnet_v3_flutter/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.nodeInfo,
    required this.child,
  }) : super(key: key);

  final NodeInfo? nodeInfo;
  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      appBar: _appBar(),
    );
  }

  AppBar? _appBar() {
    return AppBar(
      title: Text(appTitle),
    );
    return null;
  }
}
