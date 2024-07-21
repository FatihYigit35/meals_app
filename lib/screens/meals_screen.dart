import 'package:flutter/material.dart';

import 'meal_details_screen.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
    required this.onChangeFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onChangeFavorite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
          onChangeFavorite: onChangeFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (context, meal) => _selectMeal(context, meal),
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meal found!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    }
  }
}
