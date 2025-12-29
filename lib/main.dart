import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_state.dart';
import 'theme/theme_manager.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MinigramApp());
}

class MinigramApp extends StatelessWidget {
  const MinigramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeManager.themeData,
            darkTheme: themeManager.themeData,
            themeMode: themeManager.themeMode,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
