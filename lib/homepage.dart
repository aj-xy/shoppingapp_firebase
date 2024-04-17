import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppingapp_firebase/cart.dart';
import 'package:shoppingapp_firebase/shoes.dart';
import 'package:shoppingapp_firebase/tag.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        leading: Image.network(
          'https://dspncdn.com/a1/media/692x/c9/bb/15/c9bb155e538e324689b78b82f8a8d083.jpg',
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Cart();
                },
              ));
            },
            child: Icon(
              Icons.shopping_bag_rounded,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.mic_none,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          "All",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tag(
                      tag: "Running",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tag(
                      tag: "Jordan",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tag(
                      tag: "Sneaker",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tag(
                      tag: "Football",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tag(
                      tag: "Basketball",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "New Arrivals",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    width: 215,
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 600,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Shoes')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return shoes(
                          data: snapshot.data!.docs,
                          index: index,
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
