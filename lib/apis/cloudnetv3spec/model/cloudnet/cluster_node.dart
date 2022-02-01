import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/network_cluster_node.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/network_cluster_node_info_snapshot.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/node_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_node.freezed.dart';
part 'cluster_node.g.dart';

@freezed
class ClusterNode with _$ClusterNode {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ClusterNode({
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'available') @Default(false) bool available,
    @JsonKey(name: 'node') NetworkClusterNode? node,
    @JsonKey(name: 'head') @Default(false) bool head,
    @JsonKey(name: 'nodeInfoSnapshot')
        NetworkClusterNodeInfoSnapshot? nodeInfoSnapshot,
  }) = _ClusterNode;

  factory ClusterNode.fromJson(Map<String, dynamic> json) =>
      _$ClusterNodeFromJson(json);
}
