import 'package:CloudNet/feature/dashboard/dashboard_page.dart';
import 'package:CloudNet/feature/feature/groups_page.dart';
import 'package:CloudNet/feature/node/node_handler.dart';
import 'package:CloudNet/feature/tasks/task_setup_page.dart';
import 'package:CloudNet/feature/tasks/tasks_page.dart';
import 'package:CloudNet/utils/router.dart';

import '/apis/cloudnetv3spec/model/node_info.dart';
import '/utils/const.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      body: widget.child,
      appBar: _appBar(),
      drawer: isSetupPage() ? null : buildDrawer(),
    );
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
            decoration: BoxDecoration(
              color: color.blue,
            ),
            accountEmail: Text(nodeHandler.nodeUrl.name!),
            accountName: Text('TheMeinerLP'),
            currentAccountPicture: Image(
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
          ListTile(
            title: const Text('Cluster'),
            enabled: false,
          ),
          ListTile(
            title: const Text('Database'),
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
          ListTile(
            title: const Text('Services'),
            enabled: false,
            onTap: null,
          ),
          ListTile(
            title: const Text('Template Storage'),
            enabled: false,
          ),
          ListTile(
            title: const Text('Templates'),
            enabled: false,
          ),
          ListTile(
            title: const Text('Service Versions'),
            enabled: false,
          ),
          ListTile(
            title: const Text('Modules'),
            enabled: false,
          ),
        ],
      ),
    );
  }

  AppBar? _appBar() {
    return AppBar(
      title: Text(appTitle),
    );
  }
}
