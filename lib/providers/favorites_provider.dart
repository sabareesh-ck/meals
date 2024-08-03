import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoratiesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoratiesMealsNotifier() : super([]);
  bool toggleMealFavoritesStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoratiesMeals =
    StateNotifierProvider<FavoratiesMealsNotifier, List<Meal>>(
        (ref) => FavoratiesMealsNotifier());
