 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
 
class FavouritesMealNotifier extends StateNotifier<List<Meal>>{
 FavouritesMealNotifier() : super([]);

bool togglerMealFavoriesStatus(Meal meal){
  final mealisFav = state.contains(meal);

  if(mealisFav) {
    state = state.where((m) => m.id != meal.id).toList();
    return false;
  }
  else {
    state = [...state,meal];
    return true;
  }
}}

final favouriteMealProvider= 
 StateNotifierProvider<FavouritesMealNotifier,List<Meal>>((ref){
  return FavouritesMealNotifier();

});

final filterMealProviders = Provider((ref) {

final meals =ref.watch(mealProvider);
final activeFilters =ref.watch(filtersProvider);


 return meals.where((meal){
   if(activeFilters[Filter.gluttenFree]! && !meal.isGlutenFree){
    return false;
   }

   if(activeFilters[Filter.lactoseFree]!&& !meal.isLactoseFree){
    return false;
   }

   if(activeFilters[Filter.vegan]!&& !meal.isVegan){
    return false;
   }

   if(activeFilters[Filter.vegetrian]!&& !meal.isVegetarian){
    return false;
   }
   return true;

    }).toList(); });