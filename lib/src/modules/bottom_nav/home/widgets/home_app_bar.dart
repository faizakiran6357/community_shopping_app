import 'package:community_shopping_app/src/modules/bottom_nav/home/widgets/search_bar_widget.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/home/widgets/shopping_list_card.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:community_shopping_app/src/widgets/custom_top_bar.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: AppColors.primaryButtonGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Top bar
          CustomTopBar(
            title: 'Home',
            drawerIconColor: AppColors.white,
            titleColor: AppColors.white,
            suffixIcon: Image(
              image: AssetImage(notification),
              width: 6.w,
              height: 6.w,
            ),
            onSuffixTap: () {},
          ),

          2.h.height,

          /// 🔹 Search bar
          const SearchBarWidget(),

          2.h.height,

          /// 🔹 Shopping list card inside same gradient container
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
