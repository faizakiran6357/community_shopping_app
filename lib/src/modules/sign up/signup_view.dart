
import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/auth_footer_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'signup_logic.dart';

class SignUpView extends GetView<SignUpLogic> {
  SignUpView({super.key});

  // ✅ Form key in view
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<SignUpLogic>(
        init: SignUpLogic(),
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   6.h.height,
                  const Center(child: AuthLogoTitle()),

                 
                   4.h.height,
                  Text(
                    'Sign up',
                    style: StyleRefer.robotoSemiBold.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                   1.h.height,
                  Text(
                    AppStrings.completeProfileTitle,
                    style: StyleRefer.robotoRegular.copyWith(
                      color: AppColors.grey,
                    ),
                  ),

                   3.h.height,

                  /// PROFILE IMAGE
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GetBuilder<SignUpLogic>(
                          builder: (c) => CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage: c.profileImage != null
                                ? FileImage(c.profileImage!)
                                : null,
                            child: c.profileImage == null
                                ? ClipOval(
                                    child: Image.asset(
                                      person,
                                      width: 48.98,
                                      height: 48.98,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                _imagePickerSheet(context),
                                backgroundColor: Colors.white,
                              );
                            },
                            child: CircleAvatar(
                              radius: 16.835,
                              backgroundColor: AppColors.whitegrey,
                              child: Image.asset(
                                edit,
                                width: 18,
                                height: 18,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   4.h.height,

                  // ================= FORM START =================
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: 'First name',
                          hintText: 'Enter first name',
                          prefix: Image.asset(
                           personIcon,
                            width: 20,
                            height: 20,
                            color: controller.hasTypedFirstName
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: controller.setFirstName,
                          // ✅ Validator in view
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.lastname;
                            }
                            return null;
                          },
                        ),
                        2.h.height,
                        CustomTextField(
                          labelText: 'Last name',
                          hintText: 'Enter last name',
                          prefix: Image.asset(
                           personIcon,
                            width: 20,
                            height: 20,
                            color: controller.hasTypedLastName
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: controller.setLastName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.lastname;
                            }
                            return null;
                          },
                        ),
                         2.h.height,
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          keyboardType: TextInputType.emailAddress,
                          prefix: Image.asset(
                            emailIcon,
                            width: 20,
                            height: 20,
                            color: controller.hasTypedEmail
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: controller.setEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!value.contains('@')) {
                              return AppStrings.email;
                            }
                            return null;
                          },
                        ),
                        2.h.height,
                        GetBuilder<SignUpLogic>(
                          builder: (_) {
                            return CustomTextField(
                              labelText: 'Phone number',
                              hintText: 'Enter phone number',
                              keyboardType: TextInputType.phone,
                              onChanged: controller.setPhone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                               return AppStrings.phone;
                                }
                                return null;
                              },
                              prefix: Padding(
                                padding: const EdgeInsets.only(left: 12, right: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    showCountryPicker(
                                      context: context,
                                      showPhoneCode: false,
                                      onSelect: (country) {
                                        controller
                                            .setCountryFlag(country.flagEmoji);
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller.selectedFlag ?? '🇺🇸',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Icon(Icons.arrow_drop_down),
                                       1.w.width,
                                      const Text(
                                        '|',
                                        style: TextStyle(
                                          color: Color(0xFFB6B6B6),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                       1.w.width,
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      4.h.height,
                        CustomButton(
                          title: 'Sign up',
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            controller.goToVerification();
                          },
                        ),
                      ],
                    ),
                  ),
                  // ================= FORM END =================

                   2.h.height,
                  Center(
                    child: AuthFooterText(
                      fullText: AppStrings.alreadyHaveAccount,
                      actionText: 'Sign In',
                      onTap: () {
                        Get.to(() => SignInView());
                      },
                    ),
                  ),
                   3.h.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _imagePickerSheet(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Camera'),
          onTap: () {
            controller.pickImage(ImageSource.camera);
            Get.back();
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('Gallery'),
          onTap: () {
            controller.pickImage(ImageSource.gallery);
            Get.back();
          },
        ),
      ],
    );
  }
}
