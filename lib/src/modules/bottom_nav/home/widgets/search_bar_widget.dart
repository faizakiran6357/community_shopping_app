import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // 🔹 fixed height for perfect circle
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a product',
          hintStyle: StyleRefer.robotoRegular.copyWith(
            fontSize: 14,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
          ),

          /// 🔍 Prefix icon
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: AppColors.whiteColor,
              child: const Icon(Icons.search, color: AppColors.black),
            ),
          ),

          /// 📷 / Scan icon (suffix)
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Image(image: AssetImage(scanIcon), width: 24, height: 24),
          ),

          filled: true,
          fillColor: AppColors.whiteColor.withOpacity(0.25),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50), // 🔹 fully circular

            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.6),
              width: 1,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.6),
              width: 1,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.6),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
