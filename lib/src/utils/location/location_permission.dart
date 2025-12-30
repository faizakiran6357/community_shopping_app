import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

enum PermissionResult {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
}

class LocationPermissionService {
  final Location _location = Location();

  Future<PermissionResult> requestPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check GPS service
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return PermissionResult.serviceDisabled;
      }
    }

    // Check permission
    permissionGranted = await _location.hasPermission();
    
    // If permission is denied or not granted, request it (this shows system dialog)
    if (permissionGranted == PermissionStatus.denied || 
        permissionGranted == PermissionStatus.deniedForever) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted == PermissionStatus.granted) {
        return PermissionResult.granted;
      } else if (permissionGranted == PermissionStatus.deniedForever) {
        return PermissionResult.deniedForever;
      } else {
        return PermissionResult.denied;
      }
    }
    
    // If already granted, return granted
    if (permissionGranted == PermissionStatus.granted) {
      return PermissionResult.granted;
    }

    // Default case
    return PermissionResult.granted;
  }

  Future<LocationData?> getCurrentLocation() async {
    return await _location.getLocation();
  }

  // ---------- OPEN APP SETTINGS ----------
  Future<void> openAppSettings() async {
    try {
      await ph.openAppSettings();
    } catch (e) {
      print('Error opening settings: $e');
    }
  }
}

