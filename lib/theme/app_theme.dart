import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFFF7931A),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Orbitron',
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFF7931A),
        secondary: Color(0xFF2a1d0a),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFFF7931A),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Orbitron',
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFF7931A),
        secondary: Color(0xFF2a1d0a),
      ),
    );
  }

  static ThemeData get goldTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFFF7931A),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Color(0xFFF7931A),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Orbitron',
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF7931A),
          letterSpacing: 2,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF7931A),
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFF7931A),
        secondary: Color(0xFF2a1d0a),
        surface: Color(0xFF101010),
      ),
    );
  }
}