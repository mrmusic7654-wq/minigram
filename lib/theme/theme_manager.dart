import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  // Primary brand color (gold-style)
  final Color _primaryColor = Colors.amber;

  ThemeMode get themeMode => _themeMode;

  Color get primaryColor => _primaryColor;

  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      colorScheme: ColorScheme.dark(
        primary: _primaryColor,
        secondary: _primaryColor,
      ),
      scaffoldBackgroundColor: Colors.black,
    );
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
