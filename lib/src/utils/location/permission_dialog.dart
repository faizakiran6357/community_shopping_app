import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'location_permission.dart';

class PermissionDialogService {
  static void show(PermissionResult result) {
    String message = '';

    if (result == PermissionResult.deniedForever) {
      message =
          'Location permission is permanently denied. Please enable it from app settings.';
    } else if (result == PermissionResult.serviceDisabled) {
      message =
          'Location services are disabled. Please enable GPS from settings.';
    } else {
      message =
          'Location permission is required to find nearby shops and deals.';
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
              LocationPermissionService().openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }
}
