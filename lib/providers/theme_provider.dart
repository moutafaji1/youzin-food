import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/dark_theme.dart';

class ThemeProvider with ChangeNotifier {
  // Always use dark theme for modern look
  ThemeData get currentTheme => DarkTheme.darkTheme;

  // Set system UI overlay style for dark theme
  void initializeTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColor: const Color(0xFF4A90E2),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      bodySmall: TextStyle(color: Colors.black54),
      titleLarge: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      titleMedium:
          TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      headlineMedium:
          TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    ),
  );
}
