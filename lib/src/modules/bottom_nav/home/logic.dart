import 'package:community_shopping_app/src/modules/bottom_nav/home/models/shoppingListModel.dart';
import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
import 'package:community_shopping_app/src/modules/splash/splash_view.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_fonts.dart';
import 'package:community_shopping_app/src/utils/app_strings.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:community_shopping_app/src/widgets/custom_button.dart';
import 'package:community_shopping_app/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  RxString userName = 'Thomas'.obs;
  final TextEditingController listNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var shoppingLists = <ShoppingListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addList(String name) {
    shoppingLists.add(ShoppingListModel(name: name));
  }

  void onSeeAll() {
    print('See all tapped');
  }

  //dialog box
  void openCreateListDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.whiteColor,
        insetPadding: EdgeInsets.symmetric(horizontal: 6.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
          ),
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// 🔹 Title + Close icon
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),

                      Expanded(
                        flex: 2,
                        child: Text(
                          'New list of products',
                          textAlign: TextAlign.center,
                          style: StyleRefer.robotoSemiBold.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(Icons.close, size: 5.w),
                          ),
                        ),
                      ),
                    ],
                  ),

                  3.h.height,

                  /// 🔹 TextField
                  CustomTextField(
                    hintText: 'Enter Name',
                    textColor: AppColors.hintGrey,
                     validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.productName;
                            }
                            return null;
                          },
                    onChanged: (val) {
                      listNameController.text = val;
                    },
                  ),

                  1.h.height,

                  /// 🔹 Button
                  CustomButton(
                    title: 'Create',
                    onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                          
                        if (listNameController.text.isNotEmpty) {
                             addList(listNameController.text);
                             Get.back();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

void onLogout() {
  Get.offAll(() => SplashView());
}
}
