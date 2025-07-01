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
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/constants/dark_theme.dart';
import 'package:tournament_app/constants/light_theme.dart';
import 'package:tournament_app/core/di/setup_locator.dart';
import 'package:tournament_app/core/utils/app_logger.dart';
import 'package:tournament_app/env/env.dart';
import 'package:tournament_app/features/auth/store/auth_store.dart';
import 'package:tournament_app/features/chat/services/support_chat_client.dart';
import 'package:tournament_app/features/homepage/homepage_screen.dart';
import 'package:tournament_app/features/homepage/store/home_navigation_view_model.dart';
import 'package:tournament_app/features/tournament/create_tournament_screen.dart';
import 'package:tournament_app/services/app_localizations.dart';
import 'package:tournament_app/stores/theme_store.dart';

void main() async {
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

  setupLocator(); // Register GetIt stores

  runApp(const RootApp()); // Don't pass StreamChatClient here
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeStore = GetIt.I<ThemeStore>();
    final authStore = GetIt.I<AuthStore>();
    final streamClient = GetIt.I<SupportChatClient>();

    return MaterialApp(
      title: 'Tournament App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('hi')],
      locale: const Locale('en'),
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(360, 690));
        return StreamChat(client: streamClient.client, child: child!);
      },
      home: Observer(
        builder: (_) {
          final isLoggedIn = authStore.currentUser != null;
          return isLoggedIn
              ? const CreateTournamentScreen()
              : HomeScreen(navigationViewModel: GetIt.I<HomeNavigationViewModel>());
        },
      ),
    );
  }
}
