

import 'package:simple_sample/core/config/base_config.dart';
import 'package:simple_sample/core/config/dev_config.dart';
import 'package:simple_sample/core/config/prod_config.dart';
import 'package:simple_sample/core/config/staging_config.dart';

enum Env {
  DEV,
  STAGING,
  PROD
}

final Environment environment = Environment.instance;

class Environment {

  static final Environment _instance = Environment();

  static Environment get instance => _instance;

  BaseConfig config = DevConfig();

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
