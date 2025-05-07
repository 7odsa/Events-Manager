import 'package:events_manager/main.dart';
import 'package:events_manager/models/category.dart';
import 'package:events_manager/models/event.dart';
import 'package:events_manager/models/user_dm.dart';
import 'package:events_manager/providers/location_provider.dart';
import 'package:events_manager/services/firestore_helpers.dart';
import 'package:events_manager/utils.dart';
import 'package:events_manager/widgets/category_item.dart';
import 'package:events_manager/widgets/events_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<CategoryDM> categoriesList = CategoryDM.allCategoriesList();
  CategoryDM selectedCategory = CategoryDM.allCategoriesList()[0];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ref.read(locationProvider) == null) {
      ref.read(locationProvider.notifier).getLocaiton();
    }
    final location = ref.watch(locationProvider);
    final areaName = UserDM.currentUser!.areaName;
    final country = UserDM.currentUser!.countryName;

    return Scaffold(
      body: Column(
        children: [
          upperWidget(),
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
                List<Event> events = snapshot.data ?? [];
                if (selectedCategory != CategoryDM.all) {
                  events =
                      events
                          .where(
                            (element) => element.category == selectedCategory,
                          )
                          .toList();
                }

                return EventsListWidget(eventList: events ?? []);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget upperWidget() {
    return Container(
      decoration: BoxDecoration(
        color: seedColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
          top: 32,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back", style: white20),
                    Text(UserDM.currentUser!.name, style: white20),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: colorScheme.primaryContainer,
                        ),
                        SizedBox(width: 4),
                        Text(
                          UserDM.currentUser!.areaName ?? "Loading",
                          style: white20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          " ,${UserDM.currentUser!.areaName ?? " ,Loading"}",
                          style: white20,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO
                      },
                      icon: Icon(
                        Icons.sunny,
                        color: colorScheme.primaryContainer,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "EN",
                          style: blue20.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        // TODO
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            categoryList(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  SizedBox categoryList() {
    return SizedBox(
      width: double.infinity,
      height: 34,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categoriesList[index],
            ontap: () {
              // TODO Maybe
              selectedCategory = categoriesList[index];
              setState(() {});
            },
            isSelected: categoriesList[index] == selectedCategory,
          );
        },
        itemCount: categoriesList.length,
      ),
    );
  }
}
