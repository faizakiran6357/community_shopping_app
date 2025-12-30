
// // import 'package:community_shopping_app/src/utils/app_images.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import '../../utils/app_colors.dart';
// // import '../../utils/app_fonts.dart';
// // import '../../utils/app_strings.dart';
// // import '../../widgets/auth_logo_title.dart';
// // import '../../widgets/custom_button.dart';
// // import '../../widgets/custom_text_field.dart';
// // import 'location_logic.dart';

// // class LocationView extends StatelessWidget {
// //   const LocationView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GetBuilder<LocationLogic>(
// //       init: LocationLogic(),
// //       builder: (controller) {
// //         return Scaffold(
// //           backgroundColor: AppColors.white,
// //           body: SafeArea(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.only(bottom: 20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const SizedBox(height: 12),

// //                   /// LOGO
// //                   const Center(child: AuthLogoTitle()),

// //                   const SizedBox(height: 20),

// //                   /// TITLE
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: Text(
// //                       'Location',
// //                       style: StyleRefer.robotoSemiBold.copyWith(
// //                         fontSize: 22,
// //                         color: AppColors.black,
// //                       ),
// //                     ),
// //                   ),

// //                   const SizedBox(height: 6),

// //                   /// SUB TITLE
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: Text(
// //                       AppStrings.locationPermissionText,
// //                       style: StyleRefer.robotoRegular.copyWith(
// //                         color: AppColors.grey,
// //                       ),
// //                     ),
// //                   ),

// //                   const SizedBox(height: 16),

// //                   /// LOCATION FIELD (PROFILE STYLE)
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: CustomTextField(
// //                      // key: ValueKey(controller.locationText), // auto rebuild
// //                       labelText: 'Location',
// //                       hintText: 'Location',
// //                       initialValue: controller.locationText,
// //                       prefix: Image.asset(
// //                      locationIcon,
// //                         width: 20,
// //                         height: 20,
// //                         color: controller.hasTypedLocation
// //                             ? Colors.black
// //                             : Colors.grey,
// //                       ),
// //                       onChanged: controller.onLocationTyped,
// //                     ),
// //                   ),

// //                   const SizedBox(height: 16),

// //                   /// -------- ADJUST RADIUS TEXT ABOVE MAP --------
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: Text(
// //                       AppStrings.adjustradius,
// //                       style: StyleRefer.interSemiBold.copyWith(
// //                         fontSize: 16,
// //                         color: AppColors.black,
// //                       ),
// //                     ),
// //                   ),

// //                   const SizedBox(height: 10),

// //                   /// ================= MAP =================
// //                   SizedBox(
// //                     width: MediaQuery.of(context).size.width,
// //                     height: 325,
// //                     child: Stack(
// //                       children: [
// //                         GoogleMap(
// //                           initialCameraPosition: const CameraPosition(
// //                             target: LatLng(33.6844, 73.0479),
// //                             zoom: 12,
// //                           ),
// //                           myLocationEnabled: true,
// //                           myLocationButtonEnabled: false,
// //                           zoomControlsEnabled: false,
// //                           mapToolbarEnabled: false,
// //                           onMapCreated: controller.onMapCreated,
// //                           markers: controller.selectedLocation == null
// //                               ? {}
// //                               : {
// //                                   Marker(
// //                                     markerId: const MarkerId('currentLocation'),
// //                                     position: controller.selectedLocation!,
// //                                   ),
// //                                 },
// //                           circles: controller.selectedLocation == null
// //                               ? {}
// //                               : {
// //                                   Circle(
// //                                     circleId: const CircleId('radius'),
// //                                     center: controller.selectedLocation!,
// //                                     radius: controller.radius * 1000,
// //                                     fillColor:
// //                                          AppColors.blueshade.withOpacity(0.18),
// //                                     strokeColor:  AppColors.blueshade,
// //                                     strokeWidth: 2,
// //                                   ),
// //                                 },
// //                         ),

// //                         /// SLIDER ON MAP
// //                         Positioned(
// //                           top: 12,
// //                           left: 20,
// //                           right: 20,
// //                           child: SliderTheme(
// //                             data: SliderThemeData(
// //                               activeTrackColor: AppColors.blueshade,
// //                               inactiveTrackColor: AppColors.greyshade,
// //                               thumbColor: AppColors.blueshade,
// //                               valueIndicatorColor:AppColors.blueshade,
// //                             ),
// //                             child: Slider(
// //                               min: 1,
// //                               max: 20,
// //                               divisions: 19,
// //                               value: controller.radius,
// //                               label: '${controller.radius.toInt()} km',
// //                               onChanged: controller.onRadiusChanged,
// //                             ),
// //                           ),
// //                         ),

// //                         /// CURRENT LOCATION BUTTON (BOTTOM LEFT) with arrow asset
// //                         Positioned(
// //                           bottom: 12,
// //                           left: 20,
// //                           child: GestureDetector(
// //                             onTap: controller.fetchCurrentLocation,
// //                             child: Container(
// //                               width: 50,
// //                               height: 50,
// //                               decoration: BoxDecoration(
// //                                 color:AppColors.lightred,
// //                                 shape: BoxShape.circle,
// //                               ),
// //                               child: Center(
// //                                 child: Image.asset(
// //                                  arrowshape,
// //                                   width: 24,
// //                                   height: 24,
// //                                   fit: BoxFit.contain,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),

// //                   const SizedBox(height: 20),

// //                   /// NEXT BUTTON
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: CustomButton(
// //                       title: 'Next',
// //                       onPressed: controller.goToBottomNavigation,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }


import 'package:community_shopping_app/src/utils/app_images.dart';
import 'package:community_shopping_app/src/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';
import '../../widgets/auth_logo_title.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'location_logic.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationLogic>(
      init: LocationLogic(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,

          /// NEXT BUTTON FIXED
          bottomNavigationBar: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 2.h),
            child: CustomButton(
              title: 'Next',
              onPressed: controller.goToBottomNavigation,
            ),
          ),

          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                1.5.h.height,

                /// LOGO
                const Center(child: AuthLogoTitle()),

                3.h.height,

                /// PADDED TOP CONTENT
                Padding(
                  padding: horizontalPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      Text(
                        'Location',
                        style: StyleRefer.robotoSemiBold.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      0.5.h.height,

                      /// SUB TITLE
                      Text(
                        AppStrings.locationPermissionText,
                        style: StyleRefer.robotoRegular.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      2.h.height,

                      /// LOCATION FIELD
                      CustomTextField(
                        key: ValueKey(controller.locationText),
                        labelText: 'Location',
                        hintText: 'Location',
                        initialValue: controller.locationText,
                        prefix: Image.asset(
                          locationIcon,
                          width: 20,
                          height: 20,
                          color: controller.hasTypedLocation
                              ? Colors.black
                              : Colors.grey,
                        ),
                        onChanged: controller.onLocationTyped,
                      ),
                      2.h.height,

                      /// ADJUST RADIUS
                      Text(
                        AppStrings.adjustradius,
                        style: StyleRefer.interSemiBold.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black,
                        ),
                      ),
                      1.h.height,
                    ],
                  ),
                ),

                /// MAP
                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(33.6844, 73.0479),
                          zoom: 12,
                        ),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        onMapCreated: controller.onMapCreated,
                        markers: controller.selectedLocation == null
                            ? {}
                            : {
                                Marker(
                                  markerId: const MarkerId('currentLocation'),
                                  position: controller.selectedLocation!,
                                ),
                              },
                        circles: controller.selectedLocation == null
                            ? {}
                            : {
                                Circle(
                                  circleId: const CircleId('radius'),
                                  center: controller.selectedLocation!,
                                  radius: controller.radius * 1000,
                                  fillColor: AppColors.blueshade
                                      .withOpacity(0.18),
                                  strokeColor: AppColors.blueshade,
                                  strokeWidth: 2,
                                ),
                              },
                      ),

                      /// SLIDER
                      Positioned(
                        top: 12,
                        left: 20,
                        right: 20,
                        child: SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: AppColors.blueshade,
                            inactiveTrackColor: AppColors.greyshade,
                            thumbColor: AppColors.blueshade,
                            valueIndicatorColor: AppColors.blueshade,
                          ),
                          child: Slider(
                            min: 1,
                            max: 20,
                            divisions: 19,
                            value: controller.radius,
                            label: '${controller.radius.toInt()} km',
                            onChanged: controller.onRadiusChanged,
                          ),
                        ),
                      ),

                      /// CURRENT LOCATION BUTTON
                      Positioned(
                        bottom: 12,
                        left: 20,
                        child: GestureDetector(
                          onTap: controller.fetchCurrentLocation,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.lightred,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                arrowshape,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
