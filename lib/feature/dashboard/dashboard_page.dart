import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/feature/node/node_handler.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:flutter/material.dart';

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

  WebSocket? connection;
  final List<String> _messages = [];
  final TextEditingController _consoleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NodeState>(
      onInit: (store) {
        store.dispatch(InitMetaInformation(_onCompleted, _onError));
      },
      converter: (store) => store.state.nodeState,
      builder: (context, state) {
        return connection != null
            ? _liveConsole()
            : RefreshIndicator(
                onRefresh: _pullRefresh,
                child: _dashboard(state),
              );
      },
    );
  }

  Widget _liveConsole() {
    return StreamBuilder<dynamic>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data! as String);
          _messages.add(snapshot.data! as String);
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, index) {
                  return Text(_messages[index].trim());
                },
                itemCount: _messages.length,
              ),
            ),
            Form(
              child: Row(
                children: [
                  IconButton(
                    icon: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Icon(Icons.exit_to_app)),
                    onPressed: () {
                      _messages.clear();
                      connection!.close().then(
                            (dynamic d) => {
                              setState(
                                () {
                                  connection = null;
                                },
                              )
                            },
                          );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _consoleController,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      connection!.add(_consoleController.text);
                      _consoleController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
      stream: connection,
    );
  }

  Widget _dashboard(NodeState state) {
    var childs = List.generate(4, (index) {
      switch (index) {
        case 0:
          return widgetVersion(state);
        case 1:
          return Center(
            child: TextButton(
              onPressed: () {
                openConsole(state).then(
                  (value) => {
                    setState(
                      () {
                        connection = value;
                      },
                    )
                  },
                );
              },
              child: Text('Live Console'),
            ),
          );
        case 2:
          return widgetNodeInfo(state);
        default:
          return Container();
      }
    });
    return GridView.count(crossAxisCount: 2, children: childs);
  }

  Widget widgetNodeInfo(NodeState state) {
    final style = TextStyle(fontSize: 15);
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Stack(Memory)', style: style),
            Text('Heap', style: style),
            Text('CPU', style: style),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${toMb(state.node?.nodeInfo?.lastNodeInfoSnapshot?.usedMemory ?? 1)}/${toMb(state.node?.nodeInfo?.lastNodeInfoSnapshot?.reservedMemory ?? 1)}/${toMb(state.node?.nodeInfo?.lastNodeInfoSnapshot?.maxMemory ?? 1)} MB',
                style: style),
            Text(
                '${toMb(state.node?.nodeInfo?.lastNodeInfoSnapshot?.processSnapshot?.heapUsageMemory ?? 1)}/${toMb(state.node?.nodeInfo?.lastNodeInfoSnapshot?.processSnapshot?.maxHeapMemory ?? 1)} Mb',
                style: style),
            Text(
                '${toCpu(state.node?.nodeInfo?.lastNodeInfoSnapshot?.processSnapshot?.cpuUsage ?? 1)}%',
                style: style),
          ],
        ),
      ],
    );
    return row;
  }

  int toMb(int bytes) {
    return (bytes / 1024 / 1024).round();
  }

  String toCpu(double cpu) {
    return cpu.toStringAsFixed(2);
  }

  Widget widgetVersion(NodeState state) {
    final version =
        '${state.node?.nodeInfo?.version.major}.${state.node?.nodeInfo?.version.minor}.${state.node?.nodeInfo?.version.patch}-${state.node?.nodeInfo?.version.versionType}';
    final style = TextStyle(fontSize: 15);
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Version', style: style),
            Text('Revision', style: style),
            Text('Title', style: style),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(version, style: style),
            Text(state.node?.nodeInfo?.version.revision ?? '', style: style),
            Text(state.node?.nodeInfo?.version.versionTitle ?? '',
                style: style),
          ],
        ),
      ],
    );
    return row;
  }

  Future<WebSocket?> openConsole(NodeState state) async {
    final headers = {
      'Authorization': 'Bearer ${state.node?.token}',
      'Content-Type': 'application/json',
    };
    final ws = WebSocket.connect(
        '${state.node?.toWebSocketUrl()}/api/v2/node/liveconsole',
        headers: headers);
    return Future.value(ws);
  }

  Future<void> _pullRefresh() async {
    (StoreProvider.dispatch(context, UpdateNodeInfo()) as Future<ActionStatus>)
        .timeout(Duration(seconds: 15), onTimeout: () {
      return Future.error('Timeout');
    });
    setState(() {});
  }

  void _onError(dynamic error) {}

  void _onCompleted() {}
}
