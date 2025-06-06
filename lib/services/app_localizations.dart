import 'package:flutter/material.dart';

/// Simple localization class with direct string properties
class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);
  
  // Helper method to get the localizations
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  
  // Common strings
  String get appName => 'Tournament App';
  String get loading => 'Loading...';
  String get errorOccurred => 'An error occurred';
  
  // Login Screen
  String get welcomeBack => 'Hello,\nWelcome Back';
  String get lightTheme => 'Switch to light theme';
  String get darkTheme => 'Switch to dark theme';
  String get emailOrPhone => 'Email or Phone number';
  String get password => 'Password';
  String get forgotPassword => 'Forgot Password?';
  String get login => 'Login';
  String get createAccount => 'Create account';
  
  // Home Screen
  String get homeTitle => 'Home';
  String get welcomeMessage => 'Welcome';
  String get guestUser => 'Guest';
  String get signOut => 'Sign out';
  
  // Add more strings here as needed
}

/// Localizations delegate for Flutter
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

// List of supported locales
const List<Locale> supportedLocales = [
  Locale('en'), // English
  Locale('hi'), // Hindi
];

// Extension for easy access
// Usage: context.l10n.welcomeBack
extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
