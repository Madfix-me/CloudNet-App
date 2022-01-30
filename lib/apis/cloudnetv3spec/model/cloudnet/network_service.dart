import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_service.g.dart';

part 'network_service.freezed.dart';

@freezed
class NetworkService with _$NetworkService {

  const factory NetworkService({
    @JsonKey(name: 'groups') @Default(<String>[]) List<String> groups,
    @JsonKey(name: 'serviceId') ServiceId? serviceId,

}) = _NetworkService;

  factory NetworkService.fromJson(Map<String, dynamic> json) =>
      _$NetworkServiceFromJson(json);
}
