// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import '../utils/app_fonts.dart';

// class CustomButton extends StatelessWidget {
//   final String title;
//   final VoidCallback onPressed;
//   final bool isLoading;

//   const CustomButton({
//     super.key,
//     required this.title,
//     required this.onPressed,
//     this.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: isLoading ? null : onPressed,
//       child: Container(
//         width: double.infinity, 
//         height: 48,
//         decoration: BoxDecoration(
//           gradient: AppColors.primaryButtonGradient,
//           borderRadius: BorderRadius.circular(100),
//         ),
//         alignment: Alignment.center,
//         child: isLoading
//             ? const SizedBox(
//                 height: 22,
//                 width: 22,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   color: AppColors.white,
//                 ),
//               )
//             : Text(
//                 title,
//                 style: StyleRefer.robotoMedium.copyWith(
//                   color: AppColors.white,
//                 ),
//               ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

enum ButtonType { primary, outlined }

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.title,
     this.onPressed,
    this.isLoading = false,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero, 
          backgroundColor:
              type == ButtonType.primary ? Colors.transparent : AppColors.white,
          foregroundColor:
              type == ButtonType.primary ? AppColors.white : AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: type == ButtonType.outlined
                ? BorderSide(color: AppColors.lightGrey)
                : BorderSide.none,
          ),
        ),
        child: Ink(
          width: double.infinity, 
          height: double.infinity, 
          decoration: type == ButtonType.primary
              ? BoxDecoration(
                  gradient: AppColors.primaryButtonGradient,
                  borderRadius: BorderRadius.circular(100),
                )
              : null,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white,
                    ),
                  )
                : Text(
                    title,
                    style: StyleRefer.robotoMedium.copyWith(
                      color: type == ButtonType.primary
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
