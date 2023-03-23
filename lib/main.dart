import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping_app/pages/Home/main_food_page.dart';
import 'package:grocery_shopping_app/pages/food_detail/popular_food_detail.dart';
import 'package:grocery_shopping_app/pages/food_detail/recommended_food_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
    );
  }
}