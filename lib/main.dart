import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';
import 'theme/theme_manager.dart';
import 'screens/splash_screen.dart';
import 'screens/main_layout.dart';

void main() {
  runApp(const MinigramApp());
}

class MinigramApp extends StatelessWidget {
  const MinigramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(
          create: (_) => ThemeManager(),
        ),
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Minigram',
            theme: themeManager.lightTheme,
            darkTheme: themeManager.darkTheme,
            themeMode: themeManager.themeMode,
            home: const SplashScreen(),
            routes: {
              '/home': (context) => const MainLayout(),
            },
          );
        },
      ),
    );
  }
}
