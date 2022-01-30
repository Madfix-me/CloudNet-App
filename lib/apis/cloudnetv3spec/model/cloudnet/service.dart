import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/host_and_port.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/process_snapshot.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_configuration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';

part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'creationTime') BigInt? creationTime,
    @JsonKey(name: 'address') HostAndPort? address,
    @JsonKey(name: 'connectAddress') HostAndPort? connectAddress,
    @JsonKey(name: 'processSnapshot') ProcessSnapshot? processSnapshot,
    @JsonKey(name: 'connectedTime') BigInt? connectedTime,
    @JsonKey(name: 'configuration') ServiceConfiguration? configuration,
    @JsonKey(name: 'lifeCycle') String? lifeCycle,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
