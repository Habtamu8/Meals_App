import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_gird_view.dart';


class CatagoriesScreen extends StatefulWidget {
  const CatagoriesScreen ({ super.key , required this.avaialabeMeal});

 final List<Meal> avaialabeMeal;

  @override
  State<CatagoriesScreen> createState() {
     return _CatagoriesScreenState();}
}

class _CatagoriesScreenState extends State<CatagoriesScreen> with SingleTickerProviderStateMixin{
 
 late AnimationController _animationController;

 @override
  void initState() {
  super.initState();
   _animationController = AnimationController(
    vsync: this,
    duration:const Duration(milliseconds: 300),
    lowerBound: 0,
    upperBound: 1
    );

    _animationController.forward();
  }
  

 @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
void _selectedcategory(BuildContext context , Category category ){

  final filterdMeals = 
  widget.avaialabeMeal.where((mealla) => mealla.categories.contains(category.id)).toList();

  Navigator.push(context,
   MaterialPageRoute(
    builder:(ctx)=> MealScreen(
        meals: filterdMeals, 
        title: category.title,
        )));
}

  @override
  Widget build(BuildContext context){
    return  AnimatedBuilder(
    
    animation:_animationController ,
      child: 
          GridView(
          padding:const EdgeInsets.all(24),
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2 ,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
          children:  [ 
            // availableCategories.map((cat) =>CategoryGridItem(category: cat)).toList();
            for(final cat in availableCategories)
            CategoryGridItem(
              category: cat ,
              onSelectedCategory: (){
               _selectedcategory(context , cat);
              })
          ]
          ),
          builder:(context , child)=> SlideTransition(
            position: Tween(
                begin: const Offset(0,0.3),
                end:  const Offset(0,0),
              ).animate(CurvedAnimation(
                parent: _animationController,
               curve: Curves.easeInCubic)),
               child: child,)
        
      );


   }
}