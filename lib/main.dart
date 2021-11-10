import 'package:async_redux/async_redux.dart';
import 'package:cloudnet_v3_flutter/cloudnet.dart';
import 'package:cloudnet_v3_flutter/feature/node/node_handler.dart';
import 'package:cloudnet_v3_flutter/state/app_state.dart';
import 'package:cloudnet_v3_flutter/state/persistor.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await nodeHandler.load();
  final persistor = AppPersistor();
  final initialState = await persistor.readState();
  final store = Store<AppState>(
    persistor: persistor,
    initialState: initialState,
  );
  runApp(StoreProvider<AppState>(store: store, child: const CloudNet()));
}
