import 'package:events_manager/widgets/map_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.isSelecting = false, this.onTap});
  final bool isSelecting;
  final void Function(TapPosition, LatLng)? onTap;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng _chosedLocation;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    Location location = new Location();

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
    _chosedLocation = LatLng(_locationData.latitude!, _locationData.longitude!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MapWidget(
            pickedLocation: _chosedLocation,
            isSelecting: true,
            onTap: _onMapTapped,
            onbackToCurrentLocationPressed: (newPoint) {
              _chosedLocation = newPoint;
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void onBackButtonPressed() {
    LatLng sendBackLocation = _chosedLocation;
    if (_chosedLocation != _chosedLocation) {
      sendBackLocation = _chosedLocation;
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Chose this location'),

            actions: [
              TextButton(
                child: const Text('Stay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Stick on original Location'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _onPickedLocation(_chosedLocation);
                },
              ),
              TextButton(
                child: Text(
                  'Yep!',
                  style: TextTheme.of(context).titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _onPickedLocation(sendBackLocation);
                },
              ),
            ],
          );
        },
      );
    } else {
      _onPickedLocation(sendBackLocation);
    }
  }

  void _onMapTapped(TapPosition tapPosition, LatLng point) async {
    _chosedLocation = point;
  }

  void _onPickedLocation(LatLng location) {
    if (mounted) Navigator.of(context).pop(location);
  }
}
