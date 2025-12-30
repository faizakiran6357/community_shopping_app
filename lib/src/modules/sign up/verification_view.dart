// import 'package:community_shopping_app/src/utils/sizer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/app_fonts.dart';
// import '../../utils/app_strings.dart';
// import '../../widgets/auth_logo_title.dart';
// import '../../widgets/auth_footer_text.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/selection_tile.dart';
// import 'verification_logic.dart';

// class VerificationView extends GetView<VerificationLogic> {
//   const VerificationView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: GetBuilder<VerificationLogic>(
//             builder: (controller) => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 4.h.height,
//                 const Center(child: AuthLogoTitle()),

//                 3.2.h.height,
//                 Text(
//                   'Verification Method',
//                   style: StyleRefer.robotoSemiBold.copyWith(
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.black,
//                   ),
//                 ),

//                 0.6.h.height,
//                 Text(
//                   AppStrings.otpSelectionSubtitle,
//                   style: StyleRefer.robotoRegular.copyWith(
//                     color: AppColors.grey,
//                   ),
//                 ),

//                 5.h.height,

//                 SelectionTile(
//                   icon: 'assets/images/phone.png',
//                   title: 'Via Phone Number',
//                   isSelected: controller.viaPhone,
//                   onTap: controller.selectPhone,
//                 ),

//                 1.6.h.height,

//                 SelectionTile(
//                   icon: 'assets/images/email.png',
//                   title: 'Via Email',
//                   isSelected: controller.viaEmail,
//                   onTap: controller.selectEmail,
//                 ),

//                 6.h.height,

//                 CustomButton(
//                   title: 'Next',
//                   onPressed: controller.goToOtp,
//                 ),

//                 1.8.h.height,

//                 Center(
//                   child: AuthFooterText(
//                     fullText: AppStrings.dontHaveAccountsignin, // 👈 change here
//                     actionText: 'Sign In',
//                     onTap: controller.onSignIn,
//                   ),
//                 ),

//                 2.h.height,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
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
        child: GetBuilder<VerificationLogic>(
          builder: (controller) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.h.height,
                const Center(child: AuthLogoTitle()),

                3.2.h.height,
                Text(
                  'Verification Method',
                  style: StyleRefer.robotoSemiBold.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                0.6.h.height,
                Text(
                  AppStrings.otpSelectionSubtitle,
                  style: StyleRefer.robotoRegular.copyWith(
                    color: AppColors.grey,
                  ),
                ),

                5.h.height,

                // Via Phone
                SelectionTile(
                  icon: phone,
                  title: 'Via Phone Number',
                  isSelected: controller.isPhoneSelected,
                  onTap: controller.selectPhone,
                ),

                1.6.h.height,

                // Via Email
                SelectionTile(
                  icon: email,
                  title: 'Via Email',
                  isSelected: controller.isEmailSelected,
                  onTap: controller.selectEmail,
                ),

                6.h.height,

                CustomButton(
                  title: 'Next',
                  onPressed: controller.goNext,
                ),

                1.8.h.height,

                Center(
                  child: AuthFooterText(
                    fullText: AppStrings.dontHaveAccountsignin,
                    actionText: 'Sign In',
                    onTap: controller.onSignIn,
                  ),
                ),

                2.h.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
