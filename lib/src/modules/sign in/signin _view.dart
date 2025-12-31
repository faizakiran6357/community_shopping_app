
import 'package:community_shopping_app/src/modules/sign in/signin_logic.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/app_strings.dart';
import 'package:community_shopping_app/src/widgets/auth_logo_title.dart';
import 'package:community_shopping_app/src/widgets/custom_button.dart';
import 'package:community_shopping_app/src/widgets/selection_tile.dart';
import 'package:community_shopping_app/src/widgets/auth_footer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/sizer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w), // responsive padding
          child: GetBuilder<SignInLogic>(
            init: SignInLogic(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  6.h.height, // top spacing

                  // LOGO
                  Center(child: const AuthLogoTitle()),
                  3.5.h.height, // spacing

                  // TITLE
                  Text(
                    'Log In',
                    style: StyleRefer.robotoSemiBold.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  0.75.h.height,

                  // DESCRIPTION
                  Text(
                    AppStrings.loginSubtitle,
                    style: StyleRefer.robotoRegular.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  5.5.h.height,

                  // VIA PHONE
                  SelectionTile(
                    icon: phone,
                    title: 'Via Phone Number',
                    isSelected: controller.isPhoneSelected,
                    onTap: controller.selectPhone,
                  ),
                  2.h.height,

                  // VIA EMAIL
                  SelectionTile(
                    icon: email,
                    title: 'Via Email',
                    isSelected: controller.isEmailSelected,
                    onTap: controller.selectEmail,
                  ),
                  5.h.height,

                  // NEXT BUTTON
                  CustomButton(
                    title: 'Next',
                    onPressed: controller.goNext,
                  ),
                  2.2.h.height,

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
