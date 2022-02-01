import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/cluster_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_nodes_response.freezed.dart';
part 'cluster_nodes_response.g.dart';

@freezed
class ClusterNodesResponse with _$ClusterNodesResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ClusterNodesResponse({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'nodes') @Default(<ClusterNode>[]) List<ClusterNode> nodes,
  }) = _ClusterNodesResponse;

  factory ClusterNodesResponse.fromJson(Map<String, dynamic> json) =>
      _$ClusterNodesResponseFromJson(json);
}
