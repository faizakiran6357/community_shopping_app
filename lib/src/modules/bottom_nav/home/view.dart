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
            body: Column(
            
              children: [
                HomeAppBar(
                  userName: logic.userName.value,
                  onAdd: logic.onAddList,
                  onSeeAll: logic.onSeeAll,
                ),
                12.h.height,
               
                EmptyStateWidget()
              ],
            ),
          );
        });
      },
    );
  }
}
