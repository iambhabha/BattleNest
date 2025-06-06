import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode _themeMode = ThemeMode.system;

  @computed
  ThemeMode get themeMode => _themeMode;

  @computed
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  @action
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
  }

  @action
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
