
// import 'package:community_shopping_app/src/modules/otp/otp_logic.dart';
// import 'package:community_shopping_app/src/modules/sign%20in/signin_email_view.dart';
// import 'package:community_shopping_app/src/modules/sign%20in/signin_phone_view.dart';
// import 'package:community_shopping_app/src/modules/sign%20up/signup_binding.dart';
// import 'package:community_shopping_app/src/modules/sign%20up/signup_view.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:community_shopping_app/src/modules/otp/otp_view.dart';


// class SignInLogic extends GetxController {
//   bool isPhoneSelected = true;
//   bool isEmailSelected = false;

//   String email = '';
//   String phone = '';

//   String? selectedFlag; // ❗ initially NULL (no code, no flag text)

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();

//   void selectPhone() {
//     isPhoneSelected = true;
//     isEmailSelected = false;
//     update();
//   }

//   void selectEmail() {
//     isPhoneSelected = false;
//     isEmailSelected = true;
//     update();
//   }

//   void setEmail(String value) {
//     email = value;
//   }

//   void setPhone(String value) {
//     phone = value;
//   }

//   void setCountryFlag(String flag) {
//     selectedFlag = flag;
//     update();
//   }

//   void goNext() {
//     if (isPhoneSelected) {
//       Get.to(() => const SignInPhoneView());
//     } else {
//       Get.to(() => const SignInEmailView());
//     }
//   }
  
//   void goToOtp() {
//      Get.put(OtpLogic()); 
//     String contact = isEmailSelected ? emailController.text : phoneController.text;
//     if (contact.isEmpty) {
//       Get.snackbar('Error', 'Please enter your ${isEmailSelected ? "email" : "phone number"}');
//       return;
//     }

//     Get.to(() => OtpView(contact: contact));
//   }
//   void onSignUp() {
//     Get.to(
//       () => const SignUpView(),
//       binding: SignUpBinding(),
//     );
//   }
// }

import 'package:community_shopping_app/src/modules/otp/otp_logic.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin_email_view.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin_phone_view.dart';
import 'package:community_shopping_app/src/modules/sign%20up/signup_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:community_shopping_app/src/modules/otp/otp_view.dart';
class SignInLogic extends GetxController {
 final form1Key = GlobalKey<FormState>();

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

  // ---------------- SETTERS ----------------
  // void setEmail(String value) => email = value;
  void setEmail(String value) {
    email = value;
    if (value.isNotEmpty) hasTypedEmail = true;
    update();
  }
  void setPhone(String value) => phone = value;

  void setCountryFlag(String flag) {
    selectedFlag = flag;
    update();
  }

  // ---------------- VALIDATORS ----------------
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  void goNext() {
    if (isPhoneSelected) {
      Get.to(() => const SignInPhoneView());
    } else {
      Get.to(() => const SignInEmailView());
    }
  }
  

  // ---------------- SUBMIT ----------------
  void goToOtp() {
    if (!form1Key.currentState!.validate()) return;

    final contact = isEmailSelected ? email : phone;

    Get.put(OtpLogic());
    Get.to(() => OtpView(contact: contact));
  }

  void onSignUp() {
    Get.to(() =>  SignUpView());
  }
}
