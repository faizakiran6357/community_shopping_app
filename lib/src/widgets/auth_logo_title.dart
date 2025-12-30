import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
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
            shopping,
             width: 38.8.w,
             height: 10.h,
             fit: BoxFit.contain,
            ),

         1.2.h.height,

        // ===============================
        // APP TITLE
        // ===============================
       Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: 'Community ',
        style: StyleRefer.roundKeySoftBold.copyWith(
          fontSize: 20.sp,
          color: AppColors.black,
        ),
      ),
      TextSpan(
        text: 'Shopping',
        style: StyleRefer.roundKeySoftBold.copyWith(
          fontSize: 20.sp,
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
