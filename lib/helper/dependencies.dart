import 'package:get/get.dart';
import 'package:grocery_shopping_app/controllers/popular_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/popular_product_repo.dart';

Future<void> init() async{

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl : "https://www.dbstech.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
