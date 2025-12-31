
// import 'package:community_shopping_app/src/modules/sign%20up/signup_view.dart';
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
//   SignInPhoneView({super.key});

//   final _formKey = GlobalKey<FormState>();

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
//               const Center(child: AuthLogoTitle()),
//               const SizedBox(height: 32),

//               Text(
//                 'Log In',
//                 style: StyleRefer.robotoSemiBold.copyWith(
//                   fontSize: 22,
//                   color: AppColors.black,
//                 ),
//               ),

             

//               Text(
//                 AppStrings.loginSubtitle,
//                 style: StyleRefer.robotoRegular.copyWith(
//                   color: AppColors.grey,
//                 ),
//               ),

//               const SizedBox(height: 32),

//               // ================= FORM START =================
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     GetBuilder<SignInLogic>(
//                       builder: (_) {
//                         return CustomTextField(
//                           labelText: 'Phone Number',
//                           hintText: 'Enter phone number',
//                           keyboardType: TextInputType.phone,
//                           onChanged: controller.setPhone,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                              return AppStrings.phone;
//                             }
//                             return null;
//                           },

//                           /// PREFIX ICON (FLAG + DROPDOWN + |)
//                           prefix: Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 12, right: 8),
//                             child: GestureDetector(
//                               onTap: () {
//                                 showCountryPicker(
//                                   context: context,
//                                   showPhoneCode: false,
//                                   onSelect: (country) {
//                                     controller
//                                         .setCountryFlag(country.flagEmoji);
//                                   },
//                                 );
//                               },
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     controller.selectedFlag ?? '🇺🇸',
//                                     style: const TextStyle(fontSize: 20),
//                                   ),
//                                   const Icon(Icons.arrow_drop_down),
//                                   const SizedBox(width: 6),
//                                   const Text(
//                                     '|',
//                                     style: TextStyle(
//                                       color: Color(0xFFB6B6B6),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 40),

//                     CustomButton(
//                       title: 'Next',
//                       onPressed: () {
//                      // 🔑 STEP 1: Close keyboard
//                         FocusScope.of(context).unfocus();

//                            // 🔑 STEP 2: Validate
//                          if (!_formKey.currentState!.validate()) return;

//                          // 🔑 STEP 3: Navigate
//                        controller.goToOtp(controller.phone);
//                      },

//                     ),
//                   ],
//                 ),
//               ),
//               // ================= FORM END =================

//               const SizedBox(height: 18),

//               Center(
//                 child: AuthFooterText(
//                   fullText: AppStrings.dontHaveAccount,
//                   actionText: 'Sign Up',
//                   onTap: () {
//                     Get.to(() => SignUpView());
//                   },
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
import '../../utils/sizer.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/auth_footer_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
class SignInPhoneView extends GetView<SignInLogic> {
  SignInPhoneView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              6.h.height,
              const Center(child: AuthLogoTitle()),
              4.h.height,

              /// TITLE
              Text(
                'Log In',
                style: StyleRefer.robotoSemiBold.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              0.75.h.height,

              /// SUBTITLE
              Text(
                AppStrings.loginSubtitle,
                style: StyleRefer.robotoRegular.copyWith(
                  color: AppColors.grey,
                ),
              ),
              4.h.height,

              // ================= FORM =================
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    GetBuilder<SignInLogic>(
                      builder: (_) {
                        return CustomTextField(
                          labelText: 'Phone Number',
                          hintText: 'Enter phone number',
                          keyboardType: TextInputType.phone,
                          onChanged: controller.setPhone,

                          /// BASIC EMPTY VALIDATION
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.phone;
                            }
                            if (controller.selectedCountry == null) {
                              return 'Please select country';
                            }
                            return null;
                          },

                          /// PREFIX (FLAG PICKER)
                          prefix: Padding(
                            padding:
                                const EdgeInsets.only(left: 12, right: 8),
                            child: GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: false,
                                  onSelect: (country) {
                                    controller.setCountry(country);
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.selectedCountry?.flagEmoji ??
                                        '🇺🇸',
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
                                  1.w.width,
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    4.5.h.height,

                    /// NEXT BUTTON WITH PHONE VALIDATION
                    CustomButton(
                      title: 'Next',
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        if (!_formKey.currentState!.validate()) return;

                        /// 🔥 COUNTRY-BASED PHONE VALIDATION
                        final isValid =
                            await controller.validatePhone();

                        if (!isValid) {
                          Get.snackbar(
                            'Invalid Number',
                            'Please enter a valid phone number',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }

                        controller.goToOtp(controller.phone);
                      },
                    ),
                  ],
                ),
              ),

              2.h.height,

              /// FOOTER
              Center(
                child: AuthFooterText(
                  fullText: AppStrings.dontHaveAccount,
                  actionText: 'Sign Up',
                  onTap: () {
                    Get.to(() => SignUpView());
                  },
                ),
              ),

              2.5.h.height,
            ],
          ),
        ),
      ),
    );
  }
}
