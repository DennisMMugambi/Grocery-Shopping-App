import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping_app/Utils/colors.dart';
import 'package:grocery_shopping_app/controllers/cart_controller.dart';
import 'package:grocery_shopping_app/data/repository/popular_product_repo.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({ required this.popularProductRepo });

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cartController;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();

    if(response.statusCode == 200){
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("Status ${response.statusCode}");
    }
  }

  void setQuantity(bool isIncrement) {
    if(isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }

    update();
  }

  int checkQuantity(int quantity){
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't deduct any more items", backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if(_inCartItems >0) {
        _quantity =- _inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add any more items", backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cartController) {
    _quantity = 0;
    _inCartItems = 0;
    var exists = false;
    _cartController = cartController;
    exists = _cartController.existsInCart(product);
    //if exists
    // get from storage _inCartItems
    if(exists) {
      _inCartItems = _cartController.getQuantity(product);
    }
  }

  void addItem(ProductModel product){
      _cartController.addItem(product, quantity);
      _quantity = 0;
      _inCartItems = _cartController.getQuantity(product);
      _cartController.items.forEach((key, value) {
        print("The id is " +  value.id.toString() + " the quantity is " + value.quantity.toString());
      });
      update();
  }

  int get totalItems{
    return _cartController.totalItems;
  }
}