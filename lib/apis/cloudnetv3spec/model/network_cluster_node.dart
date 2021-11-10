


import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/host_and_port.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_cluster_node.g.dart';
part 'network_cluster_node.freezed.dart';

@freezed
class NetworkClusterNode with _$NetworkClusterNode {

  factory NetworkClusterNode({
    @JsonKey(name: 'uniqueId') String? uniqueId,
    @JsonKey(name: 'listeners') List<HostAndPort>? listeners,
  }) = _NetworkClusterNode;

  factory NetworkClusterNode.fromJson(Map<String, dynamic> json) => _$NetworkClusterNodeFromJson(json);

}