
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/sign in/signin_logic.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/auth_footer_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInEmailView extends GetView<SignInLogic> {
  SignInEmailView({super.key});


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).size.height * 0.06;

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: topPadding),
              const Center(child: AuthLogoTitle()),
              const SizedBox(height: 32),
                        
              Text(
                'Log In',
                style: StyleRefer.robotoSemiBold.copyWith(
                  fontSize: 22,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                AppStrings.loginSubtitle,
                style: StyleRefer.robotoRegular.copyWith(
                  color: AppColors.grey,
                ),
              ),

              const SizedBox(height: 32),

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
                            'assets/images/emailIcon.png',
                            width: 20,
                            height: 20,
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

                    const SizedBox(height: 40),

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

              const SizedBox(height: 18),

              Center(
                child: AuthFooterText(
                  fullText: AppStrings.dontHaveAccount,
                  actionText: 'Sign Up',
                  onTap: controller.onSignUp,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
