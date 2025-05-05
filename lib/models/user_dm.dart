import 'package:latlong2/latlong.dart';

class UserDM {
  static UserDM? currentUser;
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
