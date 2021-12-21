import 'package:async_redux/async_redux.dart';
import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/node_info.dart';
import 'package:cloudnet_v3_flutter/feature/home/home_page_connector.dart';
import 'package:cloudnet_v3_flutter/state/app_state.dart';


class HomePageVmFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm fromStore() => HomePageVM(
    nodeInfo: state.nodeInfo,
  );
}

class HomePageVM extends Vm {
  HomePageVM({
    required this.nodeInfo,
  }) : super(
    equals: [
      nodeInfo,
    ],
  );

  final NodeInfo? nodeInfo;
}