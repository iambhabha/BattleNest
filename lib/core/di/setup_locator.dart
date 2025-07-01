// 📁 lib/setup_locator.dart
import 'package:get_it/get_it.dart';
import 'package:tournament_app/env/env.dart';
import 'package:tournament_app/features/auth/store/auth_store.dart';
import 'package:tournament_app/features/chat/services/support_chat_client.dart';
import 'package:tournament_app/features/chat/store/support_chat_store.dart';
import 'package:tournament_app/features/homepage/store/home_content_store.dart';
import 'package:tournament_app/features/homepage/store/home_navigation_view_model.dart';
import 'package:tournament_app/features/tournament/store/tournament_dropdown_store.dart';
import 'package:tournament_app/stores/app_config_store.dart';
import 'package:tournament_app/stores/theme_store.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => SupportChatClient(Env.config.streamKey));
  getIt.registerLazySingleton(() => SupportChatStore());
  getIt.registerSingleton<AppConfigStore>(AppConfigStore()..initConfig());
  getIt.registerSingleton<ThemeStore>(ThemeStore());
  getIt.registerSingleton<AuthStore>(AuthStore()..init());
  getIt.registerSingleton<TournamentDropdownStore>(TournamentDropdownStore());
  getIt.registerSingleton<HomeNavigationViewModel>(HomeNavigationViewModel());
  getIt.registerSingleton<HomeContentStore>(HomeContentStore());
}
