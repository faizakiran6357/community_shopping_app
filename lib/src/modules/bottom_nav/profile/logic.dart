
import 'package:community_shopping_app/src/modules/bottom_nav/profile/aboutus/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/privacypolicy/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/profiletile/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/widgets/delete_account_dialog.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/widgets/logout_dialog.dart';
import 'package:community_shopping_app/src/modules/location/location_view.dart';
import 'package:community_shopping_app/src/utils/app_strings.dart';
import 'package:get/get.dart';

class ProfileNavLogic extends GetxController {
  final RxBool isLoading = false.obs;

  // void onProfileTap() {
  //   print('Profile tapped');
  // }
  void onProfileTap() {
  Get.to(() => ProfileTileView());
}


  void onLocationTap() {
    Get.to(() => const LocationView(isEditMode: true)); 
  }

  void onPrivacyPolicyTap() {
     Get.to(() => const PrivacyPolicyView());
  }
//   void onPrivacyPolicyTap() {
//   Get.to(() => const PrivacyPolicyView(), arguments: {
//     'title': 'Privacy Policy',
//     'text': AppStrings.privacypolicycontent,
//   });
// }

  void onAboutUsTap() {
  Get.to(() => const AboutUsView());
  }

  // void onLogoutTap() {
  //   print('Logout tapped');
  // }

  // void onDeleteAccountTap() {
  //   print('Delete Account tapped');
  // }
    void onLogoutTap() {
    Get.dialog(
      const LogoutDialog(),
      barrierDismissible: true,
    );
  }

  void onDeleteAccountTap() {
    Get.dialog(
      const DeleteAccountDialog(),
      barrierDismissible: true,
    );
  }
}
