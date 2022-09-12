import 'package:finalproject/classes/cart_list.dart';
import 'package:finalproject/classes/food_categories.dart';
import 'package:flutter/material.dart';

class addtocart extends ChangeNotifier {
  var cart = 0;
  int get getcart {
    return cart;
  }

  void add() {
    cart += 1;
    notifyListeners();
  }

  // counter
  var counter = 1;
  int get getcounter {
    return counter;
  }

  void resetcounter() {
    counter = 1;
    notifyListeners();
  }

  void addcounter() {
    counter += 1;
    notifyListeners();
  }

  void minuscounter() {
    counter -= 1;
    notifyListeners();
  }

  // cart counter
  var carttotalprice = 0;
  int get getcarttotalprice {
    return carttotalprice;
  }

  void addcarttotalprice(int multiply) {
    carttotalprice += multiply;
    notifyListeners();
  }

  // this is for when the user deletes an item from cart , so it will affect the total price
  void removepricefromcanceled(int num) {
    //carttotalprice += multiply;
    carttotalprice -= num;
    notifyListeners();
  }

  void minuscartcounter() {
    carttotalprice -= 1;
    notifyListeners();
  }
}

class CartList extends ChangeNotifier {
  List<ItemData> cartitems = [];

  List<ItemData> get getcart {
    return cartitems;
  }

  void addtocart(ItemData name) {
    cartitems.add(name);
    notifyListeners();
  }

  void removefromcart(index) {
    cartitems.removeAt(index);
    notifyListeners();
  }
}
