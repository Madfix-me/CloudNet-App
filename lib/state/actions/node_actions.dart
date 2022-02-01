import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/apis/api_service.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/app/cloudnet_node.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_template.dart';
import 'package:cloudnet/feature/login/login_handler.dart';
import 'package:cloudnet/feature/node/node_handler.dart';
import 'package:cloudnet/state/app_state.dart';

typedef VoidCallback = void Function();
typedef ErrorCallback = void Function(dynamic error);

class InitMetaInformation extends ReduxAction<AppState> {
  VoidCallback onCompeleted;
  ErrorCallback onError;

  InitMetaInformation(this.onCompeleted, this.onError);

  @override
  Future<AppState?> reduce() async {
    final nodeInfo = await ApiService().nodeApi.getNode();
    final nodeTasks = await ApiService().tasksApi.getTasks();
    final groups = await ApiService().groupsApi.getGroups();
    final versions = await ApiService().versionsApi.getVersions();
    final templateStorage = await ApiService().templateStorageApi.getStorage();

    final rawTemplates = await Future.wait(templateStorage.storages.map(
        (e) async => (await ApiService().templateStorageApi.getTemplates(e))));
    final templates = rawTemplates.fold(
        <ServiceTemplate>[],
        (List<ServiceTemplate> previousValue, List<ServiceTemplate> element) =>
            [...previousValue, ...element]);
    return state.copyWith(
        nodeState: state.nodeState.copyWith(
      node: state.nodeState.node?.copyWith(
          nodeInfo: nodeInfo,
          tasks: nodeTasks,
          groups: groups,
          versions: versions,
          templateStorage: templateStorage,
          templates: templates),
    ));
  }
}

class LogoutNode extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    return state.copyWith(
      nodeState: state.nodeState.copyWith(
        node: state.nodeState.node
            ?.copyWith(token: null, loggedin: false, connected: false),
      ),
    );
  }
}

class UpdateToken extends ReduxAction<AppState> {
  final String token;

  UpdateToken(this.token);

  @override
  Future<AppState?> reduce() async {
    return state.copyWith(
      nodeState: state.nodeState.copyWith(
        node: state.nodeState.node
            ?.copyWith(token: token, loggedin: true, connected: true),
      ),
    );
  }
}

class UpdateNodeInfo extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final nodeInfo = await ApiService().nodeApi.getNode();
    return state.copyWith(
      nodeState: state.nodeState
          .copyWith(node: state.nodeState.node?.copyWith(nodeInfo: nodeInfo)),
    );
  }
}

class UpdateTasks extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final nodeTasks = await ApiService().tasksApi.getTasks();
    return state.copyWith(
      nodeState: state.nodeState.copyWith(
        node: state.nodeState.node?.copyWith(tasks: nodeTasks),
      ),
    );
  }
}

class AddCloudNetNode extends ReduxAction<AppState> {
  final CloudNetNode node;

  AddCloudNetNode(this.node);

  @override
  Future<AppState> reduce() async {
    List<CloudNetNode> nodes = List.of(state.nodeState.nodes, growable: true);
    nodes.add(node);
    return state.copyWith(nodeState: state.nodeState.copyWith(nodes: nodes));
  }
}

class UpdateCloudNetNode extends ReduxAction<AppState> {
  final CloudNetNode oldNode;
  final CloudNetNode newNode;

  UpdateCloudNetNode(this.oldNode, this.newNode);

  @override
  Future<AppState> reduce() async {
    List<CloudNetNode> nodes = List.of(state.nodeState.nodes, growable: true);
    nodes.remove(oldNode);
    nodes.add(newNode);
    if (oldNode == state.nodeState.node) {
      return state.copyWith(
          nodeState: state.nodeState.copyWith(nodes: nodes, node: newNode));
    } else {
      return state.copyWith(nodeState: state.nodeState.copyWith(nodes: nodes));
    }
  }
}

class DeleteTask extends ReduxAction<AppState> {
  final ServiceTask task;

  DeleteTask(this.task);

  @override
  Future<AppState> reduce() async {
    List<ServiceTask> tasks = List.of(
        (state.nodeState.node?.tasks ?? <ServiceTask>[]),
        growable: true);
    tasks.remove(task);
    await ApiService().tasksApi.deleteTask(task);
    return state.copyWith(
        nodeState: state.nodeState
            .copyWith(node: state.nodeState.node?.copyWith(tasks: tasks)));
  }
}

class RemoveCloudNetNode extends ReduxAction<AppState> {
  final CloudNetNode node;

  RemoveCloudNetNode(this.node);

  @override
  Future<AppState> reduce() async {
    List<CloudNetNode> nodes = List.of(state.nodeState.nodes, growable: true);
    nodes.remove(node);
    if (nodes.isEmpty) {
      return state.copyWith(
          nodeState: state.nodeState.copyWith(nodes: nodes, node: null));
    } else {
      return state.copyWith(nodeState: state.nodeState.copyWith(nodes: nodes));
    }
  }
}

class SelectCloudNetNode extends ReduxAction<AppState> {
  final CloudNetNode node;

  SelectCloudNetNode(this.node);

  @override
  Future<AppState> reduce() async {
    final newState =
        state.copyWith(nodeState: state.nodeState.copyWith(node: node));
    await nodeHandler.load(newState);
    await loginHandler.load(newState);
    return newState;
  }
}
