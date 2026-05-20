import 'package:flutter/material.dart';

class AppColors {
  static const Color honey = Color(0xFFD4A373);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkBrown = Color(0xFF3E2723);
  static const Color gold = Color(0xFFC5A059);
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.honey,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.light(primary: AppColors.honey, secondary: AppColors.gold),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.honey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
