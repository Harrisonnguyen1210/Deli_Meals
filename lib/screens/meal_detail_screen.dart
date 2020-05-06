import 'package:deli_meal/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static final route = '/meal_detail';

  Widget _buildStep(BuildContext context, int stepOrder, String step) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(
              '# ${stepOrder + 1}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            radius: 20,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(child: Text(step)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(selectedMeal.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedMeal.ingredients
                      .map(
                        (ingredient) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(ingredient),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: selectedMeal.steps
                      .asMap()
                      .entries
                      .map((mapEntry) =>
                          _buildStep(context, mapEntry.key, mapEntry.value))
                      .toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
