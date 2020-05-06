import 'package:deli_meal/screens/meal_detail_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  MealItem(this.meal);

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.route, arguments: meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image(
                    image: NetworkImage(meal.imageUrl),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    child: Container(
                      width: 220,
                      padding: EdgeInsets.all(10),
                      color: Colors.black45,
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.timelapse,
                        size: 30,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.assessment,
                        size: 30,
                      ),
                      Text(describeEnum(meal.complexity)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        size: 30,
                      ),
                      Text(describeEnum(meal.affordability))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
