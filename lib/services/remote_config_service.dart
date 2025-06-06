import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'dart:convert';

class RemoteConfigService {
  static final RemoteConfigService _instance = RemoteConfigService._internal();
  factory RemoteConfigService() => _instance;
  RemoteConfigService._internal();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      minimumFetchInterval: const Duration(minutes: 5),
      fetchTimeout: const Duration(seconds: 10),
    ));

    await _remoteConfig.setDefaults({
      'translations': jsonEncode({
        'en': {
          'welcomeText': 'Welcome to BGMI Tournaments',
          'googleSignIn': 'Sign in with Google',
          'facebookSignIn': 'Sign in with Facebook',
          'appleSignIn': 'Sign in with Apple',
          // Add more default translations here
        },
        'hi': {
          'welcomeText': 'BGMI टूर्नामेंट्स में स्वागत है',
          'googleSignIn': 'Google से लॉगिन करें',
          'facebookSignIn': 'Facebook से लॉगिन करें',
          'appleSignIn': 'Apple से लॉगिन करें',
          // Add more Hindi translations here
        }
      }),
    });

    await fetchTranslations();
  }

  Future<void> fetchTranslations() async {
    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      print('Failed to fetch translations: $e');
    }
  }

  Map<String, dynamic> getTranslations(String locale) {
    final translationsJson = _remoteConfig.getString('translations');
    final translations = jsonDecode(translationsJson) as Map<String, dynamic>;
    return translations[locale] as Map<String, dynamic>;
  }
}
