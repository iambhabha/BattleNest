class FirestorePaths {
  static const String masterConfig = 'master_config';
  static const String tournamentDropdowns = 'tournament_dropdowns';
  static const String homepage = 'homepage';

  static String getDropdownCollectionPath(String type) => '$masterConfig/$tournamentDropdowns/$type';
}
