
import 'package:flutter/material.dart';
class CustomTopBar extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color drawerIconColor;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;

  const CustomTopBar({
    super.key,
    required this.title,
    required this.titleColor,
    required this.drawerIconColor,
    this.suffixIcon,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// ☰ DRAWER ICON (IconButton)
            IconButton(
              icon: Icon(
                Icons.menu,
                color: drawerIconColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),

            /// 🔹 TITLE
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            /// 🔹 SUFFIX ICON
            suffixIcon != null
                ? IconButton(
                    icon: suffixIcon!,
                    onPressed: onSuffixTap,
                  )
                : const SizedBox(width: 48), // balance layout
          ],
        ),
      ),
    );
  }
}
