import 'package:deli_meal/screens/category_screen.dart';
import 'package:deli_meal/screens/favourite_screen.dart';
import 'package:deli_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Category',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favourite',
            ),
          ]),
        ),
        drawer: MainDrawer(),
        body:
            TabBarView(children: <Widget>[CategoryScreen(), FavouriteScreen()]),
      ),
    );
  }
}
