import 'package:flutter/material.dart';
import 'package:pizza4u/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List productList = [
    ProductModel(
        name: "Sweet Pizza",
        price: "24",
        description: "description description description"),
    ProductModel(
        name: "Hot Pizza",
        price: "20",
        description: "description description description "),
    ProductModel(
        name: "Interesting Pizza",
        price: "43",
        description: "description description description")
  ];
  final List favouriteList = [];

  List get _productList => productList;

  bool isFavourite(String name) {
    if (favouriteList.contains(name)) {
      return true;
    } else {
      return false;
    }
  }

  void addProduct(String name, String price, String description) {
    productList
        .add(ProductModel(name: name, price: price, description: description));
    notifyListeners();
  }

  void addRemoveFav(String name) {
    if (isFavourite(name)) {
      favouriteList.remove(name);
    } else {
      favouriteList.add(name);
    }
    notifyListeners();
  }
}
