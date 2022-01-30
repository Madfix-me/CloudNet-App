import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/host_and_port.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/network_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_player_proxy_info.freezed.dart';

part 'network_player_proxy_info.g.dart';

@freezed
class NetworkPlayerProxyInfo with _$NetworkPlayerProxyInfo {

  const factory NetworkPlayerProxyInfo({
    @JsonKey(name: 'uniqueId') String? uniqueId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'xBoxId') String? xBoxId,
    @JsonKey(name: 'version') int? version,
    @JsonKey(name: 'address') HostAndPort? address,
    @JsonKey(name: 'listener') HostAndPort? listener,
    @JsonKey(name: 'onlineMode') bool? onlineMode,
    @JsonKey(name: 'networkService') NetworkService? networkService,
  }) = _NetworkPlayerProxyInfo;

  factory NetworkPlayerProxyInfo.fromJson(Map<String, dynamic> json) =>
      _$NetworkPlayerProxyInfoFromJson(json);
}
