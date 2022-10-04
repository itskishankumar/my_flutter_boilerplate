import 'package:app_settings/app_settings.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> hasLocationPermission() async {
  return await Permission.locationWhenInUse.isGranted;
}

Future<void> requestLocationPermission() async {
  await Permission.locationWhenInUse.request();
}

Future<void> requestLocationService() async {
  Location location = Location();
  await location.requestService();
}

Future<void> openBluetoothSettings() async {
  await AppSettings.openBluetoothSettings();
}

Future<void> openLocationSettings() async {
  await AppSettings.openAppSettings();
}
