import 'package:events_manager/models/category.dart';

class Event {
  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
  });

  final String title;
  final String? description;
  final String date;
  final String time;
  final CategoryDM category;

  // TODO: location
  // final Latlng location
}
