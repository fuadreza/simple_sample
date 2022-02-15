
import 'package:simple_sample/feature/main/data/config/base_config.dart';

class DevConfig implements BaseConfig {

  @override
  String get apiHost => 'localhost';

  @override
  String get apiPort => '8080';

}