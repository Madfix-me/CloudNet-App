import 'package:async_redux/async_redux.dart';
import '/apis/api_service.dart';
import '/apis/cloudnetv3spec/model/node_info.dart';
import '/state/app_state.dart';


class InitAppStateAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final NodeInfo nodeInfo = await ApiService().nodeApi.getNode();
    return state.copyWith(nodeInfo: nodeInfo);
  }
}