import 'package:community_shopping_app/src/modules/bottom_nav/home/widgets/empty_state_widget.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
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
         
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 🔝 TOP BAR
            CustomTopBar(
              drawerIconColor: AppColors.black,
              title: 'List',
              titleColor: AppColors.black,

              /// ➕ CIRCLE ADD BUTTON
              suffixIcon: Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    // TODO: add list action
                  },
                ),
              ),
              onSuffixTap: () {},
            ),
            150.height,

            /// 📍 CENTER EMPTY STATE
            EmptyStateWidget(),
          ],
        );
      },
    );
  }
}
