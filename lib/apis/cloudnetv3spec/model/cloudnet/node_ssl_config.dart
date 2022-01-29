import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_ssl_config.freezed.dart';
part 'node_ssl_config.g.dart';

@freezed
class NodeSSLConfig with _$NodeSSLConfig {
  const factory NodeSSLConfig({
    @JsonKey(name: 'enabled') bool? enabled,
    @JsonKey(name: 'clientAuth') bool? clientAuth,
    @JsonKey(name: 'trustCertificatePath') String? trustCertificatePath,
    @JsonKey(name: 'certificatePath') String? certificatePath,
    @JsonKey(name: 'privateKeyPath') String? privateKeyPath,
  }) = _NodeSSLConfig;

  factory NodeSSLConfig.fromJson(Map<String, dynamic> json) =>
      _$NodeSSLConfigFromJson(json);
}
