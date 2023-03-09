import 'package:get/get.dart';

class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.1;
  static double pageViewTextContainer = screenHeight / 6.695;
  static double pageViewParentContainer = screenHeight / 2.14;

  //dynamic height padding and margin
  static double height10 = screenHeight / 68.34;
  static double height15 = screenHeight / 45.56;
  static double height20 = screenHeight / 34.17;
  static double height30 = screenWidth / 22.78;
  static double height45 = screenWidth / 15.18;

  //dynamic width padding and margin
  static double width10 = screenHeight / 68.34;
  static double width15 = screenHeight / 45.56;
  static double width20 = screenHeight / 34.17;
  static double width30 = screenHeight / 22.78;
  static double width45 = screenWidth / 15.18;

  //Optimizing font size
  static double font20 = screenHeight / 34.17;
  static double radius20 = screenHeight / 34.17;
  static double radius30 = screenHeight / 22.78;

}