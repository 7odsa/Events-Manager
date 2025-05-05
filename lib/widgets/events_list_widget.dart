import 'package:events_manager/models/event.dart';
import 'package:events_manager/widgets/event_item.dart';
import 'package:flutter/material.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({super.key, required, required this.eventList});

  final List<Event> eventList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) => EventItem(event: eventList[index]),
        itemCount: eventList.length,
      ),
    );
  }
}
