import 'package:freezed_annotation/freezed_annotation.dart';

part 'smart_config.freezed.dart';
part 'smart_config.g.dart';

@freezed
class SmartConfig with _$SmartConfig {
  const factory SmartConfig({
    @JsonKey(name: 'enabled') @Default(false) bool enabled,
    @JsonKey(name: 'splitLogicallyOverNodes')
    @Default(true)
        bool splitLogicallyOverNodes,
    @JsonKey(name: 'directTemplatesAndInclusionsSetup')
    @Default(true)
        bool directTemplatesAndInclusionsSetup,
    @JsonKey(name: 'priority') @Default(10) int priority,
    @JsonKey(name: 'maxServices') @Default(-1) int maxServices,
    @JsonKey(name: 'preparedServices') @Default(0) int preparedServices,
    @JsonKey(name: 'smartMinServiceCount') @Default(0) int smartMinServiceCount,
    @JsonKey(name: 'autoStopTimeByUnusedServiceInSeconds')
    @Default(180)
        int autoStopTimeByUnusedServiceInSeconds,
    @JsonKey(name: 'percentOfPlayersToCheckShouldStopTheService')
    @Default(0)
        int percentOfPlayersToCheckShouldStopTheService,
    @JsonKey(name: 'forAnewInstanceDelayTimeInSeconds')
    @Default(300)
        int forAnewInstanceDelayTimeInSeconds,
    @JsonKey(name: 'percentOfPlayersForANewServiceByInstance')
    @Default(100)
        int percentOfPlayersForANewServiceByInstance,
    @JsonKey(name: 'templateInstaller')
    @Default('INSTALL_ALL')
        String templateInstaller,
  }) = _SmartConfig;

  factory SmartConfig.fromJson(Map<String, dynamic> json) =>
      _$SmartConfigFromJson(json);
}
