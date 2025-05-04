import 'package:events_manager/models/category.dart';
import 'package:events_manager/models/event.dart';
import 'package:events_manager/providers/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = StateProvider<CategoryDM>(
  (_) => CategoryDM.all,
);

final filteredEventsProvider = Provider<List<Event>>((ref) {
  final all = ref.watch(eventProvider);
  final category = ref.watch(selectedCategoryProvider).state;
  if (category == CategoryDM.all) return all;
  return all.where((e) => e.category == category).toList();
});
