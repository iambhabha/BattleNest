abstract class BaseEnvConfig {
  /// Already includes underscore, e.g., "dev_", "prod_", etc.
  String get envKey;

  // Shared collection/document names
  static const String masterConfig = 'master_config';
  static const String tournamentDropdowns = 'tournament_dropdowns';
  static const String homepage = 'homepage';

  // ✅ Just use envKey directly, no extra underscore
  String get masterConfigPath => '$envKey$masterConfig';

  String get homepagePath => '$envKey$homepage';

  String dropdownPath(String type) => '$masterConfigPath/$tournamentDropdowns/$type';
}
