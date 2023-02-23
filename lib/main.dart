import 'package:flutter/material.dart';
import 'pages/favorite_shops_page.dart';

void main() => runApp(FoodmarkApp());

class FoodmarkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodmark',
      theme: ThemeData(primarySwatch: Colors.red),
      home: FavoriteShopsPage(),
    );
  }
}
