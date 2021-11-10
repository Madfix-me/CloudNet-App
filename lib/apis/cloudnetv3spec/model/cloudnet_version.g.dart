// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloudnet_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CloudNetVersion _$$_CloudNetVersionFromJson(Map<String, dynamic> json) =>
    _$_CloudNetVersion(
      major: json['major'] as int?,
      minor: json['minor'] as int?,
      patch: json['patch'] as int?,
      revision: json['revision'] as String?,
      versionType: json['versionType'] as String?,
      versionTitle: json['versionTitle'] as String?,
    );

Map<String, dynamic> _$$_CloudNetVersionToJson(_$_CloudNetVersion instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'patch': instance.patch,
      'revision': instance.revision,
      'versionType': instance.versionType,
      'versionTitle': instance.versionTitle,
    };
