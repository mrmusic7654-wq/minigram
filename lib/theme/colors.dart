import 'package:flutter/material.dart';

class AppColors {
  // Gold Theme
  static const Color goldPrimary = Color(0xFFF7931A);
  static const Color goldDark = Color(0xFF101010);
  static const Color goldAccent = Color(0xFF2a1d0a);
  static const Color goldSurface = Color(0xFF1f1f1f);

  // Dark Theme
  static const Color darkPrimary = Color(0xFF00f3ff);
  static const Color darkBackground = Color(0xFF0f172a);
  static const Color darkSurface = Color(0xFF1e293b);
  static const Color darkAccent = Color(0xFF1e40af);

  // Light Theme
  static const Color lightPrimary = Color(0xFF3b82f6);
  static const Color lightBackground = Color(0xFFf8fafc);
  static const Color lightSurface = Colors.white;
  static const Color lightAccent = Color(0xFFf1f5f9);

  // Common
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static const Color yellow = Colors.yellow;

  // Message Bubbles
  static const Color sentMessage = goldPrimary;
  static const Color receivedMessage = Color(0xFF2d2d2d);
  static const Color voiceMessageBg = Color(0xFF3a3a3a);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFa0a0a0);
  static const Color textDisabled = Color(0xFF666666);
}

class ThemeColors {
  static Map<String, Color> get goldTheme => {
    'primary': AppColors.goldPrimary,
    'background': AppColors.goldDark,
    'surface': AppColors.goldSurface,
    'accent': AppColors.goldAccent,
    'text': AppColors.white,
  };

  static Map<String, Color> get darkTheme => {
    'primary': AppColors.darkPrimary,
    'background': AppColors.darkBackground,
    'surface': AppColors.darkSurface,
    'accent': AppColors.darkAccent,
    'text': AppColors.white,
  };

  static Map<String, Color> get lightTheme => {
    'primary': AppColors.lightPrimary,
    'background': AppColors.lightBackground,
    'surface': AppColors.lightSurface,
    'accent': AppColors.lightAccent,
    'text': AppColors.black,
  };
}
