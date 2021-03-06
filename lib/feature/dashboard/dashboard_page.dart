import 'dart:async';
import 'dart:io';

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

  final _client = HttpClient();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NodeState>(
      onInit: (store) {
        store.dispatch(InitMetaInformation(_onCompleted, _onError));
      },
      converter: (store) => store.state.nodeState,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: _pullRefresh,
          child: FutureBuilder<WebSocket>(
            future: openConsole(state),
            builder: (context, snapshot) {
              return StreamBuilder<dynamic>(
                builder: (context, snapshot) {
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

  void _onError(dynamic error) {}

  void _onCompleted() {}
}
