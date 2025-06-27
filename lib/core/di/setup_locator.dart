// 📁 lib/setup_locator.dart
import 'package:get_it/get_it.dart';
import 'package:tournament_app/stores/app_config_store.dart';
import 'package:tournament_app/stores/theme_store.dart';
import 'package:tournament_app/ui/screens/auth/store/auth_store.dart';
import 'package:tournament_app/ui/screens/homepage/store/home_content_store.dart';
import 'package:tournament_app/ui/screens/homepage/store/home_navigation_view_model.dart';
import 'package:tournament_app/ui/screens/tournament/store/tournament_dropdown_store.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<AppConfigStore>(AppConfigStore()..initConfig());
  getIt.registerSingleton<ThemeStore>(ThemeStore());
  getIt.registerSingleton<AuthStore>(AuthStore()..init());
  getIt.registerSingleton<TournamentDropdownStore>(TournamentDropdownStore());
  getIt.registerSingleton<HomeNavigationViewModel>(HomeNavigationViewModel());
  getIt.registerSingleton<HomeContentStore>(HomeContentStore());
}
