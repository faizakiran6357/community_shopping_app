
import 'package:community_shopping_app/src/modules/sign in/signin_logic.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_strings.dart';
import 'package:community_shopping_app/src/widgets/auth_logo_title.dart';
import 'package:community_shopping_app/src/widgets/custom_button.dart';
import 'package:community_shopping_app/src/widgets/selection_tile.dart';
import 'package:community_shopping_app/src/widgets/auth_footer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

 

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).size.height * 0.06;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<SignInLogic>(
            init: SignInLogic(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: topPadding),

                  // LOGO
                  Center(child: const AuthLogoTitle()),
                  const SizedBox(height: 28),

                  // TITLE
                  Text(
                    'Log In',
                    style: StyleRefer.robotoSemiBold.copyWith(
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // DESCRIPTION
                  Text(
                    AppStrings.loginSubtitle,
                    style: StyleRefer.robotoRegular.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 36),

                  // VIA PHONE
                  SelectionTile(
                    icon: 'assets/images/phone.png',
                    title: 'Via Phone Number',
                    isSelected: controller.isPhoneSelected,
                    onTap: controller.selectPhone,
                  ),
                  const SizedBox(height: 16),

                  // VIA EMAIL
                  SelectionTile(
                    icon: 'assets/images/email.png',
                    title: 'Via Email',
                    isSelected: controller.isEmailSelected,
                    onTap: controller.selectEmail,
                  ),
                  const SizedBox(height: 40),

                  // NEXT BUTTON
                  CustomButton(
                    title: 'Next',
                    onPressed: controller.goNext,
                  ),
                  const SizedBox(height: 18),

                  // AUTH FOOTER TEXT
                  Center(
                    child: AuthFooterText(
                      fullText: AppStrings.dontHaveAccount,
                      actionText: 'Sign Up',
                      onTap: () {
                       controller.onSignUp();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
