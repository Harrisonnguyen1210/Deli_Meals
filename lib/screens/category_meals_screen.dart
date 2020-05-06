import 'package:deli_meal/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:deli_meal/models/meal.dart';
import 'package:deli_meal/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final route = '/category_meals';
  final Map<String, Object> _filters;

  CategoryMealsScreen(this._filters);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'];
    final String categoryId = routeArgs['id'];
    final List<Meal> categoryMeals = DUMMY_MEALS.where((meal) {
      if (!meal.categories.contains(categoryId) ||
          (_filters['glutenFree'] && !meal.isGlutenFree) ||
          (_filters['lactoseFree'] && !meal.isLactoseFree) ||
          (_filters['vegan'] && !meal.isVegan) ||
          (_filters['vegetarian'] && !meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealItem(categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
