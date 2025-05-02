class Category {
  Category({required this.imagePath, required this.categoryName});

  final String imagePath;
  final String categoryName;

  static List<Category> allCategoriesList() {
    return [
      Category(
        imagePath: "images/categories_images/Book Club.png",
        categoryName: "Book",
      ),
      Category(
        imagePath: "images/categories_images/Sport Club.png",
        categoryName: "Sport",
      ),
      Category(
        imagePath: "images/categories_images/Birthday Club.png",
        categoryName: 'Birthday',
      ),
      Category(
        imagePath: "images/categories_images/Eating Club.png",
        categoryName: 'Eating',
      ),
      Category(
        imagePath: "images/categories_images/Exhibition Club.png",
        categoryName: 'Exhibition',
      ),
      Category(
        imagePath: "images/categories_images/Gaming Club.png",
        categoryName: 'Gaming',
      ),
      Category(
        imagePath: "images/categories_images/Holiday Club.png",
        categoryName: 'Holiday',
      ),
      Category(
        imagePath: "images/categories_images/Meeting Club.png",
        categoryName: 'Meeting',
      ),
      Category(
        imagePath: "images/categories_images/Workshop Club.png",
        categoryName: 'Workshop',
      ),
    ];
  }
}
