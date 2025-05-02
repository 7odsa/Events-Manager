import 'package:events_manager/main.dart';
import 'package:events_manager/models/category.dart';
import 'package:events_manager/providers/event_provider.dart';
import 'package:events_manager/utils.dart';
import 'package:events_manager/widgets/category_item.dart';
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
  late final List<CategoryDM> categoriesList;
  late CategoryDM selectedItem;

  void onCategoryTap({required CategoryDM category}) {
    // TODO: Here we should get the list of events based on the category
    setState(() {
      selectedItem = category;
      print(selectedItem.categoryName);
    });
    ref.watch(eventProvider);
  }

  @override
  void initState() {
    categoriesList = CategoryDM.allCategoriesList();
    selectedItem = categoriesList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          upperWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: ListView.builder(
                itemBuilder: (context, index) => Text("data"),
                itemCount: 50,
              ),
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
            SizedBox(
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
                    isSelected: categoriesList[index] == selectedItem,
                  );
                },
                itemCount: categoriesList.length,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
