import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tournament_app/constants/app_color.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.blue[300]!,
    secondary: Colors.blue[200]!,
    surface: ColorSchemeX.primaryColorDark,
    error: Colors.red[300]!,
  ),
  scaffoldBackgroundColor: ColorSchemeX.primaryColorDark,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: ColorSchemeX.primaryColorDark,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white70),
    titleTextStyle: const TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w600),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: ColorSchemeX.primaryColorDark,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.white70),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary, buttonColor: Colors.white),
);
