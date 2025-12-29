import 'package:flutter/material.dart';

// Custom theme mode for your app
enum AppThemeMode { light, dark, gold }

class ThemeManager {
  static AppThemeMode _currentMode = AppThemeMode.gold;
  
  static AppThemeMode get currentMode => _currentMode;
  
  static void setThemeMode(AppThemeMode mode) {
    _currentMode = mode;
  }
  
  static ThemeData getThemeData(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return _buildLightTheme();
      case AppThemeMode.dark:
        return _buildDarkTheme();
      case AppThemeMode.gold:
        return _buildGoldTheme();
    }
  }
  
  static ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.orange,
      ),
      // Add more light theme properties
    );
  }
  
  static ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueAccent,
      colorScheme: ColorScheme.dark(
        primary: Colors.blueAccent,
        secondary: Colors.orangeAccent,
      ),
      // Add more dark theme properties
    );
  }
  
  static ThemeData _buildGoldTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFFD4AF37), // Gold color
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFD4AF37),
        secondary: Color(0xFFFFD700),
        surface: Color(0xFF1E1E1E),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A1A1A),
        foregroundColor: Color(0xFFD4AF37),
      ),
      // Add circuit-themed decorations
    );
  }
}
