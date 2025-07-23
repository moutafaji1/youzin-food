import 'package:flutter/material.dart';

class DarkTheme {
  // ألوان الثيم الداكن
  static const Color primaryDark = Color(0xFF121212); // خلفية رئيسية داكنة جداً
  static const Color surfaceDark = Color(0xFF1E1E1E); // خلفية البطاقات
  static const Color cardDark = Color(0xFF2D2D2D); // لون البطاقات
  static const Color accentGold = Color(0xFFFFB800); // لون التمييز الذهبي
  static const Color accentOrange = Color(0xFFFF8C00); // برتقالي للتمييز
  static const Color textPrimary = Color(0xFFFFFFFF); // نص أبيض
  static const Color textSecondary = Color(0xFFB3B3B3); // نص رمادي فاتح
  static const Color textMuted = Color(0xFF8A8A8A); // نص خافت
  static const Color dividerColor = Color(0xFF3A3A3A); // خطوط الفصل
  static const Color errorColor = Color(0xFFFF5252); // لون الخطأ
  static const Color successColor = Color(0xFF4CAF50); // لون النجاح

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // الألوان الأساسية
      colorScheme: const ColorScheme.dark(
        primary: accentGold,
        secondary: accentOrange,
        surface: surfaceDark,
        background: primaryDark,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        onSurface: textPrimary,
        onBackground: textPrimary,
        error: errorColor,
        onError: Colors.white,
      ),

      // خلفية التطبيق
      scaffoldBackgroundColor: primaryDark,

      // ثيم AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryDark,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: textPrimary,
        ),
      ),

      // ثيم البطاقات
      cardTheme: CardThemeData(
        color: cardDark,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),

      // ثيم الأزرار المرفوعة
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentGold,
          foregroundColor: Colors.black,
          elevation: 6,
          shadowColor: accentGold.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ثيم الأزرار المحددة
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accentGold,
          side: const BorderSide(color: accentGold, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),

      // ثيم الأزرار النصية
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: accentGold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // ثيم الأزرار العائمة
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentGold,
        foregroundColor: Colors.black,
        elevation: 8,
      ),

      // ثيم الأيقونات
      iconTheme: const IconThemeData(
        color: textPrimary,
        size: 24,
      ),

      // ثيم النصوص
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: textMuted,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          color: textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: textMuted,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),

      // ثيم الخطوط الفاصلة
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 16,
      ),

      // ثيم الحاويات
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceDark,
        selectedItemColor: accentGold,
        unselectedItemColor: textMuted,
        type: BottomNavigationBarType.fixed,
      ),

      // ثيم الحوارات
      dialogTheme: DialogThemeData(
        backgroundColor: cardDark,
        titleTextStyle: const TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(
          color: textSecondary,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // ثيم الـ Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: cardDark,
        contentTextStyle: const TextStyle(
          color: textPrimary,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
