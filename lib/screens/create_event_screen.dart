import 'package:events_manager/models/category.dart';
import 'package:events_manager/models/event.dart';
import 'package:events_manager/models/user_dm.dart';
import 'package:events_manager/providers/event_provider.dart';
import 'package:events_manager/services/firestore_helpers.dart';
import 'package:events_manager/utils.dart';
import 'package:events_manager/widgets/category_item.dart';
import 'package:events_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class CreateEventScreen extends ConsumerStatefulWidget {
  const CreateEventScreen({super.key, required this.categories});
  final List<CategoryDM> categories;

  @override
  ConsumerState<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends ConsumerState<CreateEventScreen> {
  late CategoryDM selectedCategory;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TimeOfDay? time;
  DateTime? date;
  LatLng? location;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
        onPressed: () async {
          if (titleController.text.isEmpty ||
              descriptionController.text.isEmpty ||
              date == null ||
              time == null
          // TODO: When the logic is done
          //  || location == null
          ) {
            return;
          }
          date = date!.copyWith(hour: time!.hour, minute: time!.minute);
          await addNewEvent(
            Event(
              title: titleController.text,
              description: descriptionController.text,
              date: date!,
              category: selectedCategory,
              location: location,
              createdBy: UserDM.currentUser!.id!,
            ),
          );

          if (mounted) Navigator.pop(context);
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
      onTap: () async {
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
          onTap: () async {
            date =
                await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                ) ??
                date;
            setState(() {});
          },
          child: Text(
            (date != null)
                ? "${date!.year}:${date!.month < 10 ? "0${date!.month}" : date!.month}:${date!.day}"
                : "Choose Date",
            style: blue20,
          ),
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
          onTap: () async {
            time =
                await showTimePicker(
                  context: context,
                  initialTime: time ?? TimeOfDay.now(),
                ) ??
                time;
            setState(() {});
          },
          child: Text(
            time != null ? time!.format(context) : "Choose Time",
            style: blue20,
          ),
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
