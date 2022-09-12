import 'package:flutter/material.dart';

mixin Categories {
  static final items = [
    Item(name: "Burger", image: Image.asset("images/Burger.png")),
    Item(name: "Donut", image: Image.asset("images/Donut.png")),
    Item(name: "Pizza", image: Image.asset("images/Pizza.png")),
    Item(name: "Mexican", image: Image.asset("images/Mexican.png")),
    Item(name: "Asian", image: Image.asset("images/Asian.png")),
  ];
}

class Item {
  final String name;

  final Image image;

  Item({required this.name, required this.image});
}
