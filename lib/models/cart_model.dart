import 'package:flutter/material.dart';
import 'package:shopapp/models/mobile_model.dart';

class CartModel extends ChangeNotifier {
  //list of mobilemodel
  List<MobileModel> mobile = [
    MobileModel(
        name: 'Samsung Galaxy A50',
        price: 'Rs. 75,000',
        description: 'description',
        imagepath: 'lib/images/product-1.jpg'),
    MobileModel(
        name: 'Samsung Galaxy S24 Ultra',
        price: 'Rs. 175,000',
        description: 'description',
        imagepath: 'lib/images/product-2.jpg'),
    MobileModel(
        name: 'Iphone 15 Pro Max',
        price: 'Rs. 275,000',
        description: 'description',
        imagepath: 'lib/images/product-3.jpg'),
    MobileModel(
        name: 'Apple Watch Pro',
        price: 'Rs. 95,000',
        description: 'description',
        imagepath: 'lib/images/product-4.jpg'),
    MobileModel(
        name: 'Huawei Pura 70 Pro',
        price: 'Rs. 125,000',
        description: 'description',
        imagepath: 'lib/images/product-5.jpg'),
  ];

  //list of item in user cart
  List<MobileModel> userCart = [];

  //get list of mobile
  List<MobileModel> getMobileList() {
    return mobile;
  }

  //add item to user cart
  void addItemToCart(MobileModel mobile) {
    userCart.add(mobile);
    notifyListeners(); // Notify listeners that something changed
  }

  //remove from cart
  void removeItemFromCart(MobileModel mobile) {
    userCart.remove(mobile);
    notifyListeners(); // Notify listeners that something changed
  }
}
