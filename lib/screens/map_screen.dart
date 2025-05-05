import 'package:events_manager/models/user_dm.dart';
import 'package:events_manager/services/firestore_helpers.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getAllEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MapWidget(
            pickedLocation:
                UserDM.currentUser!.currentLocation ?? LatLng(50, 50),
            isSelecting: false,
            onTap: _onMapTapped,
            eventsLocation: snapshot.data!.map((e) => e.location).toList(),
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
