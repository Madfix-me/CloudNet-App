// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_cluster_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkClusterNode _$$_NetworkClusterNodeFromJson(
        Map<String, dynamic> json) =>
    _$_NetworkClusterNode(
      uniqueId: json['uniqueId'] as String?,
      listeners: (json['listeners'] as List<dynamic>?)
          ?.map((e) => HostAndPort.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NetworkClusterNodeToJson(
        _$_NetworkClusterNode instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'listeners': instance.listeners,
    };
