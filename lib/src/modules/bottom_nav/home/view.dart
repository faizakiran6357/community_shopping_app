
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/empty_state_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
      init: HomeLogic(),
      builder: (logic) {
        return Obx(() {
          return Column(
            children: [
              /// 🔹 Top gradient container: Custom top bar + search bar
              HomeAppBar(
                userName: logic.userName.value,
                onAdd: logic.openCreateListDialog,
                onSeeAll: logic.onSeeAll,
              ),

              /// 🔹 Rest of the screen must scroll
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  child: Column(
                    children: [
                      if (logic.shoppingLists.isEmpty)
                        EmptyStateWidget()
                    
                     
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
