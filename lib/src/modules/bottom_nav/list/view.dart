import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:community_shopping_app/src/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';
class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListLogic>(
      init: ListLogic(),
      builder: (logic) {
        return Column(
          children: [
            CustomTopBar(
              drawerIconColor: AppColors.black,
              title: 'List',
              titleColor: AppColors.black,
              suffixIcon: Image(
                image: AssetImage(notification),
                width: 6.w,
                height: 6.w,
                color: AppColors.black,
              ),
              onSuffixTap: () {},
            ),
          ],
        );
      },
    );
  }
}
