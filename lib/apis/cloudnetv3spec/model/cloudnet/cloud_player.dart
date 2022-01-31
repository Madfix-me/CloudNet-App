import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/network_player_proxy_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_player.freezed.dart';

part 'cloud_player.g.dart';

@freezed
class CloudPlayer with _$CloudPlayer {
  const factory CloudPlayer({
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'firstLoginTimeMillis') BigInt? firstLoginTimeMillis,
    @JsonKey(name: 'lastLoginTimeMillis') BigInt? lastLoginTimeMillis,
    @JsonKey(name: 'lastNetworkPlayerProxyInfo')
        NetworkPlayerProxyInfo? lastNetworkPlayerProxyInfo,
  }) = _CloudPlayer;

  factory CloudPlayer.fromJson(Map<String, dynamic> json) =>
      _$CloudPlayerFromJson(json);
}
