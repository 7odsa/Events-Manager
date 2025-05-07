import 'dart:async';
import 'dart:math';

import 'package:events_manager/providers/location_provider.dart';
import 'package:events_manager/services/firestore_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends ConsumerStatefulWidget {
  const MapSample({this.location, super.key, this.onPop});
  final void Function(LatLng location)? onPop;
  final LatLng? location;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MapSampleState();
}

class MapSampleState extends ConsumerState<MapSample> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationProvider);
    if (location == null) ref.read(locationProvider.notifier).getLocaiton();

    return Scaffold(
      appBar:
          (widget.onPop != null)
              ? AppBar(title: Text("Pick a Location"), centerTitle: true)
              : null,
      body: StreamBuilder(
        stream: getAllEvents(),
        builder:
            (context, snapshot) =>
                (location != null && snapshot.data != null)
                    ? GoogleMap(
                      myLocationEnabled: true,
                      mapType: MapType.normal,

                      initialCameraPosition: CameraPosition(
                        zoom: 14,
                        target:
                            (widget.location != null)
                                ? widget.location!
                                : location,
                      ),

                      markers: {
                        if (widget.location != null)
                          Marker(
                            markerId: MarkerId("-1"),
                            position: widget.location!,
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              Random().nextDouble() % 360.00,
                            ),
                            onTap: () {
                              // ! TODO
                            },
                          ),
                        ...snapshot.data!.map((e) {
                          return Marker(
                            markerId: MarkerId(e.eventID!),
                            position: e.location!,
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              Random().nextDouble() % 360.00,
                            ),
                            onTap: () {
                              // ! TODO
                            },
                          );
                        }).toSet(),
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _mapController.complete(controller);
                      },
                      onTap: (argument) {
                        if (widget.onPop != null) {
                          widget.onPop!(argument);
                          Navigator.pop(context);
                        } else {
                          _goToTheLake(argument);
                        }
                      },
                    )
                    : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Future<void> _goToTheLake(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 13),
      ),
    );
  }
}
