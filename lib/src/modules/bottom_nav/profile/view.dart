import 'package:community_shopping_app/src/modules/bottom_nav/profile/logic.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileNavView extends StatelessWidget {
  const ProfileNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileNavLogic>(
      init: ProfileNavLogic(),
      builder: (logic) {
        return Column(
          children: [
            /// 🔝 Custom Top Bar
            CustomTopBar(
              title: 'Profile',
              titleColor: Colors.black,
              drawerIconColor: Colors.black,
            ),

            const SizedBox(height: 8),

            _profileTile(
              icon: profile,
              title: 'Profile',
              onTap: () => logic.onProfileTap(),
            ),

            _divider(),

            _profileTile(
              icon: location,
              title: 'Location',
              onTap: () => logic.onLocationTap(),
            ),

            _divider(),

            _profileTile(
              icon: privacyPolicy,
              title: 'Privacy Policy',
              onTap: () => logic.onPrivacyPolicyTap(),
            ),

            _divider(),

            _profileTile(
              icon: about,
              title: 'About Us',
              onTap: () => logic.onAboutUsTap(),
            ),

            _divider(),

            _profileTile(
              icon: logout,
              title: 'Logout',
              onTap: () => logic.onLogoutTap(),
            ),

            _divider(),

            _profileTile(
              icon: delete,
              title: 'Delete Account',
              titleColor: AppColors.black,
              iconColor: AppColors.redColor,
              onTap: () => logic.onDeleteAccountTap(),
            ),
          ],
        );
      },
    );
  }

  /// 🔹 Profile Item
  Widget _profileTile({
    required String icon,
    required String title,
    Color titleColor = Colors.black,
    Color iconColor = AppColors.primary,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 22,
              height: 22,
              color: iconColor,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: StyleRefer.robotoRegular.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Divider
  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 0.6,
      color: Colors.black12,
    );
  }
}
