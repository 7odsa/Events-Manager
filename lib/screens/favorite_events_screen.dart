import 'package:events_manager/models/event.dart';
import 'package:events_manager/providers/favorite_events_provider.dart';
import 'package:events_manager/widgets/custom_text_field.dart';
import 'package:events_manager/widgets/events_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteEventsScreen extends ConsumerStatefulWidget {
  const FavoriteEventsScreen({super.key});

  @override
  ConsumerState<FavoriteEventsScreen> createState() =>
      _FavoriteEventsScreenState();
}

class _FavoriteEventsScreenState extends ConsumerState<FavoriteEventsScreen> {
  late final List<Event> allFavoriteEventList;
  late List<Event> filteredFavEventList;

  final TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    allFavoriteEventList = ref.watch(favoriteEventProvider);
    filteredFavEventList = allFavoriteEventList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 4, left: 16, right: 16, top: 48),
        child: Column(
          children: [
            CustomTextField(
              controller: searchController,
              hintText: "Search for Events",
              isPassword: false,
              onChanged: (text) {
                (text.isEmpty)
                    ? filteredFavEventList = allFavoriteEventList
                    : filteredFavEventList =
                        allFavoriteEventList
                            .where((e) => e.title.contains(text))
                            .toList();
                setState(() {});
              },
            ),
            Expanded(child: EventsListWidget(eventList: filteredFavEventList)),
          ],
        ),
      ),
    );
  }
}
