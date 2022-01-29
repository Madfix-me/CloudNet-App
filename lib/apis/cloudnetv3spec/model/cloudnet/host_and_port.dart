import 'package:freezed_annotation/freezed_annotation.dart';

part 'host_and_port.freezed.dart';
part 'host_and_port.g.dart';

@freezed
class HostAndPort with _$HostAndPort {
  factory HostAndPort({
    @JsonKey(name: 'host') String? host,
    @JsonKey(name: 'port') int? port,
  }) = _HostAndPort;

  factory HostAndPort.fromJson(Map<String, dynamic> json) =>
      _$HostAndPortFromJson(json);
}
