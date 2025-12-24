import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.gold;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode theme) {
    _themeMode = theme;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = ThemeMode.values[(_themeMode.index + 1) % ThemeMode.values.length];
    notifyListeners();
  }
}