import 'dart:async';
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/app/cloudnet_node.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/custom/cloudnet_node_app_config.dart';
import 'package:cloudnet/feature/cluster/cluster_page.dart';
import 'package:cloudnet/feature/dashboard/dashboard_page.dart';
import 'package:cloudnet/feature/feature/groups_page.dart';
import 'package:cloudnet/feature/login/login_handler.dart';
import 'package:cloudnet/feature/login/login_page.dart';
import 'package:cloudnet/feature/node/node_handler.dart';
import 'package:cloudnet/feature/node/node_page.dart';
import 'package:cloudnet/feature/tasks/task_setup_page.dart';
import 'package:cloudnet/feature/tasks/tasks_page.dart';
import 'package:cloudnet/state/actions/node_actions.dart';
import 'package:cloudnet/state/app_state.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:cloudnet/utils/app_config.dart';
import 'package:cloudnet/utils/dialogs.dart';
import 'package:cloudnet/utils/router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showNodeDetails = false;

  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    router.addListener(updateAppBar);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        SnackBar bar = SnackBar(content: Text(' You are now online!'));
        ScaffoldMessenger.of(context).showSnackBar(bar);
      } else if (result == ConnectivityResult.wifi) {
        SnackBar bar = SnackBar(content: Text(' You are now online!'));
        ScaffoldMessenger.of(context).showSnackBar(bar);
      } else {
        SnackBar bar = SnackBar(content: Text(' You are currently offline!'));
        ScaffoldMessenger.of(context).showSnackBar(bar);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    router.removeListener(updateAppBar);
    subscription.cancel();
    super.dispose();
  }

  void updateAppBar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NodeState>(
      converter: (store) => store.state.nodeState,
      builder: (context, state) => Scaffold(
        body: widget.child,
        appBar: _appBar(),
        drawer: _buildDrawer(state),
      ),
    );
  }

  bool isSetupPage() {
    final router = GoRouter.of(context);
    switch (router.location) {
      case TaskSetupPage.route:
        return true;
      default:
        return false;
    }
  }

  Widget _mapToEntry(CloudNetNode e) {
    return ListTile(
      title: Text(e.name ?? ''),
      leading: const Icon(Icons.cloud),
      selected: _isSelectedNode(e),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever_outlined),
        onPressed: () {
          Navigator.pop(context);
          showDialog<AlertDialog>(
            context: context,
            builder: (context) {
              return deleteDialog(
                context,
                onCancel: () => Navigator.pop(context),
                onDelete: () {
                  StoreProvider.dispatch(context, RemoveCloudNetNode(e));
                  Navigator.pop(context);
                },
                item: e.name ?? '',
              );
            },
          );
        },
        color: Theme.of(context).errorColor,
      ),
      onLongPress: () => router.push(MenuNodePage.route, extra: e),
      onTap: () {
        setState(() {
          StoreProvider.dispatch(context, SelectCloudNetNode(e));
          context.go(LoginPage.route);
          Navigator.pop(context);
        });
      },
    );
  }

  Widget _buildDetailsList(NodeState state) {
    final List<Widget> detailsNodes = List.empty(growable: true);
    detailsNodes.addAll(state.nodes.map(_mapToEntry).toSet().toList());
    detailsNodes.add(const Divider());
    detailsNodes.add(
      ListTile(
        title: const Text('Add node'),
        onTap: () => router.push(MenuNodePage.route, extra: null),
        leading: const Icon(Icons.add),
      ),
    );
    return ListView(children: detailsNodes);
  }

  bool _isSelectedNode(CloudNetNode e) {
    return nodeHandler.currentNode() != null &&
        nodeHandler.currentNode()?.name == (e.name ?? '');
  }

  Widget _buildDrawerList() {
    final enabled =
        !loginHandler.isExpired() && router.location != LoginPage.route;
    return ListView(
      children: [
        ListTile(
          title: const Text('Node'),
          selected: router.location == DashboardPage.route,
          onTap: () => {
            context.go(DashboardPage.route),
            Navigator.pop(context),
          },
          enabled: enabled,
        ),
        ListTile(
          title: Text('Cluster'),
          selected: router.location == ClusterPage.route,
          onTap: () => {
            context.go(ClusterPage.route),
            Navigator.pop(context),
          },
          enabled: enabled,
        ),
        ListTile(
          title: const Text('Groups'),
          selected: router.location == GroupsPage.route,
          onTap: () => {
            context.go(GroupsPage.route),
            Navigator.pop(context),
          },
          enabled: enabled,
        ),
        ListTile(
          title: const Text('Tasks'),
          selected: router.location == TasksPage.route,
          onTap: () => {
            context.go(TasksPage.route),
            Navigator.pop(context),
          },
          enabled: enabled,
        ),
        const ListTile(
          title: Text('Services'),
          enabled: false,
          onTap: null,
        ),
        const ListTile(
          title: Text('Templates'),
          enabled: false,
        ),
        const ListTile(
          title: Text('Modules'),
          enabled: false,
        ),
      ],
    );
  }

  Drawer _buildDrawer(NodeState state) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: _getProfileIcon(state),
            ),
            accountName:
                Text(nodeHandler.currentNode()?.toUrl() ?? 'No url provided'),
            accountEmail:
                Text(nodeHandler.currentNode()?.name ?? 'No node provided'),
            onDetailsPressed: () {
              setState(() {
                showNodeDetails = !showNodeDetails;
              });
            },
          ),
          Expanded(
              child: showNodeDetails
                  ? _buildDetailsList(state)
                  : _buildDrawerList()),
          Container(
            child: FutureBuilder<PackageInfo>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  PackageInfo? info = snapshot.data;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(info?.version ?? ''),
                      Text('+'),
                      Text(info?.buildNumber ?? ''),
                      Text(' '),
                      Text(info?.appName ?? ''),
                    ],
                  );
                } else {
                  return Text('No version');
                }
              },
              future: PackageInfo.fromPlatform(),
            ),
            margin: EdgeInsets.only(bottom: 8.0),
          )
        ],
      ),
    );
  }

  AppBar? _appBar() {
    return AppBar(
      title: Text(AppConfig().appName),
      centerTitle: true,
      actions: _getAction(),
    );
  }

  List<Widget> _getAction() {
    if (!loginHandler.isExpired() && loginHandler.accessToken() != null) {
      return [
        IconButton(
          onPressed: () {
            loginHandler.logout();
            StoreProvider.dispatch(context, LogoutNode());
            context.goNamed(LoginPage.name);
          },
          icon: const Icon(Icons.exit_to_app),
        )
      ];
    } else {
      return [];
    }
  }

  Image _getProfileIcon(NodeState state) {
    if (state.node != null && state.node?.nodeInfo != null) {
      if (state.node?.nodeInfo?.nodeInfoSnapshot?.node?.properties
              .containsKey('cloudnet_app') ==
          true) {
        final CloudNetAppConfig cloudNetProperties = CloudNetAppConfig.fromJson(
            state.node?.nodeInfo?.nodeInfoSnapshot?.node
                ?.properties['cloudnet_app'] as Map<String, dynamic>);
        return Image.memory(base64Decode(cloudNetProperties.appIcon
            .replaceAll("data:image/png;base64,", "")));
      }
    }
    if (AppConfig().isAlpha) {
      return Image.asset('.github/assets/img/TeamDiscord-Icon.png');
    }
    if (AppConfig().isBeta) {
      return Image.asset('.github/assets/img/Discord-Icon.png');
    }
    return Image.asset('.github/assets/img/Logo.png');
  }
}
