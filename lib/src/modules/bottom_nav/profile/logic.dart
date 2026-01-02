
import 'package:community_shopping_app/src/modules/bottom_nav/profile/aboutus/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/privacypolicy/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/profiletile/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/widgets/delete_account_dialog.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/widgets/logout_dialog.dart';
import 'package:community_shopping_app/src/modules/location/location_view.dart';
import 'package:community_shopping_app/src/modules/splash/splash_view.dart';
import 'package:get/get.dart';

class ProfileNavLogic extends GetxController {
  final RxBool isLoading = false.obs;

 
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


  void onLogoutTap() async {
  final result = await Get.dialog(
    const LogoutDialog(),
    barrierDismissible: true,
  );

  if (result == true) {
    // 🔐 clear session / token later
    Get.offAll(() => const SplashView());
  }
}

  void onDeleteAccountTap() {
    Get.dialog(
      const DeleteAccountDialog(),
      barrierDismissible: true,
    );
  }
 
}
