abstract class BaseEnvConfig {
  /// Already includes underscore, e.g., "dev_", "prod_", etc.
  String get envKey;

  // Shared collection/document names
  static const String masterConfig = 'master_config';
  static const String _config = 'config';
  static const String _appSettings = 'app_settings';
  static const String tournamentDropdowns = 'tournament_dropdowns';
  static const String homepage = 'homepage';
  static const String _homeContent = 'home_content';
  // Just use envKey directly, no extra underscore
  String get masterConfigPath => '$envKey$masterConfig';

  String get homepagePath => '$envKey$homepage';

  String get config => '$envKey$_config';
  String get appSettings => _appSettings;
  String get homeContent => "$envKey$_homeContent";

  String dropdownPath(String type) => '$tournamentDropdowns/$type';

  String get pathAppSetting => '$config/$_appSettings';
  String get streamKey;
  String get streamSecret;
}
