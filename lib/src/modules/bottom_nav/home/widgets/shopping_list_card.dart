import 'package:community_shopping_app/src/modules/bottom_nav/home/logic.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingListCard extends StatelessWidget {
  final String userName;
  final VoidCallback onAdd;
  final VoidCallback onSeeAll;

  ShoppingListCard({
    super.key,
    required this.userName,
    required this.onAdd,
    required this.onSeeAll,
  });

  final HomeLogic controller = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Top Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome $userName!',
              style: StyleRefer.robotoSemiBold.copyWith(
                fontSize: 12.sp,
                color: AppColors.whiteColor,
              ),
            ),
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'See all',
                style: StyleRefer.robotoSemiBold.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),

        2.h.height,

        /// 🔹 Main Card
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(
              color: AppColors.whiteColor.withOpacity(0.6),
              width: 0.2.w,
            ),
          ),
          child: Column(
            children: [
              /// 🔹 Header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.25),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(4.w),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shopping Lists',
                      style: StyleRefer.robotoMedium.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: 3.5.w,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onAdd,
                        icon: Icon(Icons.add, size: 4.w, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔹 Table Header
              Container(
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(4.w),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),

                child: Row(
                  children: [
                    _headerText('Name', 6),
                    _headerText('Items', 2),
                    _headerText('Stores', 2, center: true),
                    _headerText('Plan', 2, end: true),
                  ],
                ),
              ),

              /// 🔹 List Items
              Obx(() {
                final lists = controller.shoppingLists.take(3).toList();

                return Column(
                  children: List.generate(lists.length, (index) {
                    final list = lists[index];

                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.5.h,
                          ),
                          color: AppColors.whiteColor.withOpacity(0.15),
                          child: Row(
                            children: [
                              _rowText(list.name, 6),
                              _rowText(list.items.toString(), 2),
                              _rowText(list.stores.toString(), 2, center: true),
                              Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.description_outlined,
                                  size: 4.w,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// 🔹 Divider (NOT after last item)
                        if (index != lists.length - 1)
                          Divider(
                            color: AppColors.dividerColor,
                            thickness: 0.15.h,
                            height: 0.2.h,
                          ),
                      ],
                    );
                  }),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _headerText(
    String text,
    int flex, {
    bool center = false,
    bool end = false,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: center
            ? TextAlign.center
            : end
            ? TextAlign.right
            : TextAlign.left,
        style: StyleRefer.robotoMedium.copyWith(
          fontSize: 9.sp,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  Widget _rowText(String text, int flex, {bool center = false}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: center ? TextAlign.center : TextAlign.left,
        style: StyleRefer.robotoRegular.copyWith(
          fontSize: 9.sp,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
