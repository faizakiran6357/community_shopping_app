import 'package:community_shopping_app/src/modules/bottom_nav/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLogic extends GetxController {
  final form2Key = GlobalKey<FormState>();
   bool hasTypedGender = false;
   bool hasTypedpostal = false;
  
  String gender = '';
  String postal = '';
  void setGender(String value) {
    gender = value;
    if (value.isNotEmpty) hasTypedGender = true;
    update();
  }

  void setPostal(String value) {
    postal = value;
    if (value.isNotEmpty) hasTypedpostal = true;
    update();
} 

  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  void goToVerification() {
    if (!form2Key.currentState!.validate()) return;
  }

  void onBottomNavigationScreen() {
    Get.to(() => BottomNavigationScreen());
  }


}
