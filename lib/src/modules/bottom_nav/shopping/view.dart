import 'package:community_shopping_app/src/modules/bottom_nav/shopping/logic.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/shopping/widgets/shopping_card_widget.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:community_shopping_app/src/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingLogic>(
      init: ShoppingLogic(),
      builder: (logic) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔝 CUSTOM TOP BAR
            CustomTopBar(
              drawerIconColor: AppColors.black,
              title: 'Shopping',
              titleColor: AppColors.black,

              /// ➕ ADD BUTTON
            ),

            16.height,

            /// 🧾 SHOPPING LIST CARDS
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                itemCount: logic.shoppingLists.length,
                itemBuilder: (context, index) {
                  final item = logic.shoppingLists[index];

                  return ShoppingCard(
                    title: item.title,
                    count: item.totalProducts,
                    onDelete: () {},
                    onExport: () {},
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
