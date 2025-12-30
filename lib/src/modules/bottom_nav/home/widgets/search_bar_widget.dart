import 'package:community_shopping_app/src/modules/bottom_nav/home/search/view.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';

class SearchBarWidget extends StatelessWidget {
  final bool enableSearch;

  const SearchBarWidget({
    super.key,
    this.enableSearch = true, // 👈 default true (home)
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      child: TextField(
        readOnly: true,
        onTap: enableSearch
            ? () {
                showSearch(
                  context: context,
                  delegate: AppSearchDelegate(),
                );




              }
            : null, // 🔴 disable inside SearchDelegate

        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.whiteColor,
        ),
        decoration: InputDecoration(
          hintText: 'Search for a product',
          hintStyle: StyleRefer.robotoRegular.copyWith(
            fontSize: 12.sp,
            color: AppColors.whiteColor,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(1.h),
            child: CircleAvatar(
              backgroundColor: AppColors.whiteColor,
              child: Icon(
                Icons.search,
                color: AppColors.black,
                size: 2.5.h,
              ),
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Image(
              image: AssetImage(scanIcon),
              width: 5.w,
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
          width: 0.2.w,
        ),
      );
}
