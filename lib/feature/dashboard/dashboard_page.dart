import 'package:async_redux/async_redux.dart';
import '/apis/cloudnetv3spec/model/node_info.dart';
import '/state/actions/node_actions.dart';
import '/state/app_state.dart';
import 'package:flutter/widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const String route = '/dashboard';
  static const String name = 'dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NodeInfo>(
      onInit: (store) {
        store.dispatch(InitAppStateAction());
      },
      converter: (store) => store.state.nodeInfo!,
      builder: (context,  nodeInfo) => Text(nodeInfo.serviceCount!.toString()),
    );
  }
}
