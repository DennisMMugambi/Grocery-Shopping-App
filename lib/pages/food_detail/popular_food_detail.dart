import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/widgets/app_icon.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/food0.png"
                    )
                  )
                ),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
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
                    AppColumn(text: "Chinese side",),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce")
                  ],
                )
              )
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
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
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
