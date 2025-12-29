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
                'assets/images/shopping_icon.png',
                width: 187,
                height: 107,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 20),

              // ===============================
              // TITLE
              // ===============================
              Text(
                'Community Shopping',
                textAlign: TextAlign.center,
                style: StyleRefer.roundKeySoftBold.copyWith(
                  fontSize: 34,
                  height: 1,
                  letterSpacing: 0.44, // 1%
                  color: AppColors.black,
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

              const SizedBox(height: 16),

              // ===============================
              // SIGN UP BUTTON (WHITE)
              // ===============================
                CustomButton(
                   title: 'Sign up',
                   type: ButtonType.outlined,
                   onPressed: logic.onSignUp,
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
