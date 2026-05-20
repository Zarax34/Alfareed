import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryHoney = Color(0xFFD4A373);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF3E2723);
  static const Color accentGold = Color(0xFFC5A059);
  static const Color errorRed = Color(0xFFD32F2F);
  static const Color successGreen = Color(0xFF388E3C);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryHoney,
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryHoney,
        secondary: AppColors.accentGold,
        surface: AppColors.backgroundWhite,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 24),
        bodyMedium: TextStyle(color: AppColors.textDark, fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryHoney,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
