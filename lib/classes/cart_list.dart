import 'package:flutter/material.dart';

class ItemData {
  final String title;
  final int price;
  final int howmanyitems;
  final Image image;

  ItemData(
      {required this.title,
      required this.price,
      required this.howmanyitems,
      required this.image});
}
