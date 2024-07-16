import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriyi seçin'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (Category category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
