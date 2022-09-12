import 'package:flutter/material.dart';

// class Restraunts {
//   static final items = [
//     Item(
//         name: "Mcdonalds",
//         image: Image.asset("images/mcdonalnds.png"),
//         subimage: Image.asset('images/mcdonaldsLogo.png'),
//         tags: [
//           'fastfood',
//           'burger',
//           'chicken'
//         ],
//         foodname: [
//           'BigMac',
//           'BigMac Chicken',
//           'BigTasty',
//           'BigTasty Chicken'
//         ],
//         foodImage: [
//           Image.asset("images/BigMacBeef.png"),
//           Image.asset("images/BigMacChicken.png"),
//           Image.asset("images/BigTastyBeef.png"),
//           Image.asset("images/BigTastyChicken.png")
//         ],
//         foodDiscription: [
//           'Beef,tomato,Big Mac Sauce',
//           'Chicken,tomato,Big Mac Sauce',
//           'Beef,tomato,Big Tasty Sauce',
//           'Chicken,tomato,Big Tasty Sauce',
//         ],
//         foodprice: [
//           60,
//           70,
//           90,
//           100
//         ]),
//     Item(
//         name: "Starbucks",
//         image: Image.asset("images/starbucks.png"),
//         subimage: Image.asset('images/mcdonaldsLogo.png'),
//         tags: ['drinks', 'coffe', 'bakery'],
//         foodname: ['sss ', 'BigMac ss'],
//         foodImage: [],
//         foodDiscription: [],
//         foodprice: []),
//   ];
// }

// class Item {
//   final String name;
//   final Image subimage;
//   final Image image;
//   final List<String> tags;
//   final List<String> foodname;
//   final List<Image> foodImage;
//   final List<String> foodDiscription;
//   final List<int> foodprice;
//   Item(
//       {required this.name,
//       required this.image,
//       required this.subimage,
//       required this.tags,
//       required this.foodname,
//       required this.foodImage,
//       required this.foodDiscription,
//       required this.foodprice});
// }

// class Tags extends Restraunts {
//   static final items = [
//     Items(tags: ['fastfood', 'burger', 'chicken']),
//     Items(tags: ['drinks', 'coffe', 'bakery']),
//   ];
// }

// class Items {
//   final List<String> tags;

//   Items({required this.tags});
// }

class MyRestraunts {
  static final List<Map<dynamic, dynamic>> allItems = [
    {
      'key': 1,
      'RestrauntName': 'Mcdonalds',
      'foodname': [
        'BigMac',
        'BigMac Chicken',
        'BigTasty',
        'BigTasty Chicken',
      ],
      'foodDiscription': [
        'Beef,tomato,Big Mac Sauce',
        'Chicken,tomato,Big Mac Sauce',
        'Beef,tomato,Big Tasty Sauce',
        'Chicken,tomato,Big Tasty Sauce',
      ],
      'foodprice': [60, 70, 90, 100],
      'foodImage': [
        Image.asset("images/BigMacBeef.png"),
        Image.asset("images/BigMacChicken.png"),
        Image.asset("images/BigTastyBeef.png"),
        Image.asset("images/BigTastyChicken.png")
      ],
      'Image': Image.asset("images/mcdonalnds.png"),
      'subLogo': Image.asset('images/mcdonaldsLogo.png'),
      'tags': ['fastfood', 'burger', 'chicken']
    },
    {
      'key': 2,
      'RestrauntName': 'Starbucks',
      'foodname': [
        'Vanilla Latte',
        'Iced White Chocolate Mocha',
        'Hot Chocolate',
        'Chai Latte',
      ],
      'foodDiscription': [
        'Vanilla Latte',
        'Iced White Chocolate Mocha',
        'Hot Chocolate',
        'Chai Latte',
      ],
      'foodprice': [60, 70, 90, 100],
      'foodImage': [
        Image.asset("images/VanillaLatte.png"),
        Image.asset("images/IcedWhiteChocolateMocha.png"),
        Image.asset("images/HotChocolate.png"),
        Image.asset("images/ChaiLatte.png")
      ],
      'Image': Image.asset("images/starbucks.png"),
      'subLogo': Image.asset('images/StarbucksLogo.png'),
      'tags': ['drinks', 'coffe', 'bakery']
    }
  ];
}
