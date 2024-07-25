import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool changeMealFavoriteStatus(Meal meal) {
    final isFavorite = state.contains(meal);
    final newList = state.toList();

    if (isFavorite) {
      //state = state.where((m) => m.id != meal.id).toList();
      newList.remove(meal);
      state = newList;
      return false;
    } else {
      //state = [...state, meal];
      newList.add(meal);
      state = newList;
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
