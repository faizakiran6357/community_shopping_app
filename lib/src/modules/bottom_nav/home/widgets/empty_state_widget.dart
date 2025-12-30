import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          emptyListIcon,
          width: 28.w,  
          height: 18.h,  
        ),

        2.h.height, 
        Text(
          'No items yet!',
          style: StyleRefer.robotoRegular.copyWith(
            fontSize: 11.sp,
            color: AppColors.black,
          ),
        ),

        0.3.h.height,

        Text(
          'Start adding to your list',
          style: StyleRefer.robotoRegular.copyWith(
            fontSize: 11.sp,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
