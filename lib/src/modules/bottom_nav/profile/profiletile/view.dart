// import 'package:community_shopping_app/src/modules/bottom_nav/profile/profiletile/logic.dart';
// import 'package:community_shopping_app/src/utils/app_colors.dart';
// import 'package:community_shopping_app/src/utils/app_images.dart';
// import 'package:community_shopping_app/src/utils/sizer.dart';
// import 'package:community_shopping_app/src/widgets/custom_button.dart';
// import 'package:community_shopping_app/src/widgets/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:country_picker/country_picker.dart';

// class ProfileTileView extends StatelessWidget {
//   ProfileTileView({super.key});

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,

//       /// 🔝 APP BAR
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: false,
//       ),

//       body: GetBuilder<ProfileTileLogic>(
//         init: ProfileTileLogic(),
//         builder: (controller) {
//           return SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   3.h.height,

//                   /// 👤 PROFILE IMAGE
//                   Center(
//                     child: Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundColor: Colors.white,
//                           backgroundImage: controller.profileImage != null
//                               ? FileImage(controller.profileImage!)
//                               : null,
//                           child: controller.profileImage == null
//                               ? Image.asset(person, width: 45)
//                               : null,
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: InkWell(
//                             onTap: () {
//                               Get.bottomSheet(
//                                 _imagePickerSheet(context, controller),
//                                 backgroundColor: Colors.white,
//                               );
//                             },
//                             child: CircleAvatar(
//                               radius: 16,
//                               backgroundColor: AppColors.whitegrey,
//                               child: Image.asset(edit, width: 18),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),

//                   4.h.height,

//                   /// 📝 FORM
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         CustomTextField(
//                           labelText: 'First name',
//                           hintText: 'Enter first name',
//                           prefix: Image.asset(personIcon, width: 20),
//                           onChanged: controller.setFirstName,
//                         ),
//                         2.h.height,

//                         CustomTextField(
//                           labelText: 'Last name',
//                           hintText: 'Enter last name',
//                           prefix: Image.asset(personIcon, width: 20),
//                           onChanged: controller.setLastName,
//                         ),
//                         2.h.height,

//                         CustomTextField(
//                           labelText: 'Email',
//                           hintText: 'Enter email',
//                           keyboardType: TextInputType.emailAddress,
//                           prefix: Image.asset(emailIcon, width: 20),
//                           onChanged: controller.setEmail,
//                         ),
//                         2.h.height,

//                         /// 📞 PHONE
//                         CustomTextField(
//                           labelText: 'Phone number',
//                           hintText: 'Enter phone number',
//                           keyboardType: TextInputType.phone,
//                           onChanged: controller.setPhone,
//                           prefix: Padding(
//                             padding: const EdgeInsets.only(left: 12, right: 8),
//                             child: GestureDetector(
//                               onTap: () {
//                                 showCountryPicker(
//                                   context: context,
//                                   onSelect: (country) {
//                                     controller.setCountryFlag(
//                                         country.flagEmoji);
//                                   },
//                                 );
//                               },
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     controller.selectedFlag ?? '🇺🇸',
//                                     style: const TextStyle(fontSize: 20),
//                                   ),
//                                   const Icon(Icons.arrow_drop_down),
//                                   const Text('|'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         2.h.height,

//                         /// 🚻 GENDER
//                         CustomTextField(
//                           labelText: 'Gender',
//                           hintText: 'Enter gender',
//                           prefix: const Icon(Icons.person_outline),
//                           onChanged: controller.setGender,
//                         ),
//                         2.h.height,

//                         /// 📮 POSTAL CODE
//                         CustomTextField(
//                           labelText: 'Postal Code',
//                           hintText: 'Enter postal code',
//                           keyboardType: TextInputType.number,
//                           prefix:
//                               const Icon(Icons.location_on_outlined),
//                           onChanged: controller.setPostalCode,
//                         ),

//                         4.h.height,

//                         /// 🔵 UPDATE BUTTON
//                         CustomButton(
//                           title: 'Update',
//                           onPressed: () {
//                             if (!_formKey.currentState!.validate()) return;
//                             // controller.updateProfile();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   3.h.height,
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _imagePickerSheet(
//       BuildContext context, ProfileTileLogic controller) {
//     return Wrap(
//       children: [
//         ListTile(
//           leading: const Icon(Icons.camera_alt),
//           title: const Text('Camera'),
//           onTap: () {
//             controller.pickImage(ImageSource.camera);
//             Get.back();
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.photo),
//           title: const Text('Gallery'),
//           onTap: () {
//             controller.pickImage(ImageSource.gallery);
//             Get.back();
//           },
//         ),
//       ],
//     );
//   }
// }
// import 'dart:io';
// import 'package:community_shopping_app/src/modules/bottom_nav/profile/profiletile/logic.dart';
// import 'package:community_shopping_app/src/utils/app_colors.dart';
// import 'package:community_shopping_app/src/utils/app_images.dart';
// import 'package:community_shopping_app/src/utils/sizer.dart';
// import 'package:community_shopping_app/src/widgets/custom_button.dart';
// import 'package:community_shopping_app/src/widgets/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:country_picker/country_picker.dart';

// class ProfileTileView extends StatelessWidget {
//   ProfileTileView({super.key});

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,

//       /// 🔝 APP BAR
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),

//       body: GetBuilder<ProfileTileLogic>(
//         init: ProfileTileLogic(),
//         builder: (controller) {
//           return SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   3.h.height,

//                   /// 👤 PROFILE IMAGE
//                   Center(
//                     child: Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundColor: Colors.white,
//                           backgroundImage: controller.profileImage != null
//                               ? FileImage(controller.profileImage!)
//                               : null,
//                           child: controller.profileImage == null
//                               ? Image.asset(person, width: 45)
//                               : null,
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: InkWell(
//                             onTap: () {
//                               Get.bottomSheet(
//                                 _imagePickerSheet(context, controller),
//                                 backgroundColor: Colors.white,
//                               );
//                             },
//                             child: CircleAvatar(
//                               radius: 16,
//                               backgroundColor: AppColors.whitegrey,
//                               child: Image.asset(edit, width: 18),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),

//                   4.h.height,

//                   /// 📝 FORM
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         /// FIRST NAME
//                         CustomTextField(
//                           labelText: 'First name',
//                           hintText: 'Enter first name',
//                           prefix: Image.asset(
//                             personIcon,
//                             width: 20,
//                             color: controller.hasTypedFirstName
//                                 ? Colors.black
//                                 : Colors.grey,
//                           ),
//                           onChanged: controller.setFirstName,
//                         ),
//                         2.h.height,

//                         /// LAST NAME
//                         CustomTextField(
//                           labelText: 'Last name',
//                           hintText: 'Enter last name',
//                           prefix: Image.asset(
//                             personIcon,
//                             width: 20,
//                             color: controller.hasTypedLastName
//                                 ? Colors.black
//                                 : Colors.grey,
//                           ),
//                           onChanged: controller.setLastName,
//                         ),
//                         2.h.height,

//                         /// EMAIL
//                         CustomTextField(
//                           labelText: 'Email',
//                           hintText: 'Enter email',
//                           keyboardType: TextInputType.emailAddress,
//                           prefix: Image.asset(
//                             emailIcon,
//                             width: 20,
//                             color: controller.hasTypedEmail
//                                 ? Colors.black
//                                 : Colors.grey,
//                           ),
//                           onChanged: controller.setEmail,
//                         ),
//                         2.h.height,

//                         /// PHONE
//                         CustomTextField(
//                           labelText: 'Phone number',
//                           hintText: 'Enter phone number',
//                           keyboardType: TextInputType.phone,
//                           onChanged: controller.setPhone,
//                           prefix: Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 12, right: 8),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   controller.selectedFlag ?? '🇺🇸',
//                                   style: const TextStyle(fontSize: 20),
//                                 ),
//                                 Icon(
//                                   Icons.arrow_drop_down,
//                                   color: controller.hasTypedPhone
//                                       ? Colors.black
//                                       : Colors.grey,
//                                 ),
//                                 const Text('|'),
//                               ],
//                             ),
//                           ),
//                         ),
//                         2.h.height,

//                         /// GENDER
//                         CustomTextField(
//                           labelText: 'Gender',
//                           hintText: 'Enter gender',
//                           prefix: Icon(
//                             Icons.person_outline,
//                             color: controller.hasTypedGender
//                                 ? Colors.black
//                                 : Colors.grey,
//                           ),
//                           onChanged: controller.setGender,
//                         ),
//                         2.h.height,

//                         /// POSTAL CODE
//                         CustomTextField(
//                           labelText: 'Postal Code',
//                           hintText: 'Enter postal code',
//                           keyboardType: TextInputType.number,
//                           prefix: Icon(
//                             Icons.location_on_outlined,
//                             color: controller.hasTypedPostalCode
//                                 ? Colors.black
//                                 : Colors.grey,
//                           ),
//                           onChanged: controller.setPostalCode,
//                         ),

//                         4.h.height,

//                         /// UPDATE BUTTON
//                         CustomButton(
//                           title: 'Update',
//                           onPressed: () {
//                             if (!_formKey.currentState!.validate()) return;
//                             controller.updateProfile();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   3.h.height,
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// IMAGE PICKER
//   Widget _imagePickerSheet(
//       BuildContext context, ProfileTileLogic controller) {
//     return Wrap(
//       children: [
//         ListTile(
//           leading: const Icon(Icons.camera_alt),
//           title: const Text('Camera'),
//           onTap: () {
//             controller.pickImage(ImageSource.camera);
//             Get.back();
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.photo),
//           title: const Text('Gallery'),
//           onTap: () {
//             controller.pickImage(ImageSource.gallery);
//             Get.back();
//           },
//         ),
//       ],
//     );
//   }
// }
import 'dart:io';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/profiletile/logic.dart';
import 'package:community_shopping_app/src/utils/app_colors.dart';
import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/app_strings.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:community_shopping_app/src/widgets/custom_button.dart';
import 'package:community_shopping_app/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTileView extends StatelessWidget {
  ProfileTileView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      /// 🔝 APP BAR
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: GetBuilder<ProfileTileLogic>(
        init: ProfileTileLogic(),
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  3.h.height,

                  /// 👤 PROFILE IMAGE
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: controller.profileImage != null
                              ? FileImage(controller.profileImage!)
                              : null,
                          child: controller.profileImage == null
                              ? Image.asset(person, width: 45)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                _imagePickerSheet(context, controller),
                                backgroundColor: Colors.white,
                              );
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.whitegrey,
                              child: Image.asset(edit, width: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  4.h.height,

                  /// 📝 FORM
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /// FIRST NAME
                        CustomTextField(
                          labelText: 'First name',
                          hintText: 'Enter first name',
                          prefix: Image.asset(
                            personIcon,
                            width: 20,
                            color: controller.hasTypedFirstName
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: controller.setFirstName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.firstname;
                            }
                            return null;
                          },
                        ),
                        2.h.height,

                        /// LAST NAME
                        CustomTextField(
                          labelText: 'Last name',
                          hintText: 'Enter last name',
                          prefix: Image.asset(
                            personIcon,
                            width: 20,
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

                        /// EMAIL
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          keyboardType: TextInputType.emailAddress,
                          prefix: Image.asset(
                            emailIcon,
                            width: 20,
                            color: controller.hasTypedEmail
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: controller.setEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.email;
                            }
                            if (!value.contains('@')) {
                              return AppStrings.validemail;
                            }
                            return null;
                          },
                        ),
                        2.h.height,

                        /// PHONE
                        CustomTextField(
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.selectedFlag ?? '🇺🇸',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: controller.hasTypedPhone
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                const Text('|'),
                              ],
                            ),
                          ),
                        ),
                        2.h.height,

                        /// GENDER
                        CustomTextField(
                          labelText: 'Gender',
                          hintText: 'Enter gender',
                          prefix: Image.asset(
                            personIcon,
                            width: 20,
                            height: 20,
                            color: controller.hasTypedGender
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: controller.setGender,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.gender;
                            }
                            return null;
                          },
                        ),
                        2.h.height,

                        /// POSTAL CODE
                        CustomTextField(
                          labelText: 'Postal Code',
                          hintText: 'Enter postal code',
                          keyboardType: TextInputType.number,
                         prefix: Image.asset(
                            postal,
                            width: 20,
                            height: 20,
                            color: controller.hasTypedPostalCode
                                ? Colors.black
                                : Colors.grey,
                          ),
                          onChanged: controller.setPostalCode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.postal;
                            }
                            return null;
                          },
                        ),

                        4.h.height,

                        /// UPDATE BUTTON
                        CustomButton(
                          title: 'Update',
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            controller.updateProfile();
                          },
                        ),
                      ],
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

  /// IMAGE PICKER
  Widget _imagePickerSheet(
      BuildContext context, ProfileTileLogic controller) {
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
