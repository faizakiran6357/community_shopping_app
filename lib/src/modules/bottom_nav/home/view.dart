import 'package:community_shopping_app/src/utils/app_colors.dart';
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
          return Scaffold(
            drawer: Drawer(
              backgroundColor: AppColors.white,
              child: Column(
                children: [
                  10.h.height,
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      Get.back(); // close drawer
                      logic.onLogout();
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.white,
            body: Column(
              children: [
                HomeAppBar(
                  userName: logic.userName.value,
                  onAdd: logic.openCreateListDialog,
                  onSeeAll: logic.onSeeAll,
                ),
                12.h.height,

                if (logic.shoppingLists.isEmpty)
                  EmptyStateWidget()
                else
                  const SizedBox(),
              ],
            ),
          );
        });
      },
    );
  }
}
