import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/widgets/big_text.dart';
import 'package:grocery_shopping_app/widgets/small_text.dart';

import '../../Utils/colors.dart';
import '../../Utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Showing the header
          Container(
              child : Container(
                  margin: EdgeInsets.only(top: Dimensions.height45, bottom: 0.0),
                  padding: EdgeInsets.only(left : Dimensions.width20, right: Dimensions.width20),
                  child : Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Kenya", color: AppColors.mainColor,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SmallText(text: "Nairobi", color: AppColors.mainBlackColor,),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Container (
                          width: 45,
                          height: 45,
                          child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(Dimensions.width15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child : FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
