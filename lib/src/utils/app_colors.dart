import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ===============================
  // PRIMARY COLORS
  // ===============================
  static const Color primary = Color(0xFF0142FA);
  static const Color signUpBlue = Color(0xFF0135D7);

  // ===============================
  // TEXT COLORS
  // ===============================
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF6C6C6C);
  static const Color hintGrey = Color(0xFFA4A4A4);
  static const Color lightGrey = Color(0xFFAAAAAA);
  static const Color lightgrey = Color(0xFFB6B6B6);
   static const Color whitegrey = Color(0xFFDBDBDB);
  

  // ===============================
  // BACKGROUND / SURFACE
  // ===============================
  static const Color white = Color(0xFFFDFDFD);

  // ===============================
  // BUTTON GRADIENT (AUTH)
  // ===============================
  static const LinearGradient primaryButtonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF001D99),
      Color(0xFF0043FE),
    ],
  );
}
