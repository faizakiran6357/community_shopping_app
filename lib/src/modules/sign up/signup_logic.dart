
import 'dart:io';
import 'package:community_shopping_app/src/modules/sign up/verification_logic.dart';
import 'package:community_shopping_app/src/modules/sign up/verification_view.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpLogic extends GetxController {
  // ---------- FORM VALUES ----------
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';

  bool hasTypedFirstName = false;
  bool hasTypedLastName = false;
  bool hasTypedEmail = false;

  String? selectedFlag;
  File? profileImage;

  // ---------- SETTERS ----------
  void setFirstName(String value) {
    firstName = value;
    hasTypedFirstName = value.isNotEmpty;
    update();
  }

  void setLastName(String value) {
    lastName = value;
    hasTypedLastName = value.isNotEmpty;
    update();
  }

  void setEmail(String value) {
    email = value;
    hasTypedEmail = value.isNotEmpty;
    update();
  }

  void setPhone(String value) => phone = value;

  void setCountryFlag(String flag) {
    selectedFlag = flag;
    update();
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

  // ---------- NAVIGATION ----------
  void goToVerification() {
    Get.put(VerificationLogic());
    Get.to(() => const VerificationView());
  }
}
