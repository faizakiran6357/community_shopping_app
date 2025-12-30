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
              /// 🔼 TOP SPACE
              const Spacer(flex: 3),

              /// ===============================
              /// CENTER CONTENT
              /// ===============================
              Column(
                children: [
                  Image.asset(
                    shopping,
                    width: 45.w, // 👈 thora balanced
                    height: 14.h,
                    fit: BoxFit.contain,
                  ),

                  0.5.h.height, // 👈 image & text spacing

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Community ',
                          style: StyleRefer.roundKeySoftBold.copyWith(
                            fontSize: 26.sp,
                            letterSpacing: 0.4,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Shopping',
                          style: StyleRefer.roundKeySoftBold.copyWith(
                            fontSize: 26.sp,
                            letterSpacing: 0.4,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// 🔽 SPACE BETWEEN CENTER & BUTTONS
              const Spacer(flex: 3),

              /// ===============================
              /// BUTTONS SECTION
              /// ===============================
              Column(
                children: [
                  CustomButton(title: 'Sign in', onPressed: logic.onSignIn),

                  2.h.height,

                  CustomButton(
                    title: 'Sign up',
                    type: ButtonType.outlined,
                    onPressed: logic.onSignUp,
                  ),

                  2.5.h.height, // bottom safe spacing
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
