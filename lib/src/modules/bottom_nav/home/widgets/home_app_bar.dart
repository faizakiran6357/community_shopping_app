import 'package:community_shopping_app/src/modules/bottom_nav/home/widgets/search_bar_widget.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/home/widgets/shopping_list_card.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
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
      // height: 315,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(gradient: AppColors.primaryButtonGradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage(drawer), width: 24, height: 24),

              Text(
                'Home',
                style: StyleRefer.robotoMedium.copyWith(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Image(image: AssetImage(notification), width: 24, height: 24),
            ],
          ),
          const SizedBox(height: 16),
          const SearchBarWidget(),
          const SizedBox(height: 16),
          ShoppingListCard(
            userName: userName,
            onAdd: onAdd,
            onSeeAll: onSeeAll,
          ),
        ],
      ),
    );
  }
}
