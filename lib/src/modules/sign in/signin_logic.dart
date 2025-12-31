import 'package:community_shopping_app/src/modules/otp/otp_logic.dart';
import 'package:community_shopping_app/src/modules/sign in/signin_email_view.dart';
import 'package:community_shopping_app/src/modules/sign in/signin_phone_view.dart';
import 'package:community_shopping_app/src/modules/sign up/signup_view.dart';
import 'package:community_shopping_app/src/modules/otp/otp_view.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:libphonenumber_plugin/libphonenumber_plugin.dart';

class SignInLogic extends GetxController {
  // ================= UI STATE =================
  bool hasTypedEmail = false;
  bool isPhoneSelected = true;
  bool isEmailSelected = false;

  // ================= DATA =================
  String email = '';
  String phone = '';

  Country? selectedCountry; // from country_picker

  // ================= TOGGLE =================
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

  // ================= SETTERS =================
  void setEmail(String value) {
    email = value;
    hasTypedEmail = value.isNotEmpty;
  }

  void setPhone(String value) {
    phone = value;
  }

  void setCountry(Country country) {
    selectedCountry = country;
    update();
  }

  // ================= NAVIGATION =================
  void goNext() {
    if (isPhoneSelected) {
      Get.to(() => SignInPhoneView());
    } else {
      Get.to(() => SignInEmailView());
    }
  }

  void goToOtp(String contact) {
    Get.put(OtpLogic());
    Get.to(() => OtpView(contact: contact));
  }

  void onSignUp() {
    Get.to(() => SignUpView());
  }

  // ================= PHONE VALIDATION =================
Future<bool> validatePhone() async {
  if (selectedCountry == null || phone.isEmpty) return false;

  try {
    final isValid = await PhoneNumberUtil.isValidPhoneNumber(
      phone,
      selectedCountry!.countryCode,
    );

    return isValid ?? false; // ✅ FIX
  } catch (e) {
    return false;
  }
}


  // ================= FULL PHONE =================
  String get fullPhoneNumber {
    if (selectedCountry == null) return phone;
    return '+${selectedCountry!.phoneCode}$phone';
  }
}
