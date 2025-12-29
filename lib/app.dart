import 'package:flutter/material.dart';
import 'package:minigram/providers/app_provider.dart';
import 'package:minigram/providers/auth_provider.dart';
import 'package:minigram/providers/chat_provider.dart';
import 'package:minigram/providers/contacts_provider.dart';
import 'package:minigram/providers/theme_provider.dart';
import 'package:minigram/screens/splash_screen.dart';
import 'package:minigram/screens/login_screen.dart';
import 'package:minigram/screens/main_layout.dart';
import 'package:minigram/theme/app_theme.dart';
import 'package:minigram/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => ContactsProvider()),
        // Add other providers as needed
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Minigram',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            
            // Define your routes
            routes: {
              '/login': (context) => const LoginScreen(),
              '/main': (context) => const MainLayout(),
              // Add other routes as needed
            },
            
            home: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                // Show splash screen while initializing
                if (authProvider.isInitializing) {
                  return const SplashScreen();
                }
                
                // Check if user is logged in
                if (authProvider.isAuthenticated) {
                  return const MainLayout();
                } else {
                  return const LoginScreen();
                }
              },
            ),
            
            // Customize transitions
            onGenerateRoute: (settings) {
              // You can add custom route transitions here
              return null; // Fallback to routes map
            },
          );
        },
      ),
    );
  }
}
