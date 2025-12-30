import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'splash_logic.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});


  @override
  Widget build(BuildContext context) {
    final SplashLogic logic = Get.put(SplashLogic());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),

              // ===============================
              // LOGO
              // ===============================
              Image.asset(
                shopping,
               width: 48.w,
               height: 12.7.h,
                fit: BoxFit.contain,
              ),

              1.18.h.height,


              // ===============================
              // TITLE
              // ===============================
            
               Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                            text: 'Community ',
                       style: StyleRefer.roundKeySoftBold.copyWith(
                       fontSize: 26.sp,
                       letterSpacing: 0.44, // 1%
                      color: AppColors.black,
                       ),
                   ),
            TextSpan(
            text: 'Shopping',
             style: StyleRefer.roundKeySoftBold.copyWith(
             fontSize: 26.sp,
             letterSpacing: 0.44, // 1%
             color: AppColors.primary,
             ),
            ),
         ],
      ),
    ),

              const Spacer(),

              // ===============================
              // SIGN IN BUTTON
              // ===============================
              CustomButton(
                title: 'Sign in',
                onPressed: logic.onSignIn,
              ),
               1.9.h.height,


              // ===============================
              // SIGN UP BUTTON (WHITE)
              // ===============================
                CustomButton(
                   title: 'Sign up',
                   type: ButtonType.outlined,
                   onPressed: logic.onSignUp,
                ),

               2.h.height

            ],
          ),
        ),
      ),
    );
  }
}
