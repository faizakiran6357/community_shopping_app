import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Image(image: AssetImage(emptyListIcon),width: 109,height: 130,),
      
        SizedBox(height: 12),
        Text('No items yet!', style: StyleRefer.robotoRegular.copyWith(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),),
        Text('Start adding to your list', style: StyleRefer.robotoRegular.copyWith(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),),
      ],
    );
  }
}
