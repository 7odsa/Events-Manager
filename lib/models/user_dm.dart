import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserDM {
  // ! Only For Now
  static UserDM? currentUser = UserDM(
    email: 'M@M',
    name: 'M',
    favoriteEvents: [],
  );
  UserDM({
    this.id,
    required this.email,
    required this.name,
    required this.favoriteEvents,
  });
  UserDM.fromJson({
    required String this.id,
    required Map<String, dynamic> data,
  }) {
    email = data["email"];
    name = data["name"];
    List<dynamic> ids = data["favoriteEvents"];
    favoriteEvents = ids.map((e) => e.toString()).toList();
  }

  late final String? id;
  late final String email;
  late final String name;
  late final List<String> favoriteEvents;
  LatLng? currentLocation;
  String? areaName;
  String? countryName;

  Map<String, dynamic> toJson() {
    return {"email": email, "name": name, "favoriteEvents": favoriteEvents};
  }
}
