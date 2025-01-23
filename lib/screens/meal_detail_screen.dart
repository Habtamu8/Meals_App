import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourites_provider.dart';

import 'package:meals_app/models/meals.dart';

class MealDetailScreen extends ConsumerWidget {
 const MealDetailScreen ({
  super.key ,
  required this.meal,
 
  });

  final Meal meal;
  
    
  @override
  Widget build(BuildContext context , WidgetRef ref) {
   final favMeal = ref.watch(favouriteMealProvider);
    final mealChecked = favMeal.contains(meal);

    return  Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
          final wasAdded =ref.read(favouriteMealProvider.notifier).togglerMealFavoriesStatus(meal);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
          content: Text(wasAdded ? "Fav Meal Added": "Fav Meal Removed")));
          }, 
          icon:AnimatedSwitcher(
             duration:const Duration( milliseconds: 300) ,
             transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.8 , end: 0.1).animate(animation) ,
                   child: child,);
             },
             child: Icon(
              mealChecked ? Icons.star : Icons.star_border , key: ValueKey(favMeal),),)
          
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[ 
            Hero(
              tag: meal.id,
              child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
                        ),
            ),
           const SizedBox(height: 14,),
        
        Text('Ingridents'
         ,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary
        )),
        const SizedBox(height: 14,),
        for (final ingrdientss in meal.ingredients )
            Text(ingrdientss , 
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,)
         ),
         const SizedBox(height: 14,),
          Text('Steps',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary
        )),
        const SizedBox(height: 14,),
           for (final step in meal.steps )
            Padding(
                padding:const  EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8
              ),
              child: Text(step , 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,)
                     ),
            ),
          ] ),
      )
    );
  }
}