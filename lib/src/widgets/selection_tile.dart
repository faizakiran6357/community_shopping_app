
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class SelectionTile extends StatelessWidget {
  final String icon; // asset icon path
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7.79),
      child: Container(
        height: 70.84, 
        padding: const EdgeInsets.all(14.91), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.79),
          border: Border.all(
            width: 0.93,
            color: isSelected ? AppColors.primary : const Color(0xFFB6B6B6),
          ),
        ),
        child: Row(
          children: [
            Image.asset(icon, width: 22, height: 22), // asset icon size
            const SizedBox(width: 14.91),
            Expanded(
              child: Text(
                title,
                style: StyleRefer.lexendRegular.copyWith(
                  color: AppColors.black,
                  fontSize: 13, // adjust font size if needed
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
