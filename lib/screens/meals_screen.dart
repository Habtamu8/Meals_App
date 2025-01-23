import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
const MealScreen({
   super.key ,
   this.title,
   required this.meals,
  

   });

final String?  title;
final List <Meal> meals;
 
 
void selectedMeal(BuildContext context , Meal meal){
 Navigator.push(context,
   MaterialPageRoute(
    builder:(ctx)=> MealDetailScreen(
      meal: meal, 
       )
        ));
}

@override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
                      itemCount: meals.length,
                      itemBuilder: (context , index){
                      return MealItem(
                      meal: meals[index] ,
                      onSelectedMeal:(meal){
                        selectedMeal(context , meal);
                      }
     );
    });

    if(meals.isEmpty){
      content = Center(
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children: [
           Text("Oh no....No data Available here !",
           style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground
           )),
           const  SizedBox(height: 16),
            Text('Try To Select Another Category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            )),
            
          ],),
      );

    }
    if(title==null) {
      return content;
    }
   return Scaffold(
    appBar: AppBar(
      title:Text(title!),
    ),
    body:content
   );
  }

}