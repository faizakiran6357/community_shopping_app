// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileTileLogic extends GetxController {
//   String firstName = '';
//   String lastName = '';
//   String email = '';
//   String phone = '';
//   String gender = '';
//   String postalCode = '';

//   String? selectedFlag;
//   File? profileImage;

//   void setFirstName(String v) => firstName = v;
//   void setLastName(String v) => lastName = v;
//   void setEmail(String v) => email = v;
//   void setPhone(String v) => phone = v;
//   void setGender(String v) => gender = v;
//   void setPostalCode(String v) => postalCode = v;

//   void setCountryFlag(String flag) {
//     selectedFlag = flag;
//     update();
//   }

//   Future<void> pickImage(ImageSource source) async {
//     final picked = await ImagePicker().pickImage(source: source);
//     if (picked != null) {
//       profileImage = File(picked.path);
//       update();
//     }
//   }

//   void updateProfile() {
//     // 🔥 API / Supabase / Firebase call yahan lagegi
//     Get.snackbar('Success', 'Profile updated successfully');
//   }
// }
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTileLogic extends GetxController {
  // ---------- FORM VALUES ----------
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String gender = '';
  String postalCode = '';

  // ---------- TYPED FLAGS (🔥 NEW) ----------
  bool hasTypedFirstName = false;
  bool hasTypedLastName = false;
  bool hasTypedEmail = false;
  bool hasTypedPhone = false;
  bool hasTypedGender = false;
  bool hasTypedPostalCode = false;

  String? selectedFlag;
  File? profileImage;

  // ---------- SETTERS ----------
  void setFirstName(String v) {
    firstName = v;
    hasTypedFirstName = v.isNotEmpty;
    update();
  }

  void setLastName(String v) {
    lastName = v;
    hasTypedLastName = v.isNotEmpty;
    update();
  }

  void setEmail(String v) {
    email = v;
    hasTypedEmail = v.isNotEmpty;
    update();
  }

  void setPhone(String v) {
    phone = v;
    hasTypedPhone = v.isNotEmpty;
    update();
  }

  void setGender(String v) {
    gender = v;
    hasTypedGender = v.isNotEmpty;
    update();
  }

  void setPostalCode(String v) {
    postalCode = v;
    hasTypedPostalCode = v.isNotEmpty;
    update();
  }

  void setCountryFlag(String flag) {
    selectedFlag = flag;
    update();
  }

  // ---------- IMAGE PICK ----------
  Future<void> pickImage(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source);
    if (picked != null) {
      profileImage = File(picked.path);
      update();
    }
  }

  void updateProfile() {
    Get.snackbar('Success', 'Profile updated successfully');
  }
}
