import 'package:finalproject/classes/cart_list.dart';
import 'package:finalproject/classes/provider.dart';
import 'package:finalproject/component/component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodData extends StatefulWidget {
  final String foodname;
  final Image foodImage;
  final String foodDiscription;
  final int foodprice;
  const FoodData(
      {Key? key,
      required this.foodname,
      required this.foodImage,
      required this.foodDiscription,
      required this.foodprice})
      : super(key: key);

  @override
  State<FoodData> createState() => _FoodDataState();
}

void _incriment(context) {
  Provider.of<addtocart>(context, listen: false).minuscounter();
}

class _FoodDataState extends State<FoodData> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<addtocart>(context).getcounter;

    //  List cartt = Provider.of<CartList>(context).cart;
    //var cart = Provider.of<addtocart>(context).getcart;
    var multiply = widget.foodprice * counter;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 200,
                      width: double.infinity,
                      child:
                          FittedBox(child: widget.foodImage, fit: BoxFit.fill)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.foodname,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // multiply is defined up ^^ which is the food price * the counter
                        '\$${multiply}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          counter > 0
                              ? GestureDetector(
                                  onTap: () => _incriment(context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.orange)),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.orange,
                                    ),
                                  ))
                              : GestureDetector(
                                  onTap: () => null,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.grey)),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                    ),
                                  )),
                          SizedBox(
                            width: 10,
                          ),
                          Text('$counter'),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Provider.of<addtocart>(context, listen: false)
                                    .addcounter(),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.orange)),
                              child: Icon(
                                Icons.add,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(widget.foodDiscription),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: SizedBox(
                          height: 60,
                          width: 250,
                          child: counter > 0
                              ? TextButtonWidget(
                                  onPressed: () {
                                    Provider.of<CartList>(context,
                                            listen: false)
                                        .addtocart(ItemData(
                                            title: widget.foodname,
                                            price: multiply,
                                            howmanyitems: counter,
                                            image: widget.foodImage));
                                    Provider.of<addtocart>(context,
                                            listen: false)
                                        .addcarttotalprice(multiply);
                                  },
                                  texts: 'Add To Cart',
                                  colorme: Color.fromRGBO(254, 114, 76, 1))
                              : TextButtonWidgetGrey(
                                  onPressed: () {},
                                  texts: 'Add To Cart',
                                  colorme: Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
