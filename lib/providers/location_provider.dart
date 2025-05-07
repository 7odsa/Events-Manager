import 'package:events_manager/functions/func.dart';
import 'package:events_manager/models/user_dm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final locationProvider = NotifierProvider<LocationNotifier, LatLng?>(
  LocationNotifier.new,
);

class LocationNotifier extends Notifier<LatLng?> {
  @override
  LatLng? build() {
    return UserDM.currentUser!.currentLocation;
  }

  Future<void> getLocaiton() async {
    await getCurrentLocation();
    state = UserDM.currentUser!.currentLocation;
  }
}
