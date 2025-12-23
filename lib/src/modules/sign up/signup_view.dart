// import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/app_fonts.dart';
// import '../../utils/app_strings.dart';
// import '../../widgets/auth_logo_title.dart';
// import '../../widgets/auth_footer_text.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/custom_text_field.dart';
// import 'signup_logic.dart';

// class SignUpView extends GetView<SignUpLogic> {
//   const SignUpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 40),
//               const Center(child: AuthLogoTitle()),

//               const SizedBox(height: 32),
//               Text(
//                 'Sign up',
//                 style: StyleRefer.robotoSemiBold.copyWith(
//                   fontSize: 22,
//                   color: AppColors.black,
//                 ),
//               ),

//               const SizedBox(height: 6),
//               Text(
//                 AppStrings.completeProfileTitle,
//                 style: StyleRefer.robotoRegular.copyWith(
//                   color: AppColors.grey,
//                 ),
//               ),

//               const SizedBox(height: 24),

//                  /// PROFILE IMAGE
//            Center(
//               child: Stack(
//              clipBehavior: Clip.none,
//              children: [
//            // Main profile avatar
//              GetBuilder<SignUpLogic>(
//             builder: (c) => CircleAvatar(
//             radius: 50, // slightly bigger than original
//             backgroundColor: Colors.white,
//             backgroundImage: c.profileImage != null ? FileImage(c.profileImage!) : null,
//             child: c.profileImage == null
//               ? ClipOval(
//                   child: Image.asset(
//                     'assets/images/person.png',
//                     width: 48.98,
//                     height: 48.98,
//                     fit: BoxFit.cover,
//                   ),
//                 )
//               : null,
//         ),
//       ),
//               // Edit button
//              Positioned(
//              bottom: -2, 
//              right: -2,
//              child: InkWell(
//              onTap: () {
//               Get.bottomSheet(
//               _imagePickerSheet(context),
//               backgroundColor: Colors.white,
//             );
//           },
//              child: CircleAvatar(
//               radius: 16.835, // half of 33.67px
//               backgroundColor: AppColors.whitegrey,
//               child: Image.asset(
//               'assets/images/edit.png',
//               width: 18, 
//               height: 18,
//               fit: BoxFit.contain,
//              ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),

//               const SizedBox(height: 32),

//               CustomTextField(
//                 controller: controller.firstNameController,
//                 prefix: const Icon(Icons.person),
//                 hintText: 'Enter First name', labelText: 'First name',
//               ),
//               const SizedBox(height: 16),

//               CustomTextField(
//                 controller: controller.lastNameController,
//                 prefix: const Icon(Icons.person),
//                 hintText: 'Enter Last name', labelText: 'Last name',
//               ),
//               const SizedBox(height: 16),

//               CustomTextField(
//                 controller: controller.emailController,
//                   prefix: const Icon(Icons.email_outlined),
//                 hintText: ' Enter Email',
//                 keyboardType: TextInputType.emailAddress, labelText:  'Email',
//               ),
//               const SizedBox(height: 16),

