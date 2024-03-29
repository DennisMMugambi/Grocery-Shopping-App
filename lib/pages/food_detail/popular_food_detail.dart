import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/controllers/cart_controller.dart';
import 'package:grocery_shopping_app/controllers/popular_product_controller.dart';
import 'package:grocery_shopping_app/pages/Home/main_food_page.dart';
import 'package:grocery_shopping_app/pages/cart/cart_page.dart';
import 'package:grocery_shopping_app/widgets/app_icon.dart';

import '../../Utils/app_constants.dart';
import '../../Utils/colors.dart';
import '../../Utils/dimensions.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {

  int pageId;
  final String page;
  PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!
                    )
                  )
                ),
              )),
          //icon widgets
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("popular back btn tapped");
                        if(page == "cartPage"){
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                          Get.toNamed(RouteHelper.getCartPage());
                          },
                            child: AppIcon(icon: Icons.shopping_cart_outlined)),
                        Get.find<PopularProductController>().totalItems >= 1 ?
                        Positioned(
                          right:0, top:0,
                          child: GestureDetector(
                            onTap : () {
                              Get.toNamed(RouteHelper.getCartPage());
                              },
                            child: AppIcon(icon: Icons.circle, size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor),
                          ),
                        ) :
                        Container(),
                        Get.find<PopularProductController>().totalItems >= 1 ?
                        Positioned(
                          right:3, top:3,
                          child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                          size: 12, color: Colors.white,),
                        ) :
                        Container(),
                      ],
                    );
                  })
                ],
              )),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 30,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius30),
                      topLeft: Radius.circular(Dimensions.radius30)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(text : product.description!)),
                    )
                  ],
                )
              )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
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
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        size: Dimensions.iconSize24,
                        color: AppColors.signColor,),
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    BigText(text: popularProduct.inCartItems.toString(), size: Dimensions.font20,),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
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
              GestureDetector(
              onTap: () {
                popularProduct.addItem(product);
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
                      child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white, size: Dimensions.font20,)),
              ),
            ],
          ),
        );
      }),
    );
  }
}
