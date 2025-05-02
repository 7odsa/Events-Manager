import 'package:flutter/material.dart';

class CategoryDM {
  CategoryDM({
    required this.categoryName,
    required this.imagePath,
    required this.icon,
  });

  final String imagePath;
  final String categoryName;
  final IconData icon;

  static CategoryDM all = CategoryDM(
    imagePath: "",
    categoryName: "All",
    icon: Icons.all_inbox,
  );
  static CategoryDM book = CategoryDM(
    imagePath: "images/categories_images/Book Club.png",
    categoryName: "Book",
    icon: Icons.menu_book_rounded,
  );
  static CategoryDM sport = CategoryDM(
    imagePath: "images/categories_images/Sport Club.png",
    categoryName: "Sport",
    icon: Icons.sports_gymnastics,
  );
  static CategoryDM birthday = CategoryDM(
    imagePath: "images/categories_images/Birthday Club.png",
    categoryName: 'Birthday',
    icon: Icons.cake_rounded,
  );
  static CategoryDM eating = CategoryDM(
    imagePath: "images/categories_images/Eating Club.png",
    categoryName: 'Eating',
    icon: Icons.food_bank_rounded,
  );
  static CategoryDM exhibition = CategoryDM(
    imagePath: "images/categories_images/Exhibition Club.png",
    categoryName: 'Exhibition',
    icon: Icons.airline_seat_recline_extra_rounded,
  );
  static CategoryDM gaming = CategoryDM(
    imagePath: "images/categories_images/Gaming Club.png",
    categoryName: 'Gaming',
    icon: Icons.gamepad,
  );
  static CategoryDM holiday = CategoryDM(
    imagePath: "images/categories_images/Holiday Club.png",
    categoryName: 'Holiday',
    icon: Icons.travel_explore_rounded,
  );
  static CategoryDM meeting = CategoryDM(
    imagePath: "images/categories_images/Meeting Club.png",
    categoryName: 'Meeting',
    icon: Icons.people,
  );
  static CategoryDM workshop = CategoryDM(
    imagePath: "images/categories_images/Workshop Club.png",
    categoryName: 'Workshop',
    icon: Icons.add_business,
  );

  static List<CategoryDM> allCategoriesList() {
    return [
      all,
      book,
      sport,
      birthday,
      eating,
      exhibition,
      gaming,
      holiday,
      meeting,
      workshop,
    ];
  }
}
