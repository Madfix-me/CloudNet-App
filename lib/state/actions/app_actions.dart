import 'package:cloudnet/apis/cloudnetv3spec/model/group_configuration.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_version_type.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/templatestorage.dart';
import 'package:async_redux/async_redux.dart';
import '/apis/api_service.dart';
import '/apis/cloudnetv3spec/model/node_info.dart';
import '/state/app_state.dart';


class InitAppStateAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final NodeInfo nodeInfo = await ApiService().nodeApi.getNode();
    final List<ServiceTask> tasks = await ApiService().tasksApi.getTasks();
    final List<GroupConfiguration> groups = await ApiService().groupsApi.getGroups();
    final List<ServiceVersionType> versions = await ApiService().versionsApi.getVersions();
    final TemplateStorage templateStorage = await ApiService().templateStorageApi.getStorage();
    return state.copyWith(
        nodeInfo: nodeInfo,
        tasks: tasks,
        groups: groups,
        versions: versions,
        templateStorage: templateStorage
    );
  }
}

class UpdateNodeInfoAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final NodeInfo nodeInfo = await ApiService().nodeApi.getNode();
    return state.copyWith(nodeInfo: nodeInfo);
  }
}

class UpdateTasksAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final List<ServiceTask> tasks = await ApiService().tasksApi.getTasks();
    return state.copyWith(tasks: tasks);
  }
}

class UpdateTokenInfoAction extends ReduxAction<AppState> {
  UpdateTokenInfoAction(this.token);
  final String token;

  @override
  Future<AppState?> reduce() async {
    return state.copyWith(token: token);
  }
}