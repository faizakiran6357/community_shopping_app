import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool isPassword;
  final TextInputType keyboardType;

  /// 👇 TEXT COLOR
  final Color textColor;

  final Widget? prefix;

  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.onChanged,
    this.validator,
    this.onTap,
    this.textColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 372,
      height: 70,
      child: TextFormField(
        initialValue: initialValue,
        obscureText: isPassword,
        keyboardType: keyboardType,

        /// ✅ USER ENTERED TEXT COLOR
        style: StyleRefer.robotoMedium.copyWith(color: textColor),

        onTap: onTap,
        onChanged: onChanged,
        validator: validator,

        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          filled: true, // ✅ VERY IMPORTANT
          fillColor: AppColors.white, // ✅ FORCE WHITE BACKGROUND
          /// ✅ FIX: PREFIX ICON ADDED
          prefixIcon: prefix != null
              ? Padding(padding: const EdgeInsets.all(12), child: prefix)
              : null,

          labelStyle: StyleRefer.robotoRegular.copyWith(
            color: AppColors.hintGrey,
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.lightgrey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.lightgrey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.lightgrey, width: 1),
          ),
        ),
      ),
    );
  }
}
