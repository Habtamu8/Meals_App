
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meals_app/cubit/counter_filter_cubit.dart';
// import 'package:meals_app/cubit/counter_filter_state.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FiltersScreen extends ConsumerWidget {
 const FiltersScreen ({super.key });
     @override
  Widget build(BuildContext context , WidgetRef ref) {
  final activefilters = ref.watch(filtersProvider);
  print(activefilters);
   
   return Scaffold(
    appBar: AppBar(
      title:const Text("Your Filters"), ),

    body: Column(
        children: [
          SwitchListTile( 
            value: activefilters[Filter.gluttenFree]!, 
            onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filter.gluttenFree, isChecked);
           
            },
            title: Text("Glutten - Free Meals" , 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only include Glutten - Free Meal", 
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),
            ),  
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left:34 , right: 22),
            ),
          SwitchListTile( 
            value: activefilters[Filter.lactoseFree]!, 
            onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
           
            },
            title: Text("Lactose - Free Meals" , 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only include Lactose - Free Meal", 
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),
            ),  
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left:34 , right: 22),
            ),
      
             SwitchListTile( 
            value: activefilters[Filter.vegan]!, 
            onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
           
            },
            title: Text("Vegan Meals" , 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only Vegan Meal", 
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),
            ),  
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left:34 , right: 22),
            ),
            
           SwitchListTile( 
            value: activefilters[Filter.vegetrian]!, 
            onChanged: (isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetrian, isChecked);
           
            },
            title: Text("Vegetrian Meals" , 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),),
            subtitle: Text("Only vegetrian Meal", 
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),
            ),  
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left:34 , right: 22),
            ),
        
        ],
      ),
    ) ;
  }
}
 
