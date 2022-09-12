import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:finalproject/classes/Restraunts.dart';
import 'package:finalproject/classes/food_categories.dart';

import 'package:finalproject/screens/cart.dart';

import 'package:finalproject/screens/restraunts_data.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Drawer();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final iconList = <IconData>[
    Icons.home,
    Icons.pin_drop,
    Icons.favorite_border,
    Icons.notifications,
  ];
  var _bottomNavIndex = 0;
  void _onTap(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  TextEditingController SearchController = TextEditingController();
  List<Map<dynamic, dynamic>> _founditems = [];
  void _runfilter(String enteredkeyword) {
    List<Map<dynamic, dynamic>> result = [];

    if (enteredkeyword.isEmpty) {
      print('ssssssssssssssssssssssssssssssssssssssssssssssss');
    } else {
      result = MyRestraunts.allItems
          .where((user) => user['RestrauntName']
              .toLowerCase()
              .contains(enteredkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _founditems = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  List cartt = Provider.of<CartList>(context).getcart;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Container(
        height: double.infinity,
        child: Drawer(
            backgroundColor: Colors.transparent,
            elevation: 20,
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Container(
                        //color: Colors.red,
                        ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.list,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('My Orders',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.account_box,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('My Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.pin_drop,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Delivery Address',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.payment,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Payment Methods',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.mail,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Contact Us',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.settings,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Settings',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      'Deliver to ↓',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      '4102 Pretty View Lane',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )
                  ],
                ),
                Container(
                    height: 59,
                    width: 57,
                    decoration: BoxDecoration(
                      color: Colors.yellow[800],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'What Would you like \fto order',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              title: TextField(
                onChanged: (value) => _runfilter(value),
                // onChanged: (String? value) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => SearchScreen(),
                //       ));
                // },
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => SearchScreen(),
                  //     ));
                },

                controller: SearchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'search for Restraunts',
                  labelText: 'Search for Restraunts',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    //
                  ),
                  //   contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ),
              ),
              trailing: Container(
                width: 51,
                height: 51,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                child: const Center(
                  child: Icon(
                    Icons.filter_list_rounded,
                    color: Color.fromRGBO(254, 114, 76, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _founditems.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      //shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.75)),
                      itemCount: _founditems.length,
                      itemBuilder: (context, index) => Card(
                          key: ValueKey(_founditems[index]['key']),
                          child: GestureDetector(
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  Container(
                                    //height: 230,
                                    height: MediaQuery.of(context).size.height *
                                        0.28,
                                    //width: 266,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 70,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: _founditems[index]
                                                  ['subLogo']
                                              //Image.asset('images/Burger.png'),
                                              ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              _founditems[index]
                                                      ['RestrauntName']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.delivery_dining,
                                              color: Color.fromRGBO(
                                                  254, 114, 76, 1),
                                            ),
                                            Text('Free Delivery'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.punch_clock,
                                              color: Color.fromRGBO(
                                                  254, 114, 76, 1),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),

                                        SizedBox(
                                          width: 20,
                                        ),

                                        //  itemCount: Tags.items.length + 1,

                                        Expanded(
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              width: 20,
                                            ),
                                            itemCount: MyRestraunts
                                                .allItems[index]['tags'].length,
                                            itemBuilder: (context, indexx) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(2),
                                                    height: 30,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .transparent),
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Center(
                                                        child: Text(
                                                            _founditems[index]
                                                                    ['tags']
                                                                [indexx])),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 80.0, top: 10),
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      height: 27,
                                      width: 60,
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
                                            Text('4.5'),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RestrauntProfile(
                                            restrauntName: _founditems[index]
                                                ['RestrauntName'],
                                            image: _founditems[index]['Image'],
                                            subLogo: _founditems[index]
                                                ['subLogo'],
                                            restrauntTags: _founditems[index]
                                                ['tags'],
                                            foodname: _founditems[index]
                                                ['foodname'],
                                            foodimage: _founditems[index]
                                                ['foodImage'],
                                            fooddiscription: _founditems[index]
                                                ['foodDiscription'],
                                            foodprice: MyRestraunts
                                                .allItems[index]['foodprice'],
                                          )),
                                );
                              })),
                    ),
                  )
                : Expanded(
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        height: 110,
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 20,
                                ),
                            scrollDirection: Axis.horizontal,
                            itemCount: Categories.items.length,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Container(
                                    padding: EdgeInsets.only(
                                        top: 4, left: 5, right: 5, bottom: 15),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 70.0,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Center(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  child: Image.asset(
                                                      'images/Burger.png'))),
                                          Text(Categories.items[index].name,
                                              style: TextStyle(
                                                  color: Colors.black))
                                        ]));
                              } else {
                                return Container(
                                    padding: EdgeInsets.only(
                                        top: 4, left: 5, right: 5, bottom: 15),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 70.0,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Center(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  child: Categories
                                                      .items[index].image
                                                  //Image.asset('images/Burger.png'),
                                                  )),
                                          Text(Categories.items[index].name,
                                              style: TextStyle(
                                                  color: Colors.black))
                                        ]));
                              }
                            }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Featured Restaurants',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'View all >',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(254, 104, 68, 1)),
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.separated(
                          //shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                          itemCount: MyRestraunts.allItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  Container(
                                    height: 230,
                                    width: 266,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: MyRestraunts.allItems[index]
                                                ['Image']
                                            //Image.asset('images/Burger.png'),
                                            ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              MyRestraunts.allItems[index]
                                                      ['RestrauntName']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.delivery_dining,
                                              color: Color.fromRGBO(
                                                  254, 114, 76, 1),
                                            ),
                                            Text('Free Delivery'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.punch_clock,
                                              color: Color.fromRGBO(
                                                  254, 114, 76, 1),
                                            ),
                                            Text('10-15 minutes')
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),

                                        SizedBox(
                                          width: 20,
                                        ),

                                        //  itemCount: Tags.items.length + 1,

                                        Expanded(
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              width: 20,
                                            ),
                                            itemCount: MyRestraunts
                                                .allItems[index]['tags'].length,
                                            itemBuilder: (context, indexx) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(2),
                                                    height: 30,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .transparent),
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Center(
                                                        child: Text(MyRestraunts
                                                                .allItems[index]
                                                            ['tags'][indexx])),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      height: 27,
                                      width: 84,
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
                                            Text('4.5'),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
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
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RestrauntProfile(
                                          restrauntName: MyRestraunts
                                              .allItems[index]['RestrauntName'],
                                          image: MyRestraunts.allItems[index]
                                              ['Image'],
                                          subLogo: MyRestraunts.allItems[index]
                                              ['subLogo'],
                                          restrauntTags: MyRestraunts
                                              .allItems[index]['tags'],
                                          foodname: MyRestraunts.allItems[index]
                                              ['foodname'],
                                          foodimage: MyRestraunts
                                              .allItems[index]['foodImage'],
                                          fooddiscription:
                                              MyRestraunts.allItems[index]
                                                  ['foodDiscription'],
                                          // fooddiscription:
                                          //     Mcdonalds.itema[index].fooddiscription,
                                          // foodimage: Mcdonalds.itema[index].foodimage,
                                          foodprice: MyRestraunts
                                              .allItems[index]['foodprice'],
                                        )),
                              ),
                            );
                          },
                        ),
                      )
                    ]),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          //  print(cartt);
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => MyCart()));
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _onTap(index)),
        //other params
      ),
    );
  }
}
