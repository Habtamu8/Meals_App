import 'package:flutter/material.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';


class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
 @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedpageindex = 0;

  void selectedpage(int index){
    setState(() {
      selectedpageindex = index;
    });
  }

  //...............Routing to Drawer Screen .........
  
 void selectedPageDrawer(String identifier)async{
  Navigator.of(context).pop();
  if(identifier == 'filters'){
 await  Navigator.of(context).push<Map<Filter,bool>>(
  MaterialPageRoute(builder:(ctx)=>const FiltersScreen()
  ));
  }}

 @override
  Widget build(BuildContext context) {
   final avaialabeMeals = ref.watch(filterMealProviders);

    Widget activePage =CatagoriesScreen(avaialabeMeal: avaialabeMeals); 
    String activepagetitle = 'Catagories';

    if(selectedpageindex ==1){
     
      final togglermealprovider = ref.watch(favouriteMealProvider);
        activePage =MealScreen(
                  meals:togglermealprovider);
       activepagetitle = 'Your Favories';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer:MainDrawer(onSelectDrawer:selectedPageDrawer),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar (
        onTap: selectedpage,
        currentIndex: selectedpageindex,
        items:const [
              BottomNavigationBarItem(icon: Icon(Icons.set_meal) , label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.star) , label: 'Favories')
              ]
      ) ,
    );
  }

}