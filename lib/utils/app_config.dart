enum Environment { alpha, beta, store }

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  late _Config _config;

  void setEnvironment(Environment env) {
    switch (env) {
      case Environment.alpha:
        _config = _Config.envAlpha();
        break;
      case Environment.beta:
        _config = _Config.envBeta();
        break;
      case Environment.store:
        _config = _Config.envStore();
        break;
    }
  }

  bool get isAlpha => _config.isAlpha;

  bool get isBeta => _config.isBeta;

  String get appName => _config.appName;
}

class _Config {
  _Config._({
    required this.isAlpha,
    required this.isBeta,
    required this.appName,
  });

  factory _Config.envAlpha() => _Config._(
        isAlpha: true,
        isBeta: false,
        appName: 'CloudNet-Alpha',
      );

  factory _Config.envBeta() => _Config._(
        isAlpha: false,
        isBeta: true,
        appName: 'CloudNet-Beta',
      );

  factory _Config.envStore() => _Config._(
        isAlpha: false,
        isBeta: false,
        appName: 'CloudNet',
      );

  final bool isAlpha;
  final bool isBeta;
  final String appName;
}
