
import 'package:community_shopping_app/src/modules/otp/otp_logic.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin_email_view.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin_phone_view.dart';
import 'package:community_shopping_app/src/modules/sign%20up/signup_view.dart';
import 'package:get/get.dart';
import 'package:community_shopping_app/src/modules/otp/otp_view.dart';
class SignInLogic extends GetxController {
  bool hasTypedEmail = false;
  bool isPhoneSelected = true;
  bool isEmailSelected = false;

  String email = '';
  String phone = '';
  String? selectedFlag;

  void selectPhone() {
    isPhoneSelected = true;
    isEmailSelected = false;
    update();
  }

  void selectEmail() {
    isPhoneSelected = false;
    isEmailSelected = true;
    update();
  }


  void setEmail(String value) {
    email = value;
    hasTypedEmail = value.isNotEmpty;
  }

  void setPhone(String value) => phone = value;

  void setCountryFlag(String flag) {
    selectedFlag = flag;
    update();
  }

  void goNext() {
    if (isPhoneSelected) {
      Get.to(() =>  SignInPhoneView());
    } else {
      Get.to(() =>  SignInEmailView());
    }
  }

  void goToOtp(String contact) {
    Get.put(OtpLogic());
    Get.to(() => OtpView(contact: contact));
  }

  void onSignUp() {
    Get.to(() => SignUpView());
  }
}
