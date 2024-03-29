import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/controllers/popular_product_controller.dart';
import 'package:grocery_shopping_app/pages/cart/cart_page.dart';
import 'package:grocery_shopping_app/routes/route_helper.dart';
import 'package:grocery_shopping_app/widgets/app_icon.dart';
import 'package:grocery_shopping_app/widgets/big_text.dart';
import 'package:grocery_shopping_app/widgets/expandable_text_widget.dart';

import '../../Utils/app_constants.dart';
import '../../Utils/colors.dart';
import '../../Utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {

  var recommendedId;
  String page;

  RecommendedFoodDetail({Key? key, required this.recommendedId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var product = Get.find<RecommendedProductController>().recommendedProductList[recommendedId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if(page == "cartPage"){
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                    child: AppIcon(icon: Icons.clear)),
               // AppIcon(icon: Icons.shopping_cart_outlined)
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getCartPage());
                        },
                          child: AppIcon(icon: Icons.shopping_cart_outlined)),
                      controller.totalItems >= 1 ?
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
                        child: BigText(text: controller.totalItems.toString(),
                          size: 12, color: Colors.white,),
                      ) :
                      Container(),
                    ],
                  );
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size : Dimensions.font26,text : product.name!)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: product.description!),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(Dimensions.width20 * 2.5,
                  Dimensions.height10, Dimensions.width20 * 2.5,
                  Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.remove),
                  ),
                  BigText(text: "\$${product.price}  X  ${controller.inCartItems} ", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                  GestureDetector(
                    onTap: () {
                        controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.add),
                  ),
                ],
              ),
            ),
            Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
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
                      child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white, size: Dimensions.font26,),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
