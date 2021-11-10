
import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/host_and_port.dart';
import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/model/network_cluster_node_info_snapshot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_info.freezed.dart';
part 'node_info.g.dart';

@freezed
class NodeInfo with _$NodeInfo {

  factory NodeInfo({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'version') String? version,
    @JsonKey(name: 'nodeInfoSnapshot') NetworkClusterNodeInfoSnapshot? nodeInfoSnapshot,
    @JsonKey(name: 'lastNodeInfoSnapshot') NetworkClusterNodeInfoSnapshot? lastNodeInfoSnapshot,
    @JsonKey(name: 'serviceCount') int? serviceCount,
    @JsonKey(name: 'clientConnections') List<HostAndPort>? clientConnections,
  }) = _NodeInfo;

  factory NodeInfo.fromJson(Map<String, dynamic> json) => _$NodeInfoFromJson(json);
}