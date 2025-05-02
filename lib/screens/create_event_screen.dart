import 'package:events_manager/main.dart';
import 'package:events_manager/models/category.dart';
import 'package:events_manager/utils.dart';
import 'package:events_manager/widgets/category_item.dart';
import 'package:events_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key, required this.categories});
  final List<CategoryDM> categories;

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  late CategoryDM selectedCategory;
  double screenWidth = 0;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event", style: blue20),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryImageLayer(),
              SizedBox(height: 16),
              categoriesListLayer(),
              SizedBox(height: 16),
              Text("Title", style: black20),
              SizedBox(height: 8),
              titleLayer(),
              SizedBox(height: 16),
              Text("Description", style: black20),
              SizedBox(height: 8),
              descriptionLayer(),
              SizedBox(height: 16),
              dateLayer(),
              SizedBox(height: 16),
              timeLayer(),
              SizedBox(height: 16),
              Text("Location", style: black20),
              SizedBox(height: 4),
              locationLayer(),
              SizedBox(height: 16),
              addNewButton(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox addNewButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // TODO
        },
        child: Text("Add Event", style: white20),
      ),
    );
  }

  SizedBox categoryImageLayer() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(selectedCategory.imagePath, fit: BoxFit.cover),
      ),
    );
  }

  InkWell locationLayer() {
    return InkWell(
      onTap: () {
        // TODO
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: seedColor, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: seedColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.location_searching_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
            SizedBox(width: 8),
            // TODO
            Text("data ,Test", style: blue20),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded, color: seedColor),
          ],
        ),
      ),
    );
  }

  Row dateLayer() {
    return Row(
      children: [
        Icon(Icons.calendar_month_outlined, size: 32),
        SizedBox(width: 8),
        Text("Event Date", style: black20),
        Spacer(),
        InkWell(
          onTap: () {
            // TODO
          },
          child: Text("Choose Date", style: blue20),
        ),
      ],
    );
  }

  Row timeLayer() {
    return Row(
      children: [
        Icon(Icons.timer_outlined, size: 32),
        SizedBox(width: 8),
        Text("Event Time", style: black20),
        Spacer(),
        InkWell(
          onTap: () {
            // TODO
          },
          child: Text("Choose Time", style: blue20),
        ),
      ],
    );
  }

  Widget categoriesListLayer() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            widget.categories
                .map(
                  (e) => Row(
                    children: [
                      CategoryItem(
                        category: e,
                        ontap: () {
                          setState(() {
                            selectedCategory = e;
                          });
                        },
                        isSelected: (selectedCategory == e),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget titleLayer() {
    return CustomTextField(
      controller: titleController,
      hintText: "We Are Going To Play Football",
      isPassword: false,
      prefixIcon: Icon(Icons.text_snippet_rounded),
    );
  }

  Widget descriptionLayer() {
    return CustomTextField(
      controller: descriptionController,
      hintText: "Event Description",
      isPassword: false,
      maxLines: 6,
    );
  }
}
