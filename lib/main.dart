import 'package:cloudnet/feature/login/login_handler.dart';
import 'package:async_redux/async_redux.dart';
import '/cloudnet.dart';
import '/feature/node/node_handler.dart';
import '/state/app_state.dart';
import '/state/persistor.dart';
import 'package:flutter/material.dart';
import 'package:cloudnet/i18n/strings.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await nodeHandler.load();
  await loginHandler.load();
  final persistor = AppPersistor();
  final initialState = await persistor.readState();
  final store = Store<AppState>(
    persistor: persistor,
    initialState: initialState,
  );
  runApp(StoreProvider<AppState>(store: store, child: TranslationProvider(child: const CloudNet())));
}
