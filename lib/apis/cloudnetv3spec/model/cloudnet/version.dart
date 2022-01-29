import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.freezed.dart';

part 'version.g.dart';

@freezed
class Version with _$Version {
  const factory Version({
    @JsonKey(name: 'major') @Default(0) int major,
    @JsonKey(name: 'minor') @Default(0) int minor,
    @JsonKey(name: 'patch') @Default(0) int patch,
    @JsonKey(name: 'revision') @Default('') String revision,
    @JsonKey(name: 'versionType') @Default('') String versionType,
    @JsonKey(name: 'versionTitle') @Default('') String versionTitle,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}
