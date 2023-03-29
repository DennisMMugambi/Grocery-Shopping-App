import 'package:get/get.dart';
import 'package:grocery_shopping_app/pages/food_detail/popular_food_detail.dart';
import 'package:grocery_shopping_app/pages/food_detail/recommended_food_detail.dart';

import '../pages/Home/main_food_page.dart';
import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int recommendedId) => '$recommendedFood?recommendedId=$recommendedId';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),

    GetPage(name: popularFood, page: () {

      var pageId = Get.parameters['pageId'];

      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.rightToLeftWithFade
    ),

    GetPage(name: recommendedFood, page: () {

      var recommendedId = Get.parameters['recommendedId'];

      return RecommendedFoodDetail(recommendedId: int.parse(recommendedId!));
    },
        transition: Transition.rightToLeftWithFade
    ),

    GetPage(name: cartPage, page: (){
      return CartPage();
    },
        transition: Transition.rightToLeftWithFade
    )
  ];
}