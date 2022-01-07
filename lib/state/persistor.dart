import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import '/state/app_state.dart';
import 'package:localstorage/localstorage.dart';


class AppPersistor extends Persistor<AppState> {

  late LocalStorage storage;
  AppPersistor() {
    storage = LocalStorage('appstate');
  }

  @override
  Future<void> deleteState() async {
    await storage.ready;
    await storage.deleteItem('appstate');
  }

  @override
  Future<void> persistDifference({required AppState? lastPersistedState, required AppState newState}) async {
    if (lastPersistedState != newState) {
      final Map<String, dynamic> json = newState.toJson();
      final String data = jsonEncode(json);
      await storage.ready;
      await storage.setItem('appstate', data);
    }
  }

  @override
  Future<AppState> readState() async {
    await storage.ready;
    if (storage.getItem('appstate') != null) {
      final String data = storage.getItem('appstate') as String;
      final Map<String, dynamic> json = jsonDecode(data) as Map<String, dynamic>;
      return AppState.fromJson(json);
    }
    return AppState();
  }
}
