import 'package:flutter/material.dart';
import 'package:minigram/providers/theme_provider.dart';
import 'package:minigram/providers/auth_provider.dart';
import 'package:minigram/screens/main_layout.dart';
import 'package:minigram/screens/login_screen.dart';
import 'package:minigram/theme/app_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Minigram',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark, // Force dark for now to avoid theme errors
            debugShowCheckedModeBanner: false,
            
            home: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                // For now, always show MainLayout to test
                // You can add auth logic later
                return const MainLayout();
                
                // Uncomment this when auth is working:
                // if (authProvider.isAuthenticated) {
                //   return const MainLayout();
                // } else {
                //   return const LoginScreen();
                // }
              },
            ),
          );
        },
      ),
    );
  }
}
