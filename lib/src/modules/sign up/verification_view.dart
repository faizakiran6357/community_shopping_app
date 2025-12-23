import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/auth_footer_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/selection_tile.dart';
import 'verification_logic.dart';

class VerificationView extends GetView<VerificationLogic> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<VerificationLogic>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Center(child: AuthLogoTitle()),

                const SizedBox(height: 32),
                Text(
                  'Verification Method',
                  style: StyleRefer.robotoSemiBold.copyWith(
                    fontSize: 22,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 6),
                Text(
                  AppStrings.otpSelectionSubtitle,
                  style: StyleRefer.robotoRegular.copyWith(
                    color: AppColors.grey,
                  ),
                ),

                const SizedBox(height: 36),

                SelectionTile(
                  icon: 'assets/images/phone.png',
                  title: 'Via Phone Number',
                  isSelected: controller.viaPhone,
                  onTap: controller.selectPhone,
                ),
                const SizedBox(height: 16),

                SelectionTile(
                  icon: 'assets/images/email.png',
                  title: 'Via Email',
                  isSelected: controller.viaEmail,
                  onTap: controller.selectEmail,
                ),

              SizedBox(height: 40,),

                CustomButton(
                  title: 'Next',
                  onPressed: controller.goToOtp,
                ),

                const SizedBox(height: 18),
                Center(
                  child: AuthFooterText(
                    fullText: AppStrings.alreadyHaveAccount,
                    actionText: 'Sign In',
                    onTap: () => controller.onSignIn(),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
