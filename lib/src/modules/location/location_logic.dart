
// import 'package:community_shopping_app/src/widgets/location_permission.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationLogic extends GetxController {
//   final LocationPermissionService _locationService =
//       LocationPermissionService();

//   // ---------- STATE ----------
//   LatLng? selectedLocation;
//   double radius = 5; // KM
//   String locationText = '';
//   bool hasTypedLocation = false;

//   GoogleMapController? mapController;

//   // ---------- TEXT FIELD HANDLER ----------
//   void onLocationTyped(String value) {
//     locationText = value;
//     hasTypedLocation = value.isNotEmpty;
//     update();

//     // Supervisor requirement:
//     // when user interacts with location field → request permission
//     fetchCurrentLocation();
//   }

//   // ---------- REQUEST LOCATION ----------
//   Future<void> fetchCurrentLocation() async {
//     final hasPermission = await _locationService.requestPermission();
//     if (!hasPermission) return;

//     final locationData = await _locationService.getCurrentLocation();
//     if (locationData == null) return;

//     selectedLocation = LatLng(
//       locationData.latitude!,
//       locationData.longitude!,
//     );

//     locationText =
//         "${locationData.latitude!.toStringAsFixed(4)}, ${locationData.longitude!.toStringAsFixed(4)}";

//     mapController?.animateCamera(
//       CameraUpdate.newLatLngZoom(selectedLocation!, 14),
//     );

//     hasTypedLocation = true;
//     update();
//   }

//   // ---------- MAP ----------
//   void onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   // ---------- RADIUS ----------
//   void onRadiusChanged(double value) {
//     radius = value;
//     update();
//   }

//   // ---------- NEXT ----------
//   void goNext() {
//     if (selectedLocation == null) return;
//     // navigate to next screen when ready
//   }
// }
// import 'package:community_shopping_app/src/widgets/location_permission.dart';
// import 'package:flutter/material.dart'; // 🔹 for TextEditingController
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationLogic extends GetxController {
//   final LocationPermissionService _locationService =
//       LocationPermissionService();

//   // ---------- STATE ----------
//   LatLng? selectedLocation;
//   double radius = 5; // KM
//   String locationText = '';
//   bool hasTypedLocation = false;

//   GoogleMapController? mapController;

//   /// Add TextEditingController
//   TextEditingController locationController = TextEditingController();

//   // ---------- TEXT FIELD HANDLER ----------
//   void onLocationTyped(String value) {
//     locationText = value;
//     hasTypedLocation = value.isNotEmpty;
//     update();

//     // Supervisor requirement:
//     // when user interacts with location field → request permission
//     fetchCurrentLocation();
//   }

//   // ---------- REQUEST LOCATION ----------
//   Future<void> fetchCurrentLocation() async {
//     final hasPermission = await _locationService.requestPermission();
//     if (!hasPermission) return;

//     final locationData = await _locationService.getCurrentLocation();
//     if (locationData == null) return;

//     selectedLocation = LatLng(
//       locationData.latitude!,
//       locationData.longitude!,
//     );

//     locationText =
//         "${locationData.latitude!.toStringAsFixed(4)}, ${locationData.longitude!.toStringAsFixed(4)}";

//     /// Auto-fill text field
//     locationController.text = locationText;

//     mapController?.animateCamera(
//       CameraUpdate.newLatLngZoom(selectedLocation!, 14),
//     );

//     hasTypedLocation = true;
//     update();
//   }

//   // ---------- MAP ----------
//   void onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   // ---------- RADIUS ----------
//   void onRadiusChanged(double value) {
//     radius = value;
//     update();
//   }

//   // ---------- NEXT ----------
//   void goNext() {
//     if (selectedLocation == null) return;
//     // navigate to next screen when ready
//   }

//   /// Dispose controller to avoid memory leaks
//   @override
//   void onClose() {
//     locationController.dispose();
//     super.onClose();
//   }
// }
// import 'package:community_shopping_app/src/widgets/location_permission.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationLogic extends GetxController {
//   final LocationPermissionService _locationService = LocationPermissionService();

//   // ---------- STATE ----------
//   LatLng? selectedLocation;
//   double radius = 5; // KM
//   String locationText = ''; // text to show in text field
//   bool hasTypedLocation = false;

//   GoogleMapController? mapController;

//   // ---------- TEXT FIELD HANDLER ----------
//   void onLocationTyped(String value) {
//     locationText = value;
//     hasTypedLocation = value.isNotEmpty;
//     update();
//   }

//   // ---------- REQUEST LOCATION ----------
//   Future<void> fetchCurrentLocation() async {
//     final hasPermission = await _locationService.requestPermission();
//     if (!hasPermission) return;

//     final locationData = await _locationService.getCurrentLocation();
//     if (locationData == null) return;

//     selectedLocation = LatLng(
//       locationData.latitude!,
//       locationData.longitude!,
//     );

//     // Auto-fill text field
//     locationText =
//         "${locationData.latitude!.toStringAsFixed(4)}, ${locationData.longitude!.toStringAsFixed(4)}";
//     hasTypedLocation = true;

//     mapController?.animateCamera(
//       CameraUpdate.newLatLngZoom(selectedLocation!, 14),
//     );

//     update(); // triggers rebuild to update text field
//   }

//   // ---------- MAP ----------
//   void onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   // ---------- RADIUS ----------
//   void onRadiusChanged(double value) {
//     radius = value;
//     update();
//   }

//   // ---------- NEXT ----------
//   void goNext() {
//     if (selectedLocation == null) return;
//     // Navigate to next screen here
//   }
// }
import 'package:community_shopping_app/src/widgets/location_permission.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationLogic extends GetxController {
  final LocationPermissionService _locationService =
      LocationPermissionService();

  // ---------- STATE ----------
  LatLng? selectedLocation;
  double radius = 5; // KM default radius
  String locationText = '';
  bool hasTypedLocation = false;

  GoogleMapController? mapController;

  // ---------- TEXT FIELD HANDLER ----------
  void onLocationTyped(String value) {
    locationText = value;
    hasTypedLocation = value.isNotEmpty;
    update();
  }

  // ---------- REQUEST LOCATION ----------
  Future<void> fetchCurrentLocation() async {
    final hasPermission = await _locationService.requestPermission();
    if (!hasPermission) return;

    final locationData = await _locationService.getCurrentLocation();
    if (locationData == null) return;

    // Set selected location
    selectedLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    // Auto-fill text field with current location
    locationText =
        "${locationData.latitude!.toStringAsFixed(4)}, ${locationData.longitude!.toStringAsFixed(4)}";
    hasTypedLocation = true;

    // Move camera to current location
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(selectedLocation!, 14),
    );

    update();
  }

  // ---------- MAP ----------
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // ---------- RADIUS ----------
  void onRadiusChanged(double value) {
    radius = value;
    update();
  }

  // ---------- NEXT ----------
  void goNext() {
    if (selectedLocation == null) return;
    // navigate to next screen
  }
}
