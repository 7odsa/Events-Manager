import 'package:events_manager/models/event.dart';
import 'package:flutter/material.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({super.key, required, required this.eventList});

  final List<Event> eventList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: ListView.builder(
        // TODO: Replace With Event Item from from eventList
        itemBuilder:
            (context, index) => Row(
              children: [
                Text(eventList[index].title),
                Spacer(),
                Text(eventList[index].category.categoryName),
              ],
            ),
        itemCount: eventList.length,
      ),
    );
  }
}
