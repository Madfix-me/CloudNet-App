import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_response.freezed.dart';
part 'services_response.g.dart';

@freezed
class ServicesResponse with _$ServicesResponse {

  const factory ServicesResponse({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'services') @Default(<Service>[]) List<Service> services,
}) = _ServicesResponse;


  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);
}
