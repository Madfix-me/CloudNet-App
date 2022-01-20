import 'package:cloudnet/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:cloudnet/feature/dashboard/dashboard_page.dart';
import 'package:cloudnet/feature/feature/groups_page.dart';
import 'package:cloudnet/feature/node/node_handler.dart';
import 'package:cloudnet/feature/tasks/task_setup_page.dart';
import 'package:cloudnet/feature/tasks/tasks_page.dart';
import 'package:cloudnet/state/actions/app_actions.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:cloudnet/utils/app_config.dart';
import 'package:cloudnet/utils/router.dart';
import 'package:async_redux/async_redux.dart';

import '/apis/cloudnetv3spec/model/node_info.dart';
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
  List<MenuNode> nodes = nodeHandler.nodeUrls.toList();
  bool showNodeDetails = false;

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
      ),
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

  Widget _buildDetailsList() {
    final detailsNodes = nodes
        .map(
          (e) => ListTile(
            title: Text(
              e.name ?? '',
              style: TextStyle(
                color: _isSelectedNode(e)
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
            leading: const Icon(
              Icons.cloud,
            ),
          ),
        )
        .toSet()
        .toList();
    return ListView(
      children: detailsNodes,
    );
  }

  bool _isSelectedNode(MenuNode e) {
    return nodeHandler.nodeUrl.name != null &&
        (nodeHandler.nodeUrl.name == (e.name ?? ''));
  }

  Widget _buildDrawerList() {
    return ListView(
      children: [
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
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Image(
              image: _getProfileIcon(),
            ),
            accountName: Text(nodeHandler.nodeUrl.toUrl()),
            accountEmail: Text(nodeHandler.nodeUrl.name!),
            onDetailsPressed: () {
              setState(() {
                showNodeDetails = !showNodeDetails;
              });
            },
          ),
          Expanded(
              child: showNodeDetails ? _buildDetailsList() : _buildDrawerList())
        ],
      ),
    );
  }

  AppBar? _appBar(NodeInfo nodeInfo) {
    return AppBar(
      title: Text(
        AppConfig().appName,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.exit_to_app),
        )
      ],
    );
  }

  AssetImage _getProfileIcon() {
    if (AppConfig().isAlpha) {
      return const AssetImage('.github/assets/img/TeamDiscord-Icon.png');
    }
    if (AppConfig().isBeta) {
      return const AssetImage('.github/assets/img/Discord-Icon.png');
    }
    return const AssetImage('.github/assets/img/Logo.png');
  }
}
