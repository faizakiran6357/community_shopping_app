import 'package:community_shopping_app/src/modules/otp/otp_view.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
import 'package:get/get.dart';


class VerificationLogic extends GetxController {
  bool viaPhone = true;
  bool viaEmail = false;

  void selectPhone() {
    viaPhone = true;
    viaEmail = false;
    update();
  }

  void selectEmail() {
    viaPhone = false;
    viaEmail = true;
    update();
  }

  void goToOtp() {
    Get.to(() => OtpView(contact: viaEmail ? 'example@gmail.com' : '123 456 789'));
  }

 void onSignIn() {
    Get.to(() =>  SignInView());
  }

}
