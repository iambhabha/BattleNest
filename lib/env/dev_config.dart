import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tournament_app/env/base_env_config.dart';

class DevConfig extends BaseEnvConfig {
  @override
  String get envKey => 'dev_';

  @override
  String get streamKey => dotenv.env['STREAM_API'] ?? '';

  @override
  String get streamSecret => dotenv.env['STREAM_SECRET'] ?? '';
}
