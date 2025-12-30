
import 'package:community_shopping_app/src/modules/bottom_nav/view.dart';
import 'package:community_shopping_app/src/utils/location/location_permission.dart';
import 'package:community_shopping_app/src/utils/location/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationLogic extends GetxController {
  final LocationPermissionService _locationService =
      LocationPermissionService();

  // ---------- STATE ----------
  LatLng? selectedLocation;
  double radius = 5; // KM
  String locationText = '';
  bool hasTypedLocation = false;

  GoogleMapController? mapController;

  // ---------- TEXT FIELD ----------
  void onLocationTyped(String value) {
    locationText = value;
    hasTypedLocation = value.isNotEmpty;
    update();
  }

  // ---------- GET ADDRESS ----------
  Future<String> _getPlaceNameFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        String address = '';

        if (place.street?.isNotEmpty == true) {
          address = place.street!;
        }
        if (place.locality?.isNotEmpty == true) {
          address += address.isNotEmpty
              ? ', ${place.locality}'
              : place.locality!;
        }
        if (place.country?.isNotEmpty == true) {
          address += address.isNotEmpty
              ? ', ${place.country}'
              : place.country!;
        }

        return address.isNotEmpty ? address : 'Unknown Location';
      }
    } catch (e) {
      debugPrint('Geocoding error: $e');
    }
    return 'Unknown Location';
  }

  // ---------- ZOOM ----------
  double _calculateZoomLevel(double radiusKm) {
    if (radiusKm <= 1) return 13.0;
    if (radiusKm <= 2) return 12.5;
    if (radiusKm <= 5) return 11.8;
    if (radiusKm <= 10) return 11.0;
    if (radiusKm <= 15) return 10.0;
    return 9.5;
  }

  // ---------- LOCATION ----------
  Future<void> fetchCurrentLocation() async {
    final permissionResult = await _locationService.requestPermission();

    if (permissionResult != PermissionResult.granted) {
      PermissionDialogService.show(permissionResult);
      return;
    }

    final locationData = await _locationService.getCurrentLocation();
    if (locationData == null) return;

    selectedLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    locationText = await _getPlaceNameFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    hasTypedLocation = true;

    final zoom = _calculateZoomLevel(radius);

    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(selectedLocation!, zoom),
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

    if (selectedLocation != null && mapController != null) {
      final zoom = _calculateZoomLevel(radius);
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(selectedLocation!, zoom),
      );
    }

    update();
  }

  // ---------- NEXT ----------
  void goToBottomNavigation() {
    Get.to(() => BottomNavigationScreen());
  }
}
