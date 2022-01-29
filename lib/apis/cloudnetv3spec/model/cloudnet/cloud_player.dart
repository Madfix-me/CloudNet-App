import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_player.freezed.dart';

part 'cloud_player.g.dart';

@freezed
class CloudPlayer with _$CloudPlayer {
  const factory CloudPlayer() = _CloudPlayer;

  factory CloudPlayer.fromJson(Map<String, dynamic> json) =>
      _$CloudPlayerFromJson(json);
}
