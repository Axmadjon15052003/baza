import 'package:flutter/material.dart';

class ThemeManager {
  static darkTheme() => ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
  static ThemeManager? _instance;
  late ThemeData _themeData;
  ThemeManager._internal() {
    _themeData = ThemeData.light();
  }

  factory ThemeManager() {
    if (_instance == null) {
      _instance = ThemeManager._internal();
    }
    return _instance!;
  }
  void setTheme(ThemeData themeData) {
    _themeData = themeData;
  }

  ThemeData get themeData => _themeData;
}
