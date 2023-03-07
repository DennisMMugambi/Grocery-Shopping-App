import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/Home/food_page_body.dart';
import 'package:grocery_shopping_app/widgets/big_text.dart';
import 'package:grocery_shopping_app/widgets/small_text.dart';

import '../Utils/colors.dart';

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
          Container(
              child : Container(
                  margin: EdgeInsets.only(left: 0.0, top: 45.0, right: 0.0, bottom: 0.0),
                  padding: EdgeInsets.only(left : 20.0, right: 20.0),
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
                          child: Icon(Icons.search, color: Colors.white),
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
