import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_app/constants/light_theme.dart';
import 'package:tournament_app/constants/dark_theme.dart';
import 'package:tournament_app/services/app_localizations.dart';
import 'package:tournament_app/ui/screens/auth/store/auth_store.dart';
import 'package:tournament_app/stores/theme_store.dart';
import 'package:tournament_app/ui/screens/homepage/store/home_navigation_view_model.dart';

import 'package:tournament_app/ui/screens/tournament/create_tournament_screen.dart';
import 'package:tournament_app/ui/screens/homepage/homepage_screen.dart';
import 'package:tournament_app/ui/screens/tournament/store/tournament_dropdown_store.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp();
    await ScreenUtil.ensureScreenSize();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF111622),
        statusBarIconBrightness: Brightness.light, // Android ke liye
        statusBarBrightness: Brightness.dark, // iOS ke liye
      ),
    );
    // Register services and stores
    getIt.registerSingleton<ThemeStore>(ThemeStore());
    getIt.registerSingleton<AuthStore>(AuthStore()..init());
    getIt.registerSingleton<TournamentDropdownStore>(TournamentDropdownStore());
    getIt.registerSingleton<HomeNavigationViewModel>(HomeNavigationViewModel());

    runApp(const MyApp());
  } catch (e, stackTrace) {
    developer.log('Error during initialization', error: e, stackTrace: stackTrace);
    runApp(MaterialApp(home: Scaffold(body: Center(child: Text('Initialization error: $e')))));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = GetIt.I<ThemeStore>();
    final authStore = GetIt.I<AuthStore>();
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Observer(
      builder: (_) {
        final themeMode = themeStore.themeMode;
        final isLoggedIn = authStore.currentUser != null;

        return MaterialApp(
          title: 'Tournament App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('hi'), // Hindi
          ],
          locale: const Locale('en'), // Default to English
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            // If not supported, use the first one (English) as fallback
            return supportedLocales.first;
          },
          home:
              !isLoggedIn
                  ? G4GHomeScreen(navViewModel: GetIt.I<HomeNavigationViewModel>())
                  : const CreateTournamentScreen(),
        );
      },
    );
  }
}
