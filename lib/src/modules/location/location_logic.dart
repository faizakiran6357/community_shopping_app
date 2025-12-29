
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
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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

  // ---------- GET PLACE NAME FROM COORDINATES ----------
  Future<String> _getPlaceNameFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // Format: Street, City, Country
        String address = '';
        if (place.street != null && place.street!.isNotEmpty) {
          address = place.street!;
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          address += address.isNotEmpty ? ', ${place.locality}' : place.locality!;
        }
        if (place.country != null && place.country!.isNotEmpty) {
          address += address.isNotEmpty ? ', ${place.country}' : place.country!;
        }
        return address.isNotEmpty ? address : 'Unknown Location';
      }
    } catch (e) {
      print('Error getting place name: $e');
    }
    return 'Unknown Location';
  }

  // ---------- CALCULATE ZOOM LEVEL BASED ON RADIUS ----------
  double _calculateZoomLevel(double radiusKm) {
    // Formula to calculate zoom level based on radius
    // Larger radius = lower zoom level (zoom out) to show entire circle
    // Smaller radius = higher zoom level (zoom in) but not too much to keep circle visible
    // We want circle to always be visible but not fill entire map
    if (radiusKm <= 1) return 13.0;  // zoom out a bit so circle is visible
    if (radiusKm <= 2) return 12.5;
    if (radiusKm <= 5) return 12.0;
    if (radiusKm <= 10) return 11.0;
    if (radiusKm <= 15) return 10.0;
    return 9.5; // for 20km - zoom out more to see full circle
  }

  // ---------- REQUEST LOCATION ----------
  Future<void> fetchCurrentLocation() async {
    final permissionResult = await _locationService.requestPermission();
    
    if (permissionResult != PermissionResult.granted) {
      // Show dialog to open settings
      _showPermissionDialog(permissionResult);
      return;
    }

    final locationData = await _locationService.getCurrentLocation();
    if (locationData == null) return;

    // Set selected location
    selectedLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    // Get place name from coordinates
    locationText = await _getPlaceNameFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    hasTypedLocation = true;

    // Calculate zoom level based on current radius
    double zoomLevel = _calculateZoomLevel(radius);

    // Move camera to current location with appropriate zoom
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(selectedLocation!, zoomLevel),
    );

    update();
  }

  // ---------- SHOW PERMISSION DIALOG ----------
  void _showPermissionDialog(PermissionResult result) {
    String message = '';
    if (result == PermissionResult.deniedForever) {
      message =
          'Location permission is permanently denied. Please enable it from app settings.';
    } else if (result == PermissionResult.serviceDisabled) {
      message = 'Location services are disabled. Please enable GPS from settings.';
    } else {
      message = 'Location permission is required to find nearby shops and deals.';
    }

    Get.dialog(
      AlertDialog(
        title: const Text('Location Permission Required'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              _locationService.openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  // ---------- MAP ----------
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // ---------- RADIUS ----------
  void onRadiusChanged(double value) {
    radius = value;
    
    // Update camera zoom when radius changes
    if (selectedLocation != null && mapController != null) {
      double zoomLevel = _calculateZoomLevel(radius);
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(selectedLocation!, zoomLevel),
      );
    }
    
    update();
  }

  // ---------- NEXT ----------
  void goNext() {
    if (selectedLocation == null) return;
    // navigate to next screen
  }
}
