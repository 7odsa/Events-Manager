import 'package:events_manager/models/category.dart';

class Event {
  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.lat,
    required this.lng,
  });

  final String title;
  final String? description;
  final DateTime date;

  final CategoryDM category;
  final String lat;
  final String lng;
}
