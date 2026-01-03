import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  final List<List<String>> _resturantinfo = [
    [
      "Joyfull",
      "Takoyaki",
      "300",
      "500",
      "Kyomachi, Beppu",
      "8PM to 12PM",
      "assets/images/joyfull.jpg",
      "assets/products/takoyaki.png",
    ],
    [
      "Korean BBQ",
      "Kimbap",
      "400",
      "700",
      "Kitahama, Beppu",
      "8PM to 12PM",
      "assets/images/koreanbbq.jpg",
      "assets/products/kimbap.png",
    ],
    [
      "Lawson",
      "Bento",
      "400",
      "700",
      "Kitahama, Beppu",
      "12PM to 2PM",
      "assets/images/lawson.jpg",
      "assets/products/bento.png",
    ],
    [
      "Beppu Menkan",
      "Gyoza",
      "250",
      "500",
      "Kitahama, Beppu",
      "6PM to 8PM",
      "assets/images/beppumenkan.jpg",
      "assets/products/gyoza.png",
    ],
  ];

  final List<List<String>> _cartItems = [];

  List<List<String>> get restaurantinfo => _resturantinfo;
  List<List<String>> get cartItems => _cartItems;

  // add
  void addItemtoCart(int index) {
    _cartItems.add(_resturantinfo[index]);
    notifyListeners();
  }

  // remove

  void removeItemsFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][2]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
