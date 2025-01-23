import 'package:bloc/bloc.dart';
// import 'package:meals_app/cubit/counter_filter_state.dart';
// import 'package:meta/meta.dart';

enum Filters{
  lactoseFree,
  gluttenFrees,
  vegan,
  vegetrian,

}




class CounterFilterCubit extends Cubit<Map<Filters , bool>> {
  CounterFilterCubit() : super({
    Filters.gluttenFrees : false,
    Filters.lactoseFree :false,
    Filters.vegetrian :false,
    Filters.vegan: false
  });

    void setFilter(Filters filter, bool isActive){
   emit({...state , filter : isActive}) ;
  }
}
