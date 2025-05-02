import 'package:events_manager/models/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventProvider = NotifierProvider<EventNotifier, List<Event>>(
  () => EventNotifier(),
);

class EventNotifier extends Notifier<List<Event>> {
  @override
  List<Event> build() {
    return [];
  }
}
