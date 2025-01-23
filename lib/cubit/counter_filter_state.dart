
enum Filters{
  lactoseFree,
  gluttenFrees,
  vegan,
  vegetrian,

}

class CounterFilterState {
 CounterFilterState({ required this.filter });

final  Filters filter;
}
