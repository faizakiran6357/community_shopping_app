
import 'package:community_shopping_app/src/modules/profiles/profile_logic.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_strings.dart';
import 'package:community_shopping_app/src/widgets/auth_logo_title.dart';
import 'package:community_shopping_app/src/widgets/custom_button.dart';
import 'package:community_shopping_app/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.gender;
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
    return AppStrings.phone;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).size.height * 0.06;

    return GetBuilder<ProfileLogic>(
      init: ProfileLogic(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: true,

          // ================= BODY =================
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Skip',
                      style: StyleRefer.robotoRegular.copyWith(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: topPadding),
                  const Center(child: AuthLogoTitle()),
                  const SizedBox(height: 32),

                  Text(
                    'Profile Setup',
                    style: StyleRefer.robotoSemiBold.copyWith(
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 6),
                  Text(
                    AppStrings.locationPermissionText,
                    style: StyleRefer.robotoRegular.copyWith(
                      color: AppColors.grey,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ================= FORM =================
                  Form(
                    key: controller.form2Key,
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: 'Gender',
                          hintText: 'Gender',
                          prefix: Image.asset(
                            'assets/images/personIcon.png',
                            width: 20,
                            height: 20,
                            color: controller.hasTypedGender ? Colors.black : Colors.grey,
                          ),
                          onChanged: controller.setGender,
                          validator: genderValidator, // ✅ use local validator
                        ),

                        const SizedBox(height: 18),

                        CustomTextField(
                          labelText: 'Postal Code',
                          hintText: 'Postal Code',
                          keyboardType: TextInputType.number,
                          prefix: Image.asset(
                            'assets/images/postal.png',
                            width: 20,
                            height: 20,
                            color: controller.hasTypedpostal ? Colors.black : Colors.grey,
                          ),
                          onChanged: controller.setPostal,
                          validator: phoneValidator, // ✅ use local validator
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),

          // ================= BOTTOM BUTTON =================
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: CustomButton(
              title: 'Next',
              onPressed: controller.goTolocation,
            ),
          ),
        );
      },
    );
  }
}
