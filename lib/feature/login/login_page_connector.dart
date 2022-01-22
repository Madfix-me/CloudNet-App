import 'package:async_redux/async_redux.dart';
import 'package:cloudnet/feature/login/login_page.dart';
import 'package:cloudnet/feature/login/login_page_vm_factory.dart';
import 'package:cloudnet/state/node_state.dart';
import 'package:flutter/widgets.dart';

class LoginPageConnector extends StatelessWidget {
  const LoginPageConnector({required this.child, Key? key}) : super(key: key);
  static const String route = '/login';
  static const String name = 'login';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<NodeState, LoginPageVm>(
      vm: () => LoginPageVmFactory(),
      builder: (context, vm) => LoginPage(
        nodes: vm.nodes,
        node: vm.node,
      ),
    );
  }
}
