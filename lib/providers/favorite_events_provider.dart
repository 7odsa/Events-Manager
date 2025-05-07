import 'package:events_manager/models/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteEventProvider =
    NotifierProvider<FavoriteEventNotifier, List<Event>>(
      () => FavoriteEventNotifier(),
    );

class FavoriteEventNotifier extends Notifier<List<Event>> {
  @override
  List<Event> build() {
    return [];
  }

  Future<void> addEvent(Event event) async {
    state = [event, ...state];
  }
}
