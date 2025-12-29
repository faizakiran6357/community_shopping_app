import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome $userName!',
              style: StyleRefer.robotoSemiBold.copyWith(
                fontSize: 16,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'See all',
                style: StyleRefer.robotoSemiBold.copyWith(
                  fontSize: 12,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        /// Card
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.whiteColor.withOpacity(0.60),
              width: 1.0,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(
                    0.25,
                  ), // lighter shade
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shopping Lists',
                      style: StyleRefer.robotoMedium.copyWith(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onAdd,
                        icon: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔹 Table Header Row (DARKER COLOR)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.25), // darker shade
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(18),
                  ),
                ),
                child: Row(
                  children: [
                    /// Name (left aligned, wide)
                    Expanded(
                      flex: 8,
                      child: Text(
                        'Name',
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    /// Items (center)
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Items',
                        //textAlign: TextAlign.center,
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    /// Stores (center)
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Stores',
                        textAlign: TextAlign.center,
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Text(
                        'Plan',
                        textAlign: TextAlign.right,
                        style: StyleRefer.robotoMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
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
