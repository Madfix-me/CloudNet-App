import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/network_cluster_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_config.freezed.dart';
part 'cluster_config.g.dart';

@freezed
class ClusterConfig with _$ClusterConfig {

  const factory ClusterConfig({
    @JsonKey(name: 'clusterId') String? clusterId,
    @JsonKey(name: 'nodes') @Default(<NetworkClusterNode>[]) List<NetworkClusterNode> nodes,
}) = _ClusterConfig;


  factory ClusterConfig.fromJson(Map<String, dynamic> json) =>
      _$ClusterConfigFromJson(json);
}
