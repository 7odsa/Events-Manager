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

  Future<bool> addEvent(Event event) async {
    // TODO: add event to firebase

    state = [event, ...state];
    return true;
  }
}
