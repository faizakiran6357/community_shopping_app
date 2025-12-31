import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
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
              child: Column(
                children: [
                  /// ===============================
                  /// DRAWER HEADER (PROFILE)
                  /// ===============================
                  DrawerHeader(
                    decoration: BoxDecoration(gradient: AppColors.primaryButtonGradient),
                    child: Row(
                      children: [
                        /// PROFILE IMAGE
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=3', // 👈 dummy avatar
                          ),
                        ),

                        4.w.width,

                        /// USER INFO
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ahmad khan', // 👈 user name
                              style: StyleRefer.robotoSemiBold.copyWith(
                                fontSize: 14.sp,
                                color:AppColors.white,
                              ),
                            ),
                            0.5.h.height,
                            Text(
                              'ahmad@email.com',
                              style: StyleRefer.robotoRegular.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.white
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// ===============================
                  /// DRAWER ITEMS
                  /// ===============================
                  _drawerItem(
                    icon: Icons.home_outlined,
                    title: 'Home',
                    onTap: () {
                      Get.back();
                    },
                  ),

                  _drawerItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'My Orders',
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.person_outline,
                    title: 'Profile',
                    onTap: () {},
                  ),

                  _drawerItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {},
                  ),


                  /// ===============================
                  /// LOGOUT
                  /// ===============================
                  Divider(thickness: 1),

                  _drawerItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    color: Colors.red,
                    onTap: () {
                      logic.onLogout();
                    },
                  ),

                  2.h.height,
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

Widget _drawerItem({
  required IconData icon,
  required String title,
  Color color = Colors.black,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      title,
      style: StyleRefer.robotoRegular.copyWith(fontSize: 12.sp, color: color),
    ),
    onTap: onTap,
  );
}
