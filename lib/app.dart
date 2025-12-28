import 'package:flutter/material.dart';
import 'package:minigram/theme/app_theme.dart';
import 'package:minigram/providers/app_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        // Add other providers here as needed
      ],
      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return MaterialApp(
            title: 'Minigram',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appProvider.themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              // Add your routes here
              // '/': (context) => HomeScreen(),
              // '/chat': (context) => ChatScreen(),
            },
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Minigram'),
              ),
              body: const Center(
                child: Text('Welcome to Minigram!'),
              ),
            ),
          );
        },
      ),
    );
  }
}
