

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloudnet_version.g.dart';
part 'cloudnet_version.freezed.dart';

@freezed
class CloudNetVersion with _$CloudNetVersion {

  factory CloudNetVersion({
    @JsonKey(name: 'major') int? major,
    @JsonKey(name: 'minor') int? minor,
    @JsonKey(name: 'patch') int? patch,
    @JsonKey(name: 'revision') String? revision,
    @JsonKey(name: 'versionType') String? versionType,
    @JsonKey(name: 'versionTitle') String? versionTitle,
  }) = _CloudNetVersion;

  factory CloudNetVersion.fromJson(Map<String, dynamic> json) => _$CloudNetVersionFromJson(json);

}