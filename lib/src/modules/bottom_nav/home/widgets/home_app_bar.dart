import 'package:community_shopping_app/src/modules/bottom_nav/home/widgets/search_bar_widget.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/home/widgets/shopping_list_card.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;
  final VoidCallback onAdd;
  final VoidCallback onSeeAll;

  const HomeAppBar({
    super.key,
    required this.userName,
    required this.onAdd,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: AppColors.primaryButtonGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 top spacing
          6.h.height,

          /// 🔹 AppBar Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage(drawer), width: 6.w, height: 6.w),

              Text(
                'Home',
                style: StyleRefer.robotoMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Image(image: AssetImage(notification), width: 6.w, height: 6.w),
            ],
          ),

          /// 🔹 space
          2.h.height,

          /// 🔍 Search Bar
          const SearchBarWidget(),

          /// 🔹 space
          2.h.height,

          /// 🛒 Shopping List Card
          ShoppingListCard(
            userName: userName,
            onAdd: onAdd,
            onSeeAll: onSeeAll,
          ),

          /// 🔹 bottom spacing
          3.h.height,
        ],
      ),
    );
  }
}
