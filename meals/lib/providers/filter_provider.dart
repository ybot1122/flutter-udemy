import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final filters = ref.watch(filtersProvider);
  final meals = ref.watch(mealsProvider);
  final availableMeals = meals.where((element) {
    if (filters[Filter.glutenFree]! && !element.isGlutenFree) {
      return false;
    }

    if (filters[Filter.lactoseFree]! && !element.isLactoseFree) {
      return false;
    }

    if (filters[Filter.vegan]! && !element.isVegan) {
      return false;
    }

    if (filters[Filter.vegetarian]! && !element.isVegetarian) {
      return false;
    }

    return true;
  }).toList();
  return availableMeals;
});
