import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping_app/controllers/popular_product_controller.dart';
import 'package:grocery_shopping_app/pages/Home/food_page_body.dart';
import 'package:grocery_shopping_app/pages/Home/main_food_page.dart';
import 'package:grocery_shopping_app/pages/cart/cart_page.dart';
import 'package:grocery_shopping_app/pages/food_detail/popular_food_detail.dart';
import 'package:grocery_shopping_app/pages/food_detail/recommended_food_detail.dart';
import 'package:grocery_shopping_app/routes/route_helper.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}