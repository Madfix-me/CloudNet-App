import 'package:cloudnet/feature/login/login_handler.dart';
import 'package:async_redux/async_redux.dart';
import '/cloudnet.dart';
import '/feature/node/node_handler.dart';
import '/state/app_state.dart';
import '/state/persistor.dart';
import 'package:flutter/material.dart';
import 'package:cloudnet/i18n/strings.g.dart';

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  final persistor = AppPersistor();
  final initialState = await persistor.readState();
  final store = Store<AppState>(
    persistor: persistor,
    initialState: initialState,
  );
  await nodeHandler.load(store.state);
  await loginHandler.load(store.state);
  runApp(StoreProvider<AppState>(
      store: store, child: TranslationProvider(child: const CloudNet())));
}
