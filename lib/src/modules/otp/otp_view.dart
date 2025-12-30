
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../utils/app_colors.dart';
// import '../../utils/app_fonts.dart';
// import '../../utils/app_strings.dart';
// import '../../widgets/auth_logo_title.dart';
// import '../../widgets/custom_button.dart';
// import 'otp_logic.dart';

// class OtpView extends GetView<OtpLogic> {
//   final String contact;

//   const OtpView({super.key, required this.contact});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       resizeToAvoidBottomInset: true, 
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         leading: const BackButton(color: AppColors.black),
//         title: const Text(
//           'OTP Verification',
//           style: TextStyle(color: AppColors.black),
//         ),
//       ),
//       body: GetBuilder<OtpLogic>(
//         init: OtpLogic(),
//         builder: (controller) {

//                 if (controller.isVerifying) {
//   return const _CircularDotsLoader();
// }

//           return SingleChildScrollView( 
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 40),
//                 const AuthLogoTitle(),
//                 const SizedBox(height: 40),

//                 Text(
//                   'Enter OTP',
//                   style: StyleRefer.robotoSemiBold.copyWith(
//                     fontSize: 20,
//                     color: AppColors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 Text(
//                   AppStrings.otpSentMessage,
//                   style: StyleRefer.robotoRegular.copyWith(
//                     color: AppColors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 6),

//                 /// ✅ Email / Phone shown here
//                 Text(
//                   contact,
//                   style: StyleRefer.robotoMedium.copyWith(
//                     fontSize: 16,
//                     color: AppColors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 32),

//                 /// 🔢 OTP BOXES
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(
//                     6,
//                     (index) => _OtpBox(
//                       onChanged: (value) {
//                         controller.onOtpChanged(index, value);
//                         if (value.isNotEmpty && index < 5) {
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 60),

//                 CustomButton(
//                   title: 'Verify',
//                   onPressed: controller.verifyOtp,
//                 ),

//                 const SizedBox(height: 16),

//                 /// 🔁 RESEND OTP (FIXED COLORS + FORMAT)
//                 controller.resendSeconds == 0
//                     ? TextButton(
//                         onPressed: controller.resendOtp,
//                         child: Text(
//                           'Resend OTP',
//                           style: StyleRefer.robotoSemiBold.copyWith(
//                             color: AppColors.primary,
//                             fontSize: 14,
//                           ),
//                         ),
//                       )
//                     : RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Resend OTP ',
//                               style: StyleRefer.robotoSemiBold.copyWith(
//                                 color: AppColors.primary,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             TextSpan(
//                               text: '(${_formatTime(controller.resendSeconds)})',
//                               style: StyleRefer.robotoRegular.copyWith(
//                                 color: AppColors.lightgrey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                 const SizedBox(height: 30),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// ⏱ Format seconds → 00:12
//   String _formatTime(int seconds) {
//     final int minutes = seconds ~/ 60;
//     final int remainingSeconds = seconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
//   }
// }

// /// OTP BOX
// class _OtpBox extends StatelessWidget {
//   final ValueChanged<String> onChanged;

//   const _OtpBox({required this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 48,
//       child: TextField(
//         maxLength: 1,
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         style: StyleRefer.robotoSemiBold,
//         decoration: InputDecoration(
//           counterText: '',
//           filled: true,
//           fillColor: Colors.white, // ✅ white background
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: AppColors.primary),
//           ),
//         ),
//         onChanged: onChanged,
//       ),
//     );
//   }
// }
//  class _CircularDotsLoader extends StatefulWidget {
//   const _CircularDotsLoader();

//   @override
//   State<_CircularDotsLoader> createState() => _CircularDotsLoaderState();
// }

// class _CircularDotsLoaderState extends State<_CircularDotsLoader>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const int dotCount = 8;
//     const double radius = 22;

//     return Center(
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (_, __) {
//           return SizedBox(
//             width: 60,
//             height: 60,
//             child: Stack(
//               children: List.generate(dotCount, (index) {
//                 final double angle =
//                     (index * (2 * 3.1415926 / dotCount)) +
//                         (_controller.value * 2 * 3.1415926);

//                 // Size gradient (big → small)
//                 final double size =
//                     10 - (index * 0.8); // big first, then smaller

//                 return Positioned(
//                   left: 30 + radius * cos(angle) - size / 2,
//                   top: 30 + radius * sin(angle) - size / 2,
//                   child: Container(
//                     width: size,
//                     height: size,
//                     decoration: BoxDecoration(
//                       color: AppColors.primary.withOpacity(
//                         1 - (index * 0.1),
//                       ),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

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
                    fontSize: 16.sp,
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

                8.h.height,

                CustomButton(
                  title: 'Verify',
                  onPressed: controller.verifyOtp,
                ),

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
