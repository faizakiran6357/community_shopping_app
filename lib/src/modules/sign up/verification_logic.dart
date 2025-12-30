// import 'package:community_shopping_app/src/modules/otp/otp_view.dart';
// import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
// import 'package:get/get.dart';


// class VerificationLogic extends GetxController {
//   bool viaPhone = true;
//   bool viaEmail = false;

//   void selectPhone() {
//     viaPhone = true;
//     viaEmail = false;
//     update();
//   }

//   void selectEmail() {
//     viaPhone = false;
//     viaEmail = true;
//     update();
//   }

//   void goToOtp() {
//     Get.to(() => OtpView(contact: viaEmail ? 'example@gmail.com' : '123 456 789'));
//   }

//  void onSignIn() {
//     Get.to(() =>  SignInView());
//   }
  

// }
import 'package:community_shopping_app/src/modules/sign in/signin_email_view.dart';
import 'package:community_shopping_app/src/modules/sign in/signin_phone_view.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin_logic.dart';
import 'package:get/get.dart';

class VerificationLogic extends GetxController {

  bool isPhoneSelected = true;
  bool isEmailSelected = false;

  // Select Phone
  void selectPhone() {
    isPhoneSelected = true;
    isEmailSelected = false;
    update();
  }

  // Select Email
  void selectEmail() {
    isPhoneSelected = false;
    isEmailSelected = true;
    update();
  }

  // Next Button action
  void goNext() {
    if (isPhoneSelected) {
      Get.put(SignInLogic());
      Get.to(() => SignInPhoneView());
    } else {
      Get.put(SignInLogic());
      Get.to(() => SignInEmailView());
    }
  }

  // Footer Sign In
  void onSignIn() {
    Get.to(() => const SignInView());
  }
}
