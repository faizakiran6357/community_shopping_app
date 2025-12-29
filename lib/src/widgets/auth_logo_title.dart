import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class AuthLogoTitle extends StatelessWidget {
  const AuthLogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ===============================
        // LOGO
        // ===============================
        Image.asset(
          'assets/images/shopping_icon.png',
          width: 139.82, 
          height: 80.02,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 12),
        // ===============================
        // APP TITLE
        // ===============================
       Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: 'Community ',
        style: StyleRefer.roundKeySoftBold.copyWith(
          fontSize: 28,
          color: AppColors.black,
        ),
      ),
      TextSpan(
        text: 'Shopping',
        style: StyleRefer.roundKeySoftBold.copyWith(
          fontSize: 28,
          color: AppColors.primary,
        ),
      ),
    ],
  ),
),

      ],
    );
  }
}
