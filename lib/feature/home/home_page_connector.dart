import 'package:async_redux/async_redux.dart';
import '/feature/home/home_page.dart';
import '/feature/home/home_page_vm_factory.dart';
import '/state/actions/app_actions.dart';
import '/state/app_state.dart';
import 'package:flutter/widgets.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector({required this.child, Key? key}) : super(key: key);
  static const String route = '/';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVM>(
      onInit: (store) {
        store.dispatch(InitAppStateAction());
      },
      vm: () => HomePageVmFactory(),
      builder: (context, vm) => HomePage(
        nodeInfo: vm.nodeInfo,
        child: child,
      ),
    );
  }
}