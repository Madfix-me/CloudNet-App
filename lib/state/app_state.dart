import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/node_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    NodeInfo? nodeInfo,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
