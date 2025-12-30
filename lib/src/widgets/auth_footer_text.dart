import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class AuthFooterText extends StatelessWidget {
  final String fullText;
  final String actionText;
  final VoidCallback? onTap;

  const AuthFooterText({
    super.key,
    required this.fullText,
    required this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final int index = fullText.indexOf(actionText);

    // fallback (safe)
    if (index == -1) {
      return Text(
        fullText,
        style: StyleRefer.robotoMedium.copyWith(
          fontSize: 10.sp,
          color: AppColors.lightGrey,
        ),
      );
    }

    final String beforeText = fullText.substring(0, index);
    final String clickableText = fullText.substring(index);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: beforeText,
            style: StyleRefer.robotoMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.lightGrey,
            ),
          ),
          TextSpan(
            text: clickableText,
            style: StyleRefer.robotoMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.signUpBlue,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
