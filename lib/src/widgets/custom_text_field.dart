
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;

  /// ANY widget: Icon, Image, CircleAvatar etc
  final Widget? prefix;

  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.onChanged,
    this.validator,  
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 372, // Figma width
      height: 70, // Figma height
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: StyleRefer.robotoMedium.copyWith(
          color: AppColors.black,
        ),
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: StyleRefer.robotoRegular.copyWith(
            color: AppColors.hintGrey,
          ),

          helperText: ' ',
          helperStyle: const TextStyle(height: 0.8),
          errorStyle: const TextStyle(
            height: 1,
            fontSize: 12,
          ),

          /// PREFIX
          prefixIcon: prefix != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: prefix,
                )
              : null,

          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.lightgrey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color:AppColors.lightgrey,  width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.lightgrey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
