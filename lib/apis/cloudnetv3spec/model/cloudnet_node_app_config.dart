import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloudnet_node_app_config.freezed.dart';

part 'cloudnet_node_app_config.g.dart';

@freezed
class CloudNetAppConfig with _$CloudNetAppConfig {
  const factory CloudNetAppConfig({
    @JsonKey(name: 'app_icon') @Default('') String appIcon,
  }) = _CloudNetAppConfig;

  factory CloudNetAppConfig.fromJson(Map<String, dynamic> json) =>
      _$CloudNetAppConfigFromJson(json);
}