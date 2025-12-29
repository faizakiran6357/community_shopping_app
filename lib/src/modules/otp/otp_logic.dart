import 'dart:async';
import 'package:community_shopping_app/src/modules/profiles/profile_view.dart';
import 'package:get/get.dart';

class OtpLogic extends GetxController {
  final List<String> otp = List.filled(6, '');

  bool isVerifying = false;
  int resendSeconds = 30;
  Timer? _timer;

  @override
  void onInit() {
    startResendTimer();
    super.onInit();
  }

  void onOtpChanged(int index, String value) {
    otp[index] = value;
  }

  String get enteredOtp => otp.join();

  void onProfileView() {
    Get.to(() => ProfileView());
  }

  void verifyOtp() async {
    isVerifying = true;
    update();

    /// 🔄 Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    onProfileView();

    isVerifying = false;
    update();

    /// ✅ Navigate after success
    // Get.offAllNamed('/home');
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
    // 🔁 Call resend OTP API here
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
