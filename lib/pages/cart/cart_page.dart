import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping_app/Utils/app_constants.dart';
import 'package:grocery_shopping_app/controllers/cart_controller.dart';
import 'package:grocery_shopping_app/pages/Home/main_food_page.dart';
import 'package:grocery_shopping_app/widgets/app_icon.dart';
import 'package:grocery_shopping_app/widgets/big_text.dart';
import 'package:grocery_shopping_app/widgets/small_text.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 2,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap : () {

                      },
                  child: AppIcon(icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
          )),
          Positioned(
              top: Dimensions.height20 * 4,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].product!);
                            if(popularIndex >= 0){
                                Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartPage"));
                            } else {
                              var popularIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!);
                              Get.toNamed(RouteHelper.getRecommendedFood(popularIndex, "cartPage"));
                            }
                          },
                          child: Container(
                            height: Dimensions.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            AppConstants.BASE_URL + AppConstants.UPLOAD_URL + cartController.getItems[index].img!
                                          )
                                      ),
                                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width20,
                                ),
                                Expanded(child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].product!);
                                      if(popularIndex >= 0){
                                        Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartPage"));
                                      } else {
                                        var popularIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!);
                                        Get.toNamed(RouteHelper.getRecommendedFood(popularIndex, "cartPage"));
                                      }
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(text: cartController.getItems[index].name!, color: Colors.black54,),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(text: cartController.getItems[index].price.toString(), color: Colors.redAccent,),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10,
                                                  bottom: Dimensions.height10,
                                                  left: Dimensions.height10,
                                                  right: Dimensions.height10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                                                  color: Colors.white
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(_cartList[index].product!, -1);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: Dimensions.iconSize24,
                                                      color: AppColors.signColor,),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions.width10 / 2,
                                                  ),
                                                  BigText(text: _cartList[index].quantity.toString(), size: Dimensions.font20,),
                                                  SizedBox(
                                                    width: Dimensions.width10 / 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(_cartList[index].product!, 1);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      size: Dimensions.iconSize24,
                                                      color: AppColors.signColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        );
                      });
                })
              ),
          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimensions.bottomBarHeight,
          padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
          decoration: BoxDecoration(
              color : AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius30 * 2),
                  topLeft: Radius.circular(Dimensions.radius30 * 2)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.height10,
                    right: Dimensions.height10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    BigText(text: "KSHS ${cartController.totalAmount}", size: Dimensions.font20,),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                 // popularProduct.addItem(product);
                },
                child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        bottom: Dimensions.height10,
                        left: Dimensions.height10,
                        right: Dimensions.height10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(text: "Checkout", color: Colors.white, size: Dimensions.font20,)),
              ),
            ],
          ),
        );
      }),
    );
  }
}
