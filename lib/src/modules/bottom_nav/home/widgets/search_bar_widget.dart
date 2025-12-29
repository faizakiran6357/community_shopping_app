import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h, // 🔹 responsive height (instead of 48)
      child: TextField(
        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.whiteColor,
        ),
        decoration: InputDecoration(
          hintText: 'Search for a product',
          hintStyle: StyleRefer.robotoRegular.copyWith(
            fontSize: 12.sp, // 🔹 responsive font
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
          ),

          /// 🔍 Prefix icon
          prefixIcon: Padding(
            padding: EdgeInsets.all(1.h),
            child: CircleAvatar(
              radius: 2.h,
              backgroundColor: AppColors.whiteColor,
              child: Icon(
                Icons.search,
                color: AppColors.black,
                size: 2.5.h,
              ),
            ),
          ),

          /// 📷 Scan icon
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Image(
              image: AssetImage(scanIcon),
              width: 5.w,
              height: 5.w,
            ),
          ),

          filled: true,
          fillColor: AppColors.whiteColor.withOpacity(0.25),

          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
        ),
      ),
    );
  }

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          color: AppColors.white.withOpacity(0.6),
          width: 0.2.w, // 🔹 responsive border width
        ),
      );
}
