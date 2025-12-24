// lib/theme/theme_manager.dart
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _currentMode = ThemeMode.gold;
  
  ThemeMode get currentMode => _currentMode;
  
  set currentMode(ThemeMode mode) {
    _currentMode = mode;
    notifyListeners();
  }
  
  ThemeData get currentTheme {
    switch (_currentMode) {
      case ThemeMode.gold:
        return _buildGoldTheme();
      case ThemeMode.dark:
        return _buildDarkTheme();
      case ThemeMode.light:
        return _buildLightTheme();
    }
  }
  
  Color get primaryColor {
    switch (_currentMode) {
      case ThemeMode.gold:
        return const Color(0xFFF7931A);
      case ThemeMode.dark:
        return const Color(0xFF00f3ff);
      case ThemeMode.light:
        return const Color(0xFF3b82f6);
    }
  }
  
  ThemeData _buildGoldTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0xFFF7931A),
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFF7931A),
        secondary: Color(0xFF2a1d0a),
        surface: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF7931A),
          letterSpacing: 1.5,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
  
  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF00f3ff),
      scaffoldBackgroundColor: const Color(0xFF0f172a),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF00f3ff),
        secondary: Color(0xFF1e293b),
        surface: Color(0xFF0f172a),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF00f3ff),
          letterSpacing: 1.5,
        ),
      ),
    );
  }
  
  ThemeData _buildLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: const Color(0xFF3b82f6),
      scaffoldBackgroundColor: const Color(0xFFf8fafc),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF3b82f6),
        secondary: Color(0xFFf1f5f9),
        surface: Colors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1e293b),
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}