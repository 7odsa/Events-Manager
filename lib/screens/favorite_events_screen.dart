import 'package:events_manager/models/event.dart';
import 'package:events_manager/models/user_dm.dart';
import 'package:events_manager/services/firestore_helpers.dart';
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
  List<Event> allFavoriteEventList = [];
  List<Event> filteredFavEventList = [];

  final TextEditingController searchController = TextEditingController();

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
              onChanged: (text) => setState(() {}),
            ),
            Expanded(
              child: StreamBuilder(
                stream: getAllEvents(),

                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  allFavoriteEventList =
                      snapshot.data?.where((element) {
                        return element.favoritesUsersIds.contains(
                          UserDM.currentUser!.id,
                        );
                      }).toList() ??
                      [];

                  if (searchController.text.isEmpty) {
                    filteredFavEventList = List.from(allFavoriteEventList);
                  } else {
                    filteredFavEventList =
                        allFavoriteEventList
                            .where(
                              (e) => e.title.contains(searchController.text),
                            )
                            .toList();
                  }

                  return EventsListWidget(eventList: filteredFavEventList);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
