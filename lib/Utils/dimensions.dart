import 'package:get/get.dart';

class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.1;
  static double pageViewTextContainer = screenHeight / 6.695;
  static double pageViewParentContainer = screenHeight / 2.38;

  //dynamic height padding and margin
  static double height10 = screenHeight / 68.34;
  static double height15 = screenHeight / 45.56;
  static double height20 = screenHeight / 34.17;
  static double height30 = screenHeight / 22.78;
  static double height45 = screenHeight / 15.18;

  //dynamic width padding and margin
  static double width10 = screenWidth/ 68.34;
  static double width15 = screenWidth / 45.56;
  static double width20 = screenWidth / 34.17;
  static double width30 = screenWidth / 22.78;
  static double width45 = screenWidth / 15.18;

  //Optimizing font size
  static double font20 = screenHeight / 34.17;
  static double font12 = screenHeight / 56.95;
  static double radius20 = screenWidth / 34.17;
  static double radius30 = screenWidth / 22.78;

  //icon size
  static double iconSize24 = screenHeight / 28.47;

  //list view dimension constants
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContainerSize = screenWidth / 3.9;

  //popular_food
  static double popularFoodImgSize = screenHeight / 2.41;

}