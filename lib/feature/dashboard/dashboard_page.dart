import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '/state/actions/app_actions.dart';
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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      onInit: (store) {
        store.dispatch(InitAppStateAction());
      },
      converter: (store) => store.state,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: _pullRefresh,
          child: Flex(
            direction: Axis.vertical,
            children: const [],
          ),
        );
      },
    );
  }

  Future<void> _pullRefresh() async {
    StoreProvider.dispatch(context, UpdateNodeInfoAction());
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
