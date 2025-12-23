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
      width: double.infinity,
      height: 60,
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

          /// 🔥 FLEXIBLE PREFIX
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

          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color(0xFFB6B6B6), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color(0xFFB6B6B6), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color(0xFFB6B6B6), width: 1),
          ),
        ),
      ),
    );
  }
}
