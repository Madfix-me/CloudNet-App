import 'package:cloudnet/feature/dashboard/dashboard_page.dart';
import 'package:cloudnet/feature/feature/groups_page.dart';
import 'package:cloudnet/feature/node/node_handler.dart';
import 'package:cloudnet/feature/tasks/task_setup_page.dart';
import 'package:cloudnet/feature/tasks/tasks_page.dart';
import 'package:cloudnet/state/actions/app_actions.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:cloudnet/utils/router.dart';
import 'package:async_redux/async_redux.dart';

import '/apis/cloudnetv3spec/model/node_info.dart';
import '/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/utils/color.dart' as color;

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
  void initState() {
    router.addListener(updateAppBar);
    super.initState();
  }

  @override
  void dispose() {
    router.removeListener(updateAppBar);
    super.dispose();
  }

  void updateAppBar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NodeInfo>(
        onInit: (store) {
      store.dispatch(InitAppStateAction());
    },
    converter: (store) => store.state.nodeInfo ?? NodeInfo(),
    builder: (context, nodeInfo) => Scaffold(
      body: widget.child,
      appBar: _appBar(nodeInfo),
      drawer: isSetupPage() ? null : buildDrawer(),
    ),);
  }

  bool isSetupPage() {
    final router = GoRouter.of(context);
    switch (router.location) {
      case TaskSetupPage.route:
        {
          return true;
        }
      default:
        {
          return false;
        }
    }
  }

  Drawer buildDrawer() {
    final router = GoRouter.of(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: color.blue,
            ),
            accountEmail: Text(nodeHandler.nodeUrl.name!),
            accountName: const Text('TheMeinerLP'),
            currentAccountPicture: const Image(
                image: NetworkImage(
                    'https://crafthead.net/avatar/05bf52c67bb04f1389510e1fd803df35')),
          ),
          ListTile(
            title: const Text('Node'),
            selected: router.location == DashboardPage.route,
            onTap: () => {
              context.go(DashboardPage.route),
              Navigator.pop(context),
            },
          ),
          const ListTile(
            title: Text('Cluster'),
            enabled: false,
          ),
          const ListTile(
            title: Text('Database'),
            enabled: false,
          ),
          ListTile(
            title: const Text('Groups'),
            selected: router.location == GroupsPage.route,
            onTap: () => {
              context.go(GroupsPage.route),
              Navigator.pop(context),
            },
          ),
          ListTile(
            title: const Text('Tasks'),
            selected: router.location == TasksPage.route,
            onTap: () => {
              context.go(TasksPage.route),
              Navigator.pop(context),
            },
          ),
          const ListTile(
            title: Text('Services'),
            enabled: false,
            onTap: null,
          ),
          const ListTile(
            title: Text('Template Storage'),
            enabled: false,
          ),
          const ListTile(
            title: Text('Templates'),
            enabled: false,
          ),
          const ListTile(
            title: Text('Service Versions'),
            enabled: false,
          ),
          const ListTile(
            title: Text('Modules'),
            enabled: false,
          ),
        ],
      ),
    );
  }

  AppBar? _appBar(NodeInfo nodeInfo) {
    return AppBar(
      title: isSetupPage() ? const Text(appTitle) : Text('Node: ${nodeInfo.lastNodeInfoSnapshot?.node?.uniqueId}'),
    );
  }
}
