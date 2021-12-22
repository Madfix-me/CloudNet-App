import 'dart:async';

import 'package:CloudNet/apis/cloudnetv3spec/model/cloudnet_version.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/network_cluster_node_info_snapshot.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '/apis/cloudnetv3spec/model/node_info.dart';
import '/state/actions/node_actions.dart';
import '/state/app_state.dart';
import 'package:flutter/widgets.dart';
import '/utils/color.dart' as color;

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

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, NodeInfo>(
      onInit: (store) {
        store.dispatch(InitAppStateAction());
      },
      converter: (store) => store.state.nodeInfo ?? NodeInfo(),
      builder: (context, nodeInfo) => RefreshIndicator(
        onRefresh: _pullRefresh,
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return AspectRatio(
                aspectRatio: 1, child: buildCard(index, nodeInfo));
          },
        ),
      ),
    );
  }

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
        return versionTitleCard(info);
      case 5:
        return versionTypeCard(info);
      default:
        return Card(child: Container());
    }
  }

  Card memoryCard(NodeInfo state) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Memory usage'),
            Text(state.lastNodeInfoSnapshot!.usedMemory.toString())
          ],
        ),
      ),
    );
  }

  Card serviceCard(NodeInfo state) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Service Count'),
            Text(state.lastNodeInfoSnapshot!.currentServicesCount.toString())
          ],
        ),
      ),
    );
  }

  Card cpuCard(NodeInfo state) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cpu Usage'),
            Text(
                '${state.lastNodeInfoSnapshot!.processSnapshot!.cpuUsage!.toStringAsFixed(2)}%')
          ],
        ),
      ),
    );
  }

  Card versionTitleCard(NodeInfo state) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Version Title'),
            Text(((state.lastNodeInfoSnapshot ??
                                NetworkClusterNodeInfoSnapshot())
                            .version ??
                        CloudNetVersion())
                    .versionTitle ??
                '')
          ],
        ),
      ),
    );
  }

  Card versionTypeCard(NodeInfo state) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Version Type'),
            Text(((state.lastNodeInfoSnapshot ??
                                NetworkClusterNodeInfoSnapshot())
                            .version ??
                        CloudNetVersion())
                    .versionType ??
                '')
          ],
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    StoreProvider.dispatch(context, UpdateNodeInfoAction());
  }

  Card heapCard(NodeInfo info) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Heap Usage'),
            Text(
                '${(info.nodeInfoSnapshot!.processSnapshot!.heapUsageMemory! / 1024 / 1024).toStringAsFixed(0)}Mb')
          ],
        ),
      ),
    );
  }
}
