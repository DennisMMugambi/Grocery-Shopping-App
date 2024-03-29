import 'package:get/get.dart';
import 'package:grocery_shopping_app/pages/food_detail/popular_food_detail.dart';
import 'package:grocery_shopping_app/pages/food_detail/recommended_food_detail.dart';
import 'package:grocery_shopping_app/pages/splash/splash_page.dart';

import '../pages/Home/home_page.dart';
import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int recommendedId, String page) => '$recommendedFood?recommendedId=$recommendedId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [

    GetPage(name: splashPage, page: () => SplashScreen()),

    GetPage(name: initial, page: () => HomePage()),

    GetPage(name: popularFood, page: () {

      var page = Get.parameters["page"];
      var pageId = Get.parameters['pageId'];

      return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
    },
      transition: Transition.rightToLeftWithFade
    ),

    GetPage(name: recommendedFood, page: () {

      var page = Get.parameters['page'];
      var recommendedId = Get.parameters['recommendedId'];

      return RecommendedFoodDetail(recommendedId: int.parse(recommendedId!), page:page!);
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