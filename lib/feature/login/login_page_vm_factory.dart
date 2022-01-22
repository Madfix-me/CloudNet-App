import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet_node.dart';
import 'package:cloudnet/feature/login/login_page_connector.dart';
import 'package:cloudnet/state/node_state.dart';

class LoginPageVmFactory extends VmFactory<NodeState, LoginPageConnector> {
  @override
  Vm fromStore() => LoginPageVm(
        nodes: state.nodes,
        node: state.node,
      );
}

class LoginPageVm extends Vm {
  final List<CloudNetNode> nodes;
  final CloudNetNode? node;

  LoginPageVm({
    required this.nodes,
    required this.node,
  }) : super(equals: [
          nodes,
          node,
        ]);
}
