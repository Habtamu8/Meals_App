
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter{
  lactoseFree,
  gluttenFree,
  vegan,
  vegetrian,

}

class FiltersNotifiers extends StateNotifier<Map<Filter ,bool>>{
  FiltersNotifiers() : super ({
    Filter.gluttenFree : false,
    Filter.lactoseFree :false,
    Filter.vegetrian :false,
    Filter.vegan: false

  });



  void setFilter(Filter filter, bool isActive){
    state = {...state , filter : isActive};
  }

}

final filtersProvider =
  StateNotifierProvider<FiltersNotifiers , Map<Filter , bool>>((ref){ 
  return FiltersNotifiers(); 
   });