import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';

class ShoppingListCard extends StatelessWidget {
  final String userName;
  final VoidCallback onAdd;
  final VoidCallback onSeeAll;

  const ShoppingListCard({
    super.key,
    required this.userName,
    required this.onAdd,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// 🔹 Top Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome $userName!',
              style: StyleRefer.robotoSemiBold.copyWith(
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ),
            ),
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'See all',
                style: StyleRefer.robotoSemiBold.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),

        2.h.height, // instead of SizedBox(height: 12)

        /// 🔹 Main Card
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(
              color: AppColors.whiteColor.withOpacity(0.60),
              width: 0.2.w,
            ),
          ),
          child: Column(
            children: [

              /// 🔹 Header
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.8.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.25),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(4.w),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shopping Lists',
                      style: StyleRefer.robotoMedium.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: 3.5.w,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onAdd,
                        icon: Icon(
                          Icons.add,
                          size: 4.w,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔹 Table Header
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.2.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(4.w),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Name',
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Items',
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Stores',
                        textAlign: TextAlign.center,
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Plan',
                        textAlign: TextAlign.right,
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 11.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
