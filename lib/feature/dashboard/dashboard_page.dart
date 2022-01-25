import 'dart:async';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/feature/node/node_handler.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '/state/app_state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const String route = '/dashboard';
  static const String name = 'dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  _DashboardPageState() {
    /*Timer.periodic(
      const Duration(seconds: 10),
          (Timer t) => {
        StoreProvider.dispatch(context, UpdateNodeInfoAction()),
        setState((){})
      },
    );*/
  }

  final _client = HttpClient();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NodeState>(
      onInit: (store) {
        store.dispatch(InitMetaInformation(
            _onCompleted, _onError
        ));
      },
      converter: (store) => store.state.nodeState,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: _pullRefresh,
          child: FutureBuilder<WebSocket>(
            future: openConsole(state),
            builder: (context, snapshot) {
              print(snapshot.hasData);

              return StreamBuilder<dynamic>(
                builder: (context, snapshot) {
                  print(snapshot.hasData);
                  return Text(snapshot.hasData ? '${snapshot.data}' : '');
                },
                stream: snapshot.data,
              );
            },
          ),
        );
      },
    );
  }

  Future<WebSocket> openConsole(NodeState state) async {
    final value = await _client
        .getUrl(Uri.parse('${state.node?.toUrl()}/api/v2/node/liveconsole'));
    value.headers.add('Authorization', state.node?.token ?? '');
    value.headers.add('Connection', 'upgrade');
    value.headers.add('Upgrade', 'websocket');
    final resp = await value.close();
    final socket = await resp.detachSocket();
    return WebSocket.fromUpgradedSocket(socket, serverSide: false);
  }

  Future<void> _pullRefresh() async {
    StoreProvider.dispatch(context, UpdateNodeInfo());
  }

  void _onError(dynamic error) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: Text("Error Occurred")));
  }

  void _onCompleted() {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Item Completed")));

  }
/*
  Card buildCard(int index, NodeInfo info) {
    switch (index) {
      case 0:
        return memoryCard(info);
      case 1:
        return serviceCard(info);
      case 2:
        return cpuCard(info);
      case 3:
        return heapCard(info);
      case 4:
        return versionCard(info);
      default:
        return Card(child: Container());
    }
  }

  Card versionCard(NodeInfo state) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t.page.dashboard.version,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(state.version.revision, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }

  Card memoryCard(NodeInfo state) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.page.dashboard.memory_usage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
              Text(t.general.formats
                  .mb(value: state.lastNodeInfoSnapshot!.usedMemory.toString()))
            ],
          ),
        ),
      ),
    );
  }

  Card serviceCard(NodeInfo state) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.page.dashboard.running_services,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
              Text(state.lastNodeInfoSnapshot!.currentServicesCount.toString())
            ],
          ),
        ),
      ),
    );
  }

  Card cpuCard(NodeInfo state) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.page.dashboard.cpu_usage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
              Text(t.general.formats.percentage(
                  value: state.lastNodeInfoSnapshot!.processSnapshot!.cpuUsage!
                      .toStringAsFixed(2)))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    StoreProvider.dispatch(context, UpdateNodeInfoAction());
  }

  Card heapCard(NodeInfo info) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t.page.dashboard.heap_usage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(t.general.formats.mb(
                  value: (info.nodeInfoSnapshot!.processSnapshot!
                              .heapUsageMemory! /
                          1024 /
                          1024)
                      .toStringAsFixed(0)))
            ],
          ),
        ),
      ),
    );
  }*/
}
