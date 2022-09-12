import 'package:finalproject/classes/provider.dart';
import 'package:finalproject/component/component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

void _incriment(context) {
  Provider.of<addtocart>(context, listen: false).minuscounter();
}

void _remove(context, index) {
  Provider.of<CartList>(context, listen: false).removefromcart(index);
}

void _removefromprice(context, price) {
  Provider.of<addtocart>(context, listen: false).removepricefromcanceled(price);
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<addtocart>(context).getcounter;
    var subtotal = Provider.of<addtocart>(context).getcarttotalprice;

    var fees = subtotal * 0.12;
    fees = fees.roundToDouble();
    var feesme = subtotal * 1.12;
    var delivery = 20.0;
    var total = feesme + delivery;

    List cartt = Provider.of<CartList>(context).getcart;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios_new),
                      const Center(
                        child: Text(
                          'Cart',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          //color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 40,
                          width: 40,
                          child: Stack(children: [
                            Align(
                              alignment: FractionalOffset.topRight,
                              // child: Text(
                              //   '$counter',
                              //   style: TextStyle(color: Colors.orange),
                              // ),
                            ),
                            const Center(
                                child: Icon(
                              Icons.shopping_cart,
                              color: Colors.orange,
                            ))
                          ]))
                    ],
                  )
                ],
              ),

              /// Swap the condition when done
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartt.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      //onTap: () => print(index),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          //  crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: cartt[index].image,
                              trailing: GestureDetector(
                                onTap: () {
                                  // i used price here because cartt[index].price gave an error at last index
                                  var price = cartt[index].price;
                                  _remove(context, index);
                                  _removefromprice(context, price);
                                },
                                child: Icon(
                                  Icons.highlight_remove_rounded,
                                  color: Colors.orange,
                                ),
                              ),
                              title: Text(cartt[index].title),
                              subtitle: Text('TWICE'),
                            ),
                            ListTile(
                              title: Center(
                                  child: Text('\$' + '${cartt[index].price}')),
                              trailing: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: 40,
                                child: Row(
                                  children: [
                                    counter > 0
                                        ? GestureDetector(
                                            onTap: () => _incriment(context),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.orange)),
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
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.grey,
                                              ),
                                            )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(cartt[index].howmanyitems.toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () => Provider.of<addtocart>(
                                              context,
                                              listen: false)
                                          .addcounter(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.orange)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SubTotal'),
                      Text('$subtotal'),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Tax and Fees'), Text('$fees')],
                  ),
                  Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Delivery'), Text('$delivery')],
                  ),
                  Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: 250,
                  child: TextButtonWidget(
                      onPressed: () {
                        print(total);
                      },
                      texts: 'Checkout',
                      colorme: Color.fromRGBO(254, 114, 76, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
