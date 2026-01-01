import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';
class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationScreenLogic>(
      init: BottomNavigationScreenLogic(),
      builder: (logic) {
        return Obx(() {
          return Scaffold(
            backgroundColor: AppColors.white,
           
            /// ✅ DRAWER HERE (ONE TIME)
            drawer: Drawer(
              
              child: Column(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryButtonGradient,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('https://i.pravatar.cc/150?img=3'),
                        ),
                        3.w.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Ahmad Khan',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            Text('ahmad@email.com',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  _drawerItem(
                    icon: Icons.home_outlined,
                    title: 'Home',
                    onTap: () {
                      logic.onItemTapped(0);
                      Get.back();
                    },
                  ),

                  _drawerItem(
                    icon: Icons.list_alt_outlined,
                    title: 'Lists',
                    onTap: () {
                      logic.onItemTapped(1);
                      Get.back();
                    },
                  ),

                  Divider(),

                  _drawerItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    color: Colors.red,
                    onTap: () {
                      // logout logic
                    },
                  ),
                ],
              ),
            ),

            extendBody: true,
         





            body: IndexedStack(
              index: logic.selectedIndex.value,
              children: logic.pages,
            ),

            /// 🔽 Bottom Navigation
            bottomNavigationBar: SizedBox(
              height: 9.h, // ✅ responsive height
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [

                  /// 🎨 Background paint
                  CustomPaint(
                    size: Size(Get.width, 9.h),
                    painter: BottomBarPainter(),
                  ),

                  /// 🧭 Navigation items
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _navItem(
                          icon: homeIcon,
                          label: 'Home',
                          index: 0,
                          logic: logic,
                        ),
                        _navItem(
                          icon: listIcon,
                          label: 'Lists',
                          index: 1,
                          logic: logic,
                        ),

                        SizedBox(width: 12.w), // ✅ center gap

                        _navItem(
                          icon: shoppingIcon,
                          label: 'Shopping',
                          index: 3,
                          logic: logic,
                        ),
                        _navItem(
                          icon: profileIcon,
                          label: 'Profile',
                          index: 4,
                          logic: logic,
                        ),
                      ],
                    ),
                  ),

                  /// 🔵 Center Floating Scan Button
                  Positioned(
                    top: -2.h, // ✅ instead of -15
                    child: GestureDetector(
                      onTap: () {
                        print("🔵 Scan button tapped!");
                      },
                      child: Container(
                        width: 65, // ✅ instead of 65
                        height: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.primaryButtonGradient,
                        ),
                        child: Center(
                          child: SizedBox(
                            width:28, // ✅ instead of 28
                            height: 28,
                            child: Image.asset(
                              scannerIcon,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}


  Widget _navItem({
    required String icon,
    required String label,
    required int index,
    required BottomNavigationScreenLogic logic,
  }) {
    final bool isSelected = logic.selectedIndex.value == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          print("Tapped on index: $index");
          logic.onItemTapped(index);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(icon),
                width: 24,
                height: 24,
                color: isSelected ? AppColors.primary : AppColors.lightGrey,
              ),

              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected ? AppColors.primary : AppColors.lightGrey,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


// Custom painter for bottom bar with curved notch
class BottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    final path = Path();

    // Starting point
    path.moveTo(0, 35);

    // Top-left corner
    path.quadraticBezierTo(0, 0, 35, 0);

    // Left side before notch
    path.lineTo(size.width / 2 - 50, 0);

    // Curve going UP (left side of notch)
    path.quadraticBezierTo(size.width / 2 - 40, 0, size.width / 2 - 35, -10);

    // Top curve of notch
    path.quadraticBezierTo(size.width / 2 - 20, -25, size.width / 2, -25);

    path.quadraticBezierTo(size.width / 2 + 20, -25, size.width / 2 + 35, -10);

    // Curve going DOWN (right side of notch)
    path.quadraticBezierTo(size.width / 2 + 40, 0, size.width / 2 + 50, 0);

    // Right side after notch
    path.lineTo(size.width - 35, 0);

    // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width, 35);

    // Right edge
    path.lineTo(size.width, size.height - 35);

    // Bottom-right corner
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - 35,
      size.height,
    );

    // Bottom edge
    path.lineTo(35, size.height);

    // Bottom-left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - 35);

    // Left edge back to start
    path.lineTo(0, 35);

    path.close();

    // Draw shadow
    canvas.drawPath(path.shift(const Offset(0, 3)), shadowPaint);

    // Draw main shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
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
