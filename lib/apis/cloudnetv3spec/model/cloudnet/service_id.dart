import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/environment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_id.freezed.dart';
part 'service_id.g.dart';

@freezed
class ServiceId with _$ServiceId {

  const factory ServiceId({
    @JsonKey(name: 'taskName') String? taskName,
    @JsonKey(name: 'nameSplitter') String? nameSplitter,
    @JsonKey(name: 'environmentName') String? environmentName,
    @JsonKey(name: 'allowedNodes') @Default(<String>[]) List<String>? allowedNodes,
    @JsonKey(name: 'uniqueId') String? uniqueId,
    @JsonKey(name: 'taskServiceId') int? taskServiceId,
    @JsonKey(name: 'nodeUniqueId') String? nodeUniqueId,
    @JsonKey(name: 'environment') Environment? environment,

}) = _ServiceId;

  factory ServiceId.fromJson(Map<String, dynamic> json) =>
      _$ServiceIdFromJson(json);
}
