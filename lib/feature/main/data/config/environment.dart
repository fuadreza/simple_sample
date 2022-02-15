
import 'package:simple_sample/feature/main/data/config/base_config.dart';
import 'package:simple_sample/feature/main/data/config/dev_config.dart';
import 'package:simple_sample/feature/main/data/config/prod_config.dart';
import 'package:simple_sample/feature/main/data/config/staging_config.dart';

enum Env {
  DEV,
  STAGING,
  PROD
}

final Environment environment = Environment.instance;

class Environment {

  static final Environment _instance = Environment();

  static Environment get instance => _instance;

  BaseConfig? config;

  initConfig(Env environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(Env environment) {
    switch (environment) {
      case Env.PROD:
        return ProdConfig();
      case Env.STAGING:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}