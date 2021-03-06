import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/host_and_port.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_cluster_node.g.dart';
part 'network_cluster_node.freezed.dart';

@freezed
class NetworkClusterNode with _$NetworkClusterNode {
  factory NetworkClusterNode({
    @JsonKey(name: 'uniqueId') String? uniqueId,
    @JsonKey(name: 'listeners')
    @Default(<HostAndPort>[])
        List<HostAndPort> listeners,
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
  }) = _NetworkClusterNode;

  factory NetworkClusterNode.fromJson(Map<String, dynamic> json) =>
      _$NetworkClusterNodeFromJson(json);
}
