
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:country_picker/country_picker.dart';

// import '../../modules/sign in/signin_logic.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/app_fonts.dart';
// import '../../utils/app_strings.dart';
// import '../../widgets/auth_logo_title.dart';
// import '../../widgets/auth_footer_text.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/custom_text_field.dart';

// class SignInPhoneView extends GetView<SignInLogic> {
//   const SignInPhoneView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double topPadding = MediaQuery.of(context).size.height * 0.06;

//     return Scaffold(
//       backgroundColor: AppColors.white,
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: topPadding),
//               Center(child: const AuthLogoTitle()),
//               const SizedBox(height: 32),

//               Text(
//                 'Log In',
//                 style: StyleRefer.robotoSemiBold.copyWith(
//                   fontSize: 22,
//                   color: AppColors.black,
//                 ),
//               ),
//               const SizedBox(height: 6),

//               Text(
//                 AppStrings.loginSubtitle,
//                 style: StyleRefer.robotoRegular.copyWith(
//                   color: AppColors.grey,
//                 ),
//               ),
//               const SizedBox(height: 32),

//               /// ---------------- PHONE FIELD ----------------
//               GetBuilder<SignInLogic>(
//                 builder: (_) {
//                   return CustomTextField(
//                     controller: controller.phoneController,
//                     hintText: 'Enter phone number',
//                     labelText: 'Phone Number',
//                     keyboardType: TextInputType.phone,
//                     onChanged: controller.setPhone,

//                     /// PREFIX ICON (FLAG + DROPDOWN + |)
//                     prefixIcon: Padding(
//                         padding: const EdgeInsets.only(left: 12, right: 8),
//                       child: GestureDetector(
//                         onTap: () {
//                           showCountryPicker(
//                             context: context,
//                             showPhoneCode: false, // ❗ NO CODE
//                             onSelect: (country) {
//                               controller.setCountryFlag(country.flagEmoji);
//                             },
//                           );
//                         },
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               controller.selectedFlag ?? '🇺🇸', // default flag only
//                               style: const TextStyle(fontSize: 20),
//                             ),
//                             const Icon(
//                               Icons.arrow_drop_down,
//                               color: AppColors.black,
//                             ),
//                             const SizedBox(width: 6),
//                             const Text(
//                               '|',
//                               style: TextStyle(
//                                 color: Color(0xFFB6B6B6),
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const SizedBox(width: 6),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               const SizedBox(height: 40),

//               CustomButton(
//                 title: 'Next',
//               onPressed: controller.goToOtp,

//               ),

//               const SizedBox(height: 18),

//               Center(
//                 child: AuthFooterText(
//                   fullText: AppStrings.dontHaveAccount,
//                   actionText: 'Sign Up',
//                   onTap: () {},
//                 ),
//               ),

//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:community_shopping_app/src/modules/sign%20up/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

import '../../modules/sign in/signin_logic.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/auth_footer_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInPhoneView extends GetView<SignInLogic> {
  const SignInPhoneView({super.key});

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
                key: controller.form1Key,
                child: Column(
                  children: [
                    GetBuilder<SignInLogic>(
                      builder: (_) {
                        return CustomTextField(
                          labelText: 'Phone Number',
                          hintText: 'Enter phone number',
                          keyboardType: TextInputType.phone,
                          onChanged: controller.setPhone,
                          validator: controller.phoneValidator,

                          /// PREFIX ICON (FLAG + DROPDOWN + |)
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: false,
                                  onSelect: (country) {
                                    controller
                                        .setCountryFlag(country.flagEmoji);
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.selectedFlag ?? '🇺🇸',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                  const SizedBox(width: 6),
                                  const Text(
                                    '|',
                                    style: TextStyle(
                                      color: Color(0xFFB6B6B6),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    CustomButton(
                      title: 'Next',
                      onPressed: controller.goToOtp,
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
                  onTap: () {
                     Get.to(() => SignUpView());
                  },
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
