import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
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
            extendBody: true,
            body: IndexedStack(
              index: logic.selectedIndex.value,
              children: logic.pages,
            ),
            bottomNavigationBar: SizedBox(
              height: 70,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 70),
                    painter: BottomBarPainter(),
                  ),

                  // Bottom navigation items (FOREGROUND with pointer events)
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
                        const SizedBox(width: 80), // Space for center button
                        _navItem(
                          icon: shoppingIcon,
                          label: 'Shopping',
                          index: 2,
                          logic: logic,
                        ),
                        _navItem(
                          icon: profileIcon,
                          label: 'Profile',
                          index: 3,
                          logic: logic,
                        ),
                      ],
                    ),
                  ),

                  // Center floating button
                  Positioned(
                    top: -15,
                    child: GestureDetector(
                      onTap: () {
                        print("🔵 Scan button tapped!");
                        // Add your scan logic here
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.primaryButtonGradient,
                        ),
                        child: Center(
                          child: 
                          SizedBox(
                            height: 28,
                            width: 28,
                            child: Image(image: AssetImage(scannerIcon),)))
                       
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
