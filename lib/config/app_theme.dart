import 'package:coodig_mobile/config/color.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    primaryColor: CoodigColors.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CoodigColors.buttonPrimary,
      ),
    ),
    textTheme: const TextTheme(),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ),
  );
}
