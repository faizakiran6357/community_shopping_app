import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class ThemeCollection {
  ThemeCollection._();

  // ===============================
  // LIGHT THEME
  // ===============================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    fontFamily: 'RobotoRegular',

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(
        fontFamily: 'RobotoMedium',
        fontSize: 18,
        color: AppColors.black,
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: StyleRefer.robotoBold.copyWith(color: AppColors.black),
      headlineMedium:
          StyleRefer.robotoSemiBold.copyWith(color: AppColors.black),
      bodyLarge:
          StyleRefer.robotoRegular.copyWith(color: AppColors.black),
      bodyMedium:
          StyleRefer.robotoRegular.copyWith(color: AppColors.grey),
      bodySmall:
          StyleRefer.robotoRegular.copyWith(color: AppColors.hintGrey),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      hintStyle:
          StyleRefer.robotoRegular.copyWith(color: AppColors.hintGrey),
    ),
  );

  // ===============================
  // DARK THEME
  // ===============================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.primary,
    fontFamily: 'RobotoRegular',

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.black,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        fontFamily: 'RobotoMedium',
        fontSize: 18,
        color: AppColors.white,
      ),
    ),

    textTheme: TextTheme(
      headlineLarge:
          StyleRefer.robotoBold.copyWith(color: AppColors.white),
      headlineMedium:
          StyleRefer.robotoSemiBold.copyWith(color: AppColors.white),
      bodyLarge:
          StyleRefer.robotoRegular.copyWith(color: AppColors.white),
      bodyMedium:
          StyleRefer.robotoRegular.copyWith(color: AppColors.lightGrey),
      bodySmall:
          StyleRefer.robotoRegular.copyWith(color: AppColors.hintGrey),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.black,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      hintStyle:
          StyleRefer.robotoRegular.copyWith(color: AppColors.hintGrey),
    ),
  );
}
