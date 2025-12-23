// import 'dart:io';
// import 'package:community_shopping_app/src/modules/sign%20up/verification_logic.dart';
// import 'package:community_shopping_app/src/modules/sign%20up/verification_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class SignUpLogic extends GetxController {
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();

//   String? selectedFlag;
//   File? profileImage;

//   void setCountryFlag(String flag) {
//     selectedFlag = flag;
//     update();
//   }

//   Future<void> pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final picked = await picker.pickImage(source: source);

//     if (picked != null) {
//       profileImage = File(picked.path);
//       update();
//     }
//   }

//   void goToVerification() {
//      Get.put(VerificationLogic());
//     Get.to(() => const VerificationView());
//   }

//   @override
//   void onClose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     super.onClose();
//   }
// }
import 'dart:io';
import 'package:community_shopping_app/src/modules/sign up/verification_logic.dart';
import 'package:community_shopping_app/src/modules/sign up/verification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpLogic extends GetxController {
  // ---------- FORM KEY ----------
  final formKey = GlobalKey<FormState>();

  bool hasTypedFirstName = false;
  bool hasTypedLastName = false;
  bool hasTypedEmail = false;

  // ---------- FORM VALUES ----------
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';

  String? selectedFlag;
  File? profileImage;

  // ---------- SETTERS ----------
  // void setFirstName(String value) => firstName = value;
   void setFirstName(String value) {
    firstName = value;
    if (value.isNotEmpty) hasTypedFirstName = true;
    update();
  }

  // void setLastName(String value) => lastName = value;
     void setLastName(String value) {
    lastName = value;
    if (value.isNotEmpty) hasTypedLastName = true;
    update();
  }

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

  // ---------- VALIDATORS ----------
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Enter valid email';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  // ---------- IMAGE PICK ----------
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);

    if (picked != null) {
      profileImage = File(picked.path);
      update();
    }
  }

  // ---------- SUBMIT ----------
  void goToVerification() {
    if (!formKey.currentState!.validate()) return;

    Get.put(VerificationLogic());
    Get.to(() => const VerificationView());
  }
}
