import 'package:community_shopping_app/src/utils/app_images.dart';
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
          child: Stack(
            children: [

              /// ===============================
              /// CENTER CONTENT (STABLE)
              /// ===============================
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      shopping,
                      width: 220,   // ✅ FIXED
                      height: 160,  // ✅ FIXED
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 14),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Community ',
                            style: StyleRefer.roundKeySoftBold.copyWith(
                              fontSize: 24, // ✅ FIXED
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Shopping',
                            style: StyleRefer.roundKeySoftBold.copyWith(
                              fontSize: 24, // ✅ FIXED
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// ===============================
              /// BUTTONS (BOTTOM)
              /// ===============================
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      title: 'Sign in',
                      onPressed: logic.onSignIn,
                    ),

                    const SizedBox(height: 16),

                    CustomButton(
                      title: 'Sign up',
                      type: ButtonType.outlined,
                      onPressed: logic.onSignUp,
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
