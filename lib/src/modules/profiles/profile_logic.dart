import 'package:community_shopping_app/src/modules/location/location_view.dart';
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
  void goToVerification() {
    if (!form2Key.currentState!.validate()) return;
  }
  
  void goTolocation() {
    Get.to(() =>  LocationView());
  }
}
