import 'package:events_manager/models/user_dm.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

Future<void> getCurrentLocation({
  required void Function()? onLocationRetrieved,
}) async {
  Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();

  List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
    _locationData.latitude!,
    _locationData.longitude!,
  );
  UserDM.currentUser!.currentLocation = LatLng(
    _locationData.latitude!,
    _locationData.longitude!,
  );

  UserDM.currentUser!.countryName = placemarks[0].country!;
  UserDM.currentUser!.areaName = placemarks[0].administrativeArea!;

  onLocationRetrieved?.call();
}
