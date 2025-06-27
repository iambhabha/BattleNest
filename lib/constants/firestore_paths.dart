import 'package:tournament_app/env/env.dart';

class FirestorePaths {
  /// Returns: dev_tournament_dropdowns/football
  static String dropdownPath(String type) => Env.config.dropdownPath(type);

  /// Returns: dev_homepage
  static String get homepagePath => Env.config.homepagePath;

  static String get config => Env.config.config;

  static String get appSettings => Env.config.appSettings;
}
