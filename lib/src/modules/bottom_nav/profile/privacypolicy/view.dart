// import 'package:community_shopping_app/src/modules/bottom_nav/profile/privacypolicy/logic.dart';
// import 'package:community_shopping_app/src/utils/app_colors.dart';
// import 'package:community_shopping_app/src/utils/app_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class PrivacyPolicyView extends StatelessWidget {
//   const PrivacyPolicyView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PrivacyPolicyLogic>(
//       init: PrivacyPolicyLogic(),
//       builder: (logic) {
//         return Scaffold(
//           backgroundColor: AppColors.white,
//           appBar: AppBar(
//             backgroundColor: AppColors.white,
//             elevation: 0,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: AppColors.black),
//               onPressed: () => Get.back(),
//             ),
//             centerTitle: true,
//             title: Text(
//               logic.title,
//               style: StyleRefer.robotoMedium.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.black,
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(20),
//             child: SingleChildScrollView(
//               child: Text(
//                 logic.text,
//                 style: StyleRefer.robotoRegular.copyWith(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.black,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:community_shopping_app/src/modules/bottom_nav/profile/privacypolicy/logic.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyLogic>(
      init: PrivacyPolicyLogic(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.black),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text(
              'Privacy Policy',
              style: StyleRefer.robotoMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Text(
                AppStrings.privacypolicycontent,
                style: StyleRefer.robotoRegular.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
