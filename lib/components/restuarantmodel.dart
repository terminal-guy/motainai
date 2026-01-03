import 'package:flutter/material.dart';

class Restuarantmodel extends ChangeNotifier {
  final List<List<String>> _resturantinfo = [
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
  List<List<String>> get restaurantinfo => _resturantinfo;
}
