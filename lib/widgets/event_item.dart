import 'package:events_manager/main.dart';
import 'package:events_manager/models/event.dart';
import 'package:events_manager/models/user_dm.dart';
import 'package:events_manager/services/firestore_helpers.dart';
import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event});
  final Event event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool isFavorite = false;
  @override
  void initState() {
    isFavorite = widget.event.favoritesUsersIds.contains(
      UserDM.currentUser!.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(widget.event.category.imagePath),
          ),
          Positioned(
            left: 8,
            top: 8,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.event.date.day.toString(), style: blue20),
                  Text(widget.event.date.month.toString(), style: blue20),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colorScheme.primaryContainer,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.event.title,
                      style: black20,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isFavorite
                          ? removeUserToEventFavorite(widget.event)
                          : addUserToEventFavorite(widget.event);
                      isFavorite = !isFavorite;
                    },
                    child: Icon(
                      (isFavorite)
                          ? Icons.favorite
                          : Icons.favorite_border_rounded,
                      color: seedColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
