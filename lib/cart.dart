import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppingapp_firebase/shoes.dart';

class Cart extends StatelessWidget {
  Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  "Bag",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.shopping_cart,
                  size: 40,
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 300,
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('cart').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return shoes(
                              data: snapshot.data!.docs,
                              index: index,
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(
                            width: 10,
                          ),
                          Transform.rotate(
                              angle: 270 * 3.1415 / 180,
                              child: Icon(
                                Icons.arrow_back_ios_new,
                              )),
                          SizedBox(
                            width: 140,
                          ),
                          Text(
                            "Price : ${snapshot.data!.docs[0]['price']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Subtotal : "),
                              SizedBox(
                                width: 274,
                              ),
                              Text("${snapshot.data!.docs[0]['price']}")
                            ],
                          ),
                          Row(
                            children: [
                              Text("Delivery"),
                              SizedBox(
                                width: 310,
                              ),
                              Text("Free")
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                width: 294,
                              ),
                              Text(
                                "${snapshot.data!.docs[0]['price']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
