import 'dart:async';
import 'package:community_shopping_app/src/modules/profiles/profile_view.dart';
import 'package:get/get.dart';
class OtpLogic extends GetxController {
  final List<String> otp = List.filled(6, '');

  bool isVerifying = false;
  int resendSeconds = 30;
  Timer? _timer;

  String? otpError; // 👈 NEW (error message)

  @override
  void onInit() {
    startResendTimer();
    super.onInit();
  }

  void onOtpChanged(int index, String value) {
    otp[index] = value;
    otpError = null; // 👈 error clear on typing
    update();
  }

  String get enteredOtp => otp.join();

  /// ✅ OTP VALIDATION
  bool validateOtp() {
    if (enteredOtp.isEmpty || enteredOtp.length < 6) {
      otpError = 'You must enter 6 digit code';
      update();
      return false;
    }
    return true;
  }

  void verifyOtp() async {
    // ❌ validation fail
    if (!validateOtp()) return;

    isVerifying = true;
    update();

    /// 🔄 Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    isVerifying = false;
    update();

    /// ✅ Navigate after success
    Get.to(() => ProfileView());
  }

  void startResendTimer() {
    resendSeconds = 30;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds == 0) {
        timer.cancel();
      } else {
        resendSeconds--;
        update();
      }
    });
  }

  void resendOtp() {
    startResendTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
