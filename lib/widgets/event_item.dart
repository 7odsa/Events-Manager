import 'package:events_manager/models/event.dart';
import 'package:flutter/material.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event});
  final Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [Image.asset(widget.event.category.imagePath)],
    );
  }
}
