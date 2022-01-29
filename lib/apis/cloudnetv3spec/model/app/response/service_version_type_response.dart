import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_version_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_version_type_response.g.dart';

part 'service_version_type_response.freezed.dart';

@freezed
class ServiceVersionTypeResponse with _$ServiceVersionTypeResponse {
  const factory ServiceVersionTypeResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'versions')
    @Default(<String, ServiceVersionType>{})
        Map<String, ServiceVersionType> versions,
  }) = _ServiceVersionTypeResponse;

  factory ServiceVersionTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceVersionTypeResponseFromJson(json);
}
