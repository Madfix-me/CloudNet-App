import 'package:cloudnet/apis/cloudnetv3spec/model/service_version.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_version_type.g.dart';

part 'service_version_type.freezed.dart';

@freezed
class ServiceVersionType with _$ServiceVersionType {
  const factory ServiceVersionType({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'environmentType') String? environmentType,
    @JsonKey(name: 'installSteps') List<String>? installSteps,
    @JsonKey(name: 'versions') List<ServiceVersion>? versions,
  }) = _ServiceVersionType;

  factory ServiceVersionType.fromJson(Map<String, dynamic> json) =>
      _$ServiceVersionTypeFromJson(json);
}
