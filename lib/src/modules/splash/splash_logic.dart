
import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
import 'package:community_shopping_app/src/modules/sign%20up/signup_view.dart';
import 'package:get/get.dart';
 

class SplashLogic extends GetxController {

  // Navigate to SignInView screen
  void onSignIn() {
    Get.off(() => SignInView()); 
    // Get.off removes the splash screen from back stack
  }
  
  void onSignUp() {
    Get.off(
      () =>  SignUpView(),
      
    );
  }
}
