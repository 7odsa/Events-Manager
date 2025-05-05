import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_manager/models/category.dart';
import 'package:events_manager/models/user_dm.dart';
import 'package:latlong2/latlong.dart';

class Event {
  Event({
    this.eventID,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.location,
    this.favoritesUsersIds = const [],
    required this.createdBy,
  });
  late final String? eventID;
  late final String title;
  late final String? description;
  late final DateTime date;
  late final LatLng? location;
  late final CategoryDM category;
  late final List<String> favoritesUsersIds;
  late final String createdBy;

  Event.fromJson(String id, Map<String, dynamic> json) {
    eventID = id;
    title = json["title"];
    description = json["description"];

    final Timestamp timestamp = json["date"];
    date = timestamp.toDate();

    final double lat = json["lat"];
    final double lng = json["lng"];
    location = LatLng(lat, lng);

    final CategoryDM categoryList = CategoryDM.allCategoriesList().firstWhere(
      (category) => category.categoryName == json["category"],
    );
    category = categoryList;

    final List<dynamic> ids = json["favoritesUsersIds"];
    favoritesUsersIds = ids.map((e) => e.toString()).toList();
    createdBy = json["createdBy"];
  }

  Map<String, dynamic> toJson() {
    Timestamp timestamp = Timestamp.fromDate(date);
    return {
      "title": title,
      "description": description,
      "date": timestamp,
      "lat": location?.latitude ?? 1.0,
      "lng": location?.longitude ?? 1.0,
      "category": category.categoryName,
      "favoritesUsersIds": favoritesUsersIds,
      "createdBy": createdBy,
    };
  }
}
