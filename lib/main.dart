import 'package:finalproject/classes/provider.dart';
import 'package:finalproject/screens/homescreen.dart';
import 'package:finalproject/screens/onboarding.dart';
import 'package:finalproject/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: addtocart()),
        ChangeNotifierProvider.value(value: CartList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const welcome_Screen(),
      ),
    );
  }
}
