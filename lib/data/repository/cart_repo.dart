import 'dart:convert';
import 'package:grocery_shopping_app/Utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList){
    cart = [];
    /*
      convert objects to string because shared prefence only accepts strings
     */
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });

    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CARTLIST, cart);
    print(sharedPreferences.getStringList(AppConstants.CARTLIST));
    getCartList();
  }
  
  List<CartModel> getCartList() {

    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.CARTLIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CARTLIST)!;
      print("inside getCartList" + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach((element) => cart.add(jsonDecode(element)));
    
    
    return cartList;
  }

}