import 'package:events_manager/main.dart';
import 'package:events_manager/models/category.dart';
import 'package:events_manager/utils.dart';
import 'package:events_manager/widgets/category_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<CategoryDM> categoriesList;
  late CategoryDM selectedItem;
  @override
  void initState() {
    categoriesList = CategoryDM.allCategoriesList();
    selectedItem = categoriesList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            upperWidget(),
            // TODO: Here we should get the list of events based on the category
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Text("data"),
                itemCount: 50,
              ),
            ),
          ],
        ),
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
        padding: const EdgeInsets.all(16),
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
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 34,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => CategoryItem(
                      category: categoriesList[index],
                      ontap: () {
                        setState(() {
                          selectedItem = categoriesList[index];
                          print(selectedItem.categoryName);
                        });
                      },
                      isSelected: categoriesList[index] == selectedItem,
                    ),
                itemCount: categoriesList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
