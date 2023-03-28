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
                    Get.to(() => MainFoodPage());
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
                  return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
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
                                                  // popularProduct.setQuantity(false);
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  size: Dimensions.iconSize24,
                                                  color: AppColors.signColor,),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10 / 2,
                                              ),
                                              BigText(text: "0", size: Dimensions.font20,),
                                              SizedBox(
                                                width: Dimensions.width10 / 2,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  //popularProduct.setQuantity(true);
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
                              ))
                            ],
                          ),
                        );
                      });
                })
              ),
          ))
        ],
      ),
    );
  }
}
