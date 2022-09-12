import 'package:finalproject/classes/Restraunts.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
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
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Search food',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: ListTile(
                title: TextField(
                  onChanged: (value) => _runfilter(value),
                  controller: SearchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'search for food',
                    labelText: 'Search for food',
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
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _founditems.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_founditems[index]['key']),
                  child: ListTile(
                    leading: Text(_founditems[index]['RestrauntName']),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
