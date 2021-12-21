import 'package:async_redux/async_redux.dart';
import 'package:cloudnet_v3_flutter/apis/api_service.dart';
import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/node_info.dart';
import 'package:cloudnet_v3_flutter/state/app_state.dart';


class InitAppStateAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final NodeInfo nodeInfo = await ApiService().nodeApi.getNode();
    return state.copyWith(nodeInfo: nodeInfo);
  }
}