// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NodeInfo _$$_NodeInfoFromJson(Map<String, dynamic> json) => _$_NodeInfo(
      success: json['success'] as bool?,
      version: json['version'] as String?,
      nodeInfoSnapshot: json['nodeInfoSnapshot'] == null
          ? null
          : NetworkClusterNodeInfoSnapshot.fromJson(
              json['nodeInfoSnapshot'] as Map<String, dynamic>),
      lastNodeInfoSnapshot: json['lastNodeInfoSnapshot'] == null
          ? null
          : NetworkClusterNodeInfoSnapshot.fromJson(
              json['lastNodeInfoSnapshot'] as Map<String, dynamic>),
      serviceCount: json['serviceCount'] as int?,
      clientConnections: (json['clientConnections'] as List<dynamic>?)
          ?.map((e) => HostAndPort.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NodeInfoToJson(_$_NodeInfo instance) =>
    <String, dynamic>{
      'success': instance.success,
      'version': instance.version,
      'nodeInfoSnapshot': instance.nodeInfoSnapshot,
      'lastNodeInfoSnapshot': instance.lastNodeInfoSnapshot,
      'serviceCount': instance.serviceCount,
      'clientConnections': instance.clientConnections,
    };
