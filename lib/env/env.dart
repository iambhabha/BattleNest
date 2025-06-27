import 'package:tournament_app/env/base_env_config.dart';
import 'package:tournament_app/env/dev_config.dart';
import 'package:tournament_app/env/prod_config.dart';
import 'package:tournament_app/env/staging_config.dart';

class Env {
  static late BaseEnvConfig config;

  static void setEnv(String envName) {
    switch (envName) {
      case 'dev':
        config = DevConfig();
        break;
      case 'staging':
        config = StagingConfig();
        break;
      case 'prod':
        config = ProdConfig();
        break;
      default:
        throw Exception('Invalid environment: $envName');
    }
  }
}
