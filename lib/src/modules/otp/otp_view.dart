import 'package:community_shopping_app/src/widgets/circular_dots_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/custom_button.dart';
import '../../utils/sizer.dart';
import 'otp_logic.dart';

class OtpView extends GetView<OtpLogic> {
  final String contact;

  const OtpView({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: const BackButton(color: AppColors.black),
        title: const Text(
          'OTP Verification',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: GetBuilder<OtpLogic>(
        init: OtpLogic(),
        builder: (controller) {
          if (controller.isVerifying) {
            return const CircularDotsLoader();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                4.h.height,
                const AuthLogoTitle(),
                8.h.height,

                Text(
                  'Enter OTP',
                  style: StyleRefer.robotoSemiBold.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                0.8.h.height,

                Text(
                  AppStrings.otpSentMessage,
                  style: StyleRefer.robotoRegular.copyWith(
                    color: AppColors.grey,
                  ),
                ),

                0.8.h.height,

                /// Email / Phone
                Text(
                  contact,
                  style: StyleRefer.robotoMedium.copyWith(
                    fontSize: 11.sp,
                    color: AppColors.black,
                  ),
                ),

                6.h.height,

                /// OTP BOXES
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => _OtpBox(
                      onChanged: (value) {
                        controller.onOtpChanged(index, value);
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
                if (controller.otpError != null) ...[
                  1.5.h.height,
                  Text(
                    controller.otpError!,
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                  ),
                ],
                8.h.height,

                CustomButton(title: 'Verify', onPressed: controller.verifyOtp),

                1.6.h.height,

                /// RESEND OTP
                controller.resendSeconds == 0
                    ? TextButton(
                        onPressed: controller.resendOtp,
                        child: Text(
                          'Resend OTP',
                          style: StyleRefer.robotoSemiBold.copyWith(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    : RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Resend OTP ',
                              style: StyleRefer.robotoSemiBold.copyWith(
                                color: AppColors.primary,
                                fontSize: 12.sp,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '(${_formatTime(controller.resendSeconds)})',
                              style: StyleRefer.robotoRegular.copyWith(
                                color: AppColors.lightgrey,
                              ),
                            ),
                          ],
                        ),
                      ),

                3.h.height,
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

/// OTP BOX
class _OtpBox extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const _OtpBox({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12.w,
      child: TextField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: StyleRefer.robotoSemiBold,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
