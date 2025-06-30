import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_app/constants/dark_theme.dart';
import 'package:tournament_app/constants/light_theme.dart';
import 'package:tournament_app/core/di/setup_locator.dart';
import 'package:tournament_app/core/utils/app_logger.dart';
import 'package:tournament_app/env/env.dart';
import 'package:tournament_app/features/screens/auth/store/auth_store.dart';
import 'package:tournament_app/features/screens/homepage/homepage_screen.dart';
import 'package:tournament_app/features/screens/homepage/store/home_navigation_view_model.dart';
import 'package:tournament_app/features/screens/tournament/create_tournament_screen.dart';
import 'package:tournament_app/services/app_localizations.dart';
import 'package:tournament_app/stores/theme_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Env.setEnv('dev');
  await dotenv.load();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  AppLogger.init(isDebug: kDebugMode);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF111622),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  setupLocator();

  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

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
                  ? HomeScreen(
                    navigationViewModel: GetIt.I<HomeNavigationViewModel>(),
                  )
                  : const CreateTournamentScreen(),
        );
      },
    );
  }
}
