import 'package:events_manager/main.dart';
import 'package:events_manager/models/category.dart';
import 'package:events_manager/models/event.dart';
import 'package:events_manager/providers/filteredEventsProvider.dart';
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

  @override
  void initState() {
    super.initState();
  }

  void onCategoryTap({required CategoryDM category}) {
    // TODO: Here we should get the list of events based on the category
    // *        Nearly Done

    ref.read(selectedCategoryProvider.notifier).state = category;
  }

  @override
  Widget build(BuildContext context) {
    final List<Event> eventList = ref.watch(filteredEventsProvider);

    return Scaffold(
      body: Column(
        children: [
          upperWidget(),
          Expanded(child: EventsListWidget(eventList: eventList)),
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
                    Text("John Safwat", style: white20),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: colorScheme.primaryContainer,
                        ),
                        SizedBox(width: 4),
                        Text("data", style: white20),
                        SizedBox(width: 4),
                        Text(",data", style: white20),
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
    final selectedCategory = ref.watch(selectedCategoryProvider);

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
              onCategoryTap(category: categoriesList[index]);
            },
            isSelected: categoriesList[index] == selectedCategory,
          );
        },
        itemCount: categoriesList.length,
      ),
    );
  }
}
