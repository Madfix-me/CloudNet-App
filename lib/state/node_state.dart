import 'package:cloudnet/apis/cloudnetv3spec/model/app/cloudnet_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_state.freezed.dart';
part 'node_state.g.dart';

@freezed
class NodeState with _$NodeState {
  const factory NodeState({
    @JsonKey(name: 'nodes') @Default(<CloudNetNode>[]) List<CloudNetNode> nodes,
    @JsonKey(name: 'node') CloudNetNode? node,
  }) = _NodeState;

  factory NodeState.fromJson(Map<String, dynamic> json) =>
      _$NodeStateFromJson(json);
}
