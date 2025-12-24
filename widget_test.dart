import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minigram/main.dart';
import 'package:minigram/screens/splash_screen.dart';
import 'package:minigram/screens/login_screen.dart';
import 'package:minigram/screens/chat_list_screen.dart';

void main() {
  group('Minigram Widget Tests', () {
    testWidgets('App loads without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(const MinigramApp());
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('SplashScreen displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
      
      expect(find.text('MINIGRAM'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('LoginScreen has phone input field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
      
      expect(find.text('ACCESS NODE'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('INITIATE LOGIN'), findsOneWidget);
    });

    testWidgets('ChatListScreen displays app bar', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ChatListScreen()));
      
      expect(find.text('Minigram'), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Login button is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
      
      final loginButton = find.text('INITIATE LOGIN');
      expect(loginButton, findsOneWidget);
      
      await tester.tap(loginButton);
      await tester.pump();
      
      // Verify something happens after tap
      expect(find.text('INITIATE LOGIN'), findsOneWidget);
    });

    testWidgets('Theme colors are applied', (WidgetTester tester) async {
      await tester.pumpWidget(const MinigramApp());
      
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, isNotNull);
    });
  });
}