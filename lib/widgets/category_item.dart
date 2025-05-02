import 'package:events_manager/main.dart';
import 'package:events_manager/models/category.dart';
import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.ontap,
    required this.isSelected,
  });
  final CategoryDM category;
  final void Function() ontap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? seedColor : colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.primaryContainer),
        ),
        child: Row(
          children: [
            Icon(
              category.icon,
              color: isSelected ? colorScheme.primaryContainer : seedColor,
            ),
            SizedBox(width: 4),
            Text(category.categoryName, style: isSelected ? white20 : blue20),
          ],
        ),
      ),
    );
  }
}
