import 'package:community_shopping_app/src/modules/splash/splash_view.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart' as AppStrings;
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// CLOSE
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: Get.back,
                child: const Icon(Icons.close, color: AppColors.grey),
              ),
            ),

            /// ICON
            Image.asset(logouticon, width: 89.14, height: 89.14),

            const SizedBox(height: 14),

            /// TITLE
            Text(
              "Logout",
              style: StyleRefer.robotoMedium.copyWith(
                fontSize: 15.6,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),

            const SizedBox(height: 6),

            /// DESCRIPTION
            Text(
              "Do you really want to logout this Account?",
              textAlign: TextAlign.center,
              style: StyleRefer.robotoRegular.copyWith(
                fontSize: 14,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 20),

            /// BUTTON
            CustomButton(
              title: "Logout",
              onPressed: () {
                Get.back(result: true); // ✔ confirm logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
