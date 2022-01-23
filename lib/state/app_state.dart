import 'package:cloudnet/state/node_state.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @JsonKey(name: 'node_state') @Default(NodeState()) NodeState nodeState,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
