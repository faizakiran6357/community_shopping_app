import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/sign in/signin_logic.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';
import '../../utils/sizer.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/auth_footer_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInEmailView extends GetView<SignInLogic> {
  SignInEmailView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w), // responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              6.h.height, // top padding
              const Center(child: AuthLogoTitle()),
              4.h.height, // spacing

              // TITLE
              Text(
                'Log In',
                style: StyleRefer.robotoSemiBold.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              0.75.h.height, // spacing

              // SUBTITLE
              Text(
                AppStrings.loginSubtitle,
                style: StyleRefer.robotoRegular.copyWith(
                  color: AppColors.grey,
                ),
              ),
              4.h.height, // spacing

              // ================= FORM START =================
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // ❗ GetBuilder only for icon color
                    GetBuilder<SignInLogic>(
                      id: 'email_icon',
                      builder: (_) {
                        return CustomTextField(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          keyboardType: TextInputType.emailAddress,
                          prefix: Image.asset(
                            emailIcon,
                            width: 5.w,   // responsive width
                            height: 2.5.h, // responsive height
                            color: controller.hasTypedEmail
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: (value) {
                            controller.setEmail(value);
                            controller.update(['email_icon']);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.email;
                            }
                            if (!value.contains('@')) {
                              return AppStrings.validemail;
                            }
                            return null;
                          },
                        );
                      },
                    ),

                    4.5.h.height, // spacing

                    CustomButton(
                      title: 'Next',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        controller.goToOtp(controller.email);
                      },
                    ),
                  ],
                ),
              ),
              // ================= FORM END =================

              2.h.height, // spacing

              // FOOTER TEXT
              Center(
                child: AuthFooterText(
                  fullText: AppStrings.dontHaveAccount,
                  actionText: 'Sign Up',
                  onTap: controller.onSignUp,
                ),
              ),

              2.5.h.height, // bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
