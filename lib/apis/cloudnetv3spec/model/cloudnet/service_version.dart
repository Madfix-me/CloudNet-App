import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cloudnetv3specapi.dart';

part 'service_version.freezed.dart';

part 'service_version.g.dart';

@freezed
class ServiceVersion with _$ServiceVersion {
  const factory ServiceVersion({
    @JsonKey(name: 'additionalDownloads') Json? additionalDownloads,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'minJavaVersion') int? minJavaVersion,
    @JsonKey(name: 'maxJavaVersion') int? maxJavaVersion,
    @JsonKey(name: 'deprecated') bool? deprecated,
    @JsonKey(name: 'cacheFiles') bool? cacheFiles,
    @JsonKey(name: 'properties') Json? properties,
  }) = _ServiceVersion;

  factory ServiceVersion.fromJson(Map<String, dynamic> json) =>
      _$ServiceVersionFromJson(json);
}
