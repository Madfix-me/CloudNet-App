import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/cloud_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_player_response.freezed.dart';
part 'cloud_player_response.g.dart';

@freezed
class CloudPlayerResponse with _$CloudPlayerResponse {
  const factory CloudPlayerResponse({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'player') CloudPlayer? player,
  }) = _CloudPlayerResponse;

  factory CloudPlayerResponse.fromJson(Map<String, dynamic> json) =>
      _$CloudPlayerResponseFromJson(json);
}