//               /// PHONE FIELD (same as Sign In)
//               GetBuilder<SignUpLogic>(
//                 builder: (_) => CustomTextField(
//                   controller: controller.phoneController,
//                   hintText: ' Enter Phone Number',
//                   keyboardType: TextInputType.phone,
//                   prefix: Padding(
//                     padding: const EdgeInsets.only(left: 12, right: 8),
//                     child: GestureDetector(
//                       onTap: () {
//                         showCountryPicker(
//                           context: context,
//                           showPhoneCode: false,
//                           onSelect: (country) {
//                             controller.setCountryFlag(country.flagEmoji);
//                           },
//                         );
//                       },
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(controller.selectedFlag ?? '🇺🇸',
//                               style: const TextStyle(fontSize: 20)),
//                           const Icon(Icons.arrow_drop_down,color: AppColors.black,),
//                           const SizedBox(width: 6),
//                           const Text('|',
//                               style: TextStyle(
//                                 color: Color(0xFFB6B6B6),
//                                 fontWeight: FontWeight.w600,
//                               )),
//                           const SizedBox(width: 6),
//                         ],
//                       ),
//                     ),
//                   ), labelText: 'phone number',
//                 ),
//               ),

//               const SizedBox(height: 32),

//               CustomButton(
//                 title: 'Sign up',
//                 onPressed: controller.goToVerification,
//               ),

//               const SizedBox(height: 16),
//               Center(
//                     child: AuthFooterText(
//                       fullText: AppStrings.alreadyHaveAccount,
//                       actionText: 'Sign In',
//                       onTap: () {
//                         Get.to(() => SignInView());
//                       },
//                     ),
//                   ),
//              const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _imagePickerSheet(BuildContext context) {
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

import 'package:community_shopping_app/src/modules/sign%20in/signin%20_view.dart';
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
 // final SignUpLogic controller = Get.put(SignUpLogic());

  
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
                  const SizedBox(height: 40),
                  const Center(child: AuthLogoTitle()),
          
                  const SizedBox(height: 32),
                  Text(
                    'Sign up',
                    style: StyleRefer.robotoSemiBold.copyWith(
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
          
                  const SizedBox(height: 6),
                  Text(
                    AppStrings.completeProfileTitle,
                    style: StyleRefer.robotoRegular.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
          
                  const SizedBox(height: 24),
          
                  /// PROFILE IMAGE (UNCHANGED)
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
                                :null,
                            child: c.profileImage == null
                                ? ClipOval(
                                    child: Image.asset(
                                      'assets/images/person.png',
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
                                'assets/images/edit.png',
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
          
                  const SizedBox(height: 32),
          
                  // ================= FORM START =================
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: 'First name',
                          hintText: 'Enter first name',
                             prefix: Image.asset(
                            'assets/images/personIcon.png',
                            width: 20,
                            height: 20,
                          color: controller.hasTypedFirstName ? Colors.black : Colors.grey,
                          ),
                          onChanged: controller.setFirstName,
                          validator: controller.nameValidator,
                        ),
          
                        const SizedBox(height: 16),
          
                        CustomTextField(
                          labelText: 'Last name',
                          hintText: 'Enter last name',
                          prefix: Image.asset(
                            'assets/images/personIcon.png',
                            width: 20,
                            height: 20,
                          color: controller.hasTypedLastName ? Colors.black : Colors.grey,
                          ),
                          onChanged: controller.setLastName,
                          validator: controller.nameValidator,
                        ),
          
                        const SizedBox(height: 16),
          
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          keyboardType: TextInputType.emailAddress,
                          prefix: Image.asset(
                            'assets/images/emailIcon.png',
                            width: 20,
                            height: 20,
                          color: controller.hasTypedEmail ? Colors.black : Colors.grey,
                          ),
                          onChanged: controller.setEmail,
                          validator: controller.emailValidator,
                        ),
          
                        const SizedBox(height: 16),
          
                        GetBuilder<SignUpLogic>(
                          builder: (_) {
                            return CustomTextField(
                              labelText: 'Phone number',
                              hintText: 'Enter phone number',
                              keyboardType: TextInputType.phone,
                              onChanged: controller.setPhone,
                              validator: controller.phoneValidator,
                              prefix: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 8),
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
                                        style:
                                            const TextStyle(fontSize: 20),
                                      ),
                                      const Icon(Icons.arrow_drop_down),
                                      const SizedBox(width: 6),
                                      const Text(
                                        '|',
                                        style: TextStyle(
                                          color: Color(0xFFB6B6B6),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
          
                        const SizedBox(height: 32),
          
                        CustomButton(
                          title: 'Sign up',
                          onPressed: controller.goToVerification,
                        ),
                      ],
                    ),
                  ),
                  // ================= FORM END =================
          
                  const SizedBox(height: 16),
          
                  Center(
                    child: AuthFooterText(
                      fullText: AppStrings.alreadyHaveAccount,
                      actionText: 'Sign In',
                      onTap: () {
                        Get.to(() => SignInView());
                      },
                    ),
                  ),
          
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }
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
