import 'package:finalproject/classes/Restraunts.dart';
import 'package:finalproject/classes/food_items.dart';
import 'package:finalproject/classes/provider.dart';
import 'package:finalproject/component/component.dart';
import 'package:finalproject/screens/food_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestrauntProfile extends StatefulWidget {
  final String? restrauntName;
  final Image? image;
  final Image? subLogo;
  final List? restrauntTags;
  final List? foodname;
  final List? fooddiscription;
  final List<Image>? foodimage;
  final List? foodprice;
  const RestrauntProfile(
      {Key? key,
      this.restrauntName,
      this.image,
      this.subLogo,
      this.restrauntTags,
      this.foodname,
      this.fooddiscription,
      this.foodimage,
      this.foodprice})
      : super(key: key);

  @override
  State<RestrauntProfile> createState() => _RestrauntProfileState();
}

class _RestrauntProfileState extends State<RestrauntProfile> {
  // Future<void> _showMyDialog(foodname) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Add to Cart?'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               const Text(
  //                 'Are you sure you want to add  ',
  //               ),
  //               SizedBox(
  //                 height: 10,
  //               ),
  //               Text(
  //                 '${foodname}',
  //                 style: TextStyle(fontSize: 20),
  //               ),
  //               SizedBox(
  //                 height: 10,
  //               ),
  //               Text('to the cart?')
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Add'),
  //             onPressed: () {
  //               Provider.of<addtocart>(context, listen: false).add();
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<addtocart>(context).getcart;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: widget.image),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.33,
                        top: MediaQuery.of(context).size.height * 0.18),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          color: Colors.white,
                          height: 80,
                          width: 80,
                          child: widget.subLogo,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      widget.restrauntName.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      '6 October City',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.delivery_dining,
                    color: Color.fromRGBO(254, 114, 76, 1),
                  ),
                  Text('Free Delivery'),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.punch_clock,
                    color: Color.fromRGBO(254, 114, 76, 1),
                  ),
                  Text('10-15 minutes')
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Featured Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemCount: widget.foodname!.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodData(
                                        foodname: widget.foodname?[index],
                                        foodDiscription:
                                            widget.fooddiscription?[index],
                                        foodprice: widget.foodprice?[index],
                                        foodImage: widget.foodimage![index],
                                      )));
                        },
                        child: Card(
                          semanticContainer: true,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: widget.foodimage![index]),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 27,
                                      //width: 84,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Text(
                                        widget.foodprice![index].toString(),
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 90),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: const [
                                              Text(
                                                '4.5',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 12,
                                              ),
                                              Text(
                                                '(25+)',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  widget.foodname![index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(widget.fooddiscription![index]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Text('$counter'),
              // Center(
              //   child: SizedBox(
              //     height: 60,
              //     width: 250,
              //     child: TextButtonWidget(
              //         onPressed: () {},
              //         // => Navigator.push(
              //         //       context,
              //         //       MaterialPageRoute(
              //         //           builder: (context) => HomeScreen()),
              //         //     ),
              //         texts: 'Proceed To Cart',
              //         colorme: Color.fromRGBO(254, 114, 76, 1)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
