import 'package:flutter/material.dart';
import 'package:minigram/theme/theme_manager.dart';

class ThemeProvider with ChangeNotifier {
  AppThemeMode _themeMode = AppThemeMode.gold;
  
  AppThemeMode get themeMode => _themeMode;
  
  // Get Flutter's ThemeMode for MaterialApp
  ThemeMode get flutterThemeMode {
    switch (_themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.gold:
        return ThemeMode.dark; // Gold theme uses dark base
    }
  }
  
  ThemeData get currentTheme => ThemeManager.getThemeData(_themeMode);
  
  void setThemeMode(AppThemeMode mode) {
    _themeMode = mode;
    ThemeManager.setThemeMode(mode);
    notifyListeners();
  }
  
  void toggleTheme() {
    switch (_themeMode) {
      case AppThemeMode.light:
        _themeMode = AppThemeMode.dark;
        break;
      case AppThemeMode.dark:
        _themeMode = AppThemeMode.gold;
        break;
      case AppThemeMode.gold:
        _themeMode = AppThemeMode.light;
        break;
    }
    ThemeManager.setThemeMode(_themeMode);
    notifyListeners();
  }
}
