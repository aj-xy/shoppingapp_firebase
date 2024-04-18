import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppingapp_firebase/cart.dart';

class Product extends StatelessWidget {
  List data;
  int index;
  Product({required this.data, required this.index, super.key});
  void showAutoDismissDialog(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        // Your popup content here (e.g., AlertDialog, SnackBar)
        return AlertDialog(
          title: Text('Added To Cart'),
          content: Lottie.network(
            'https://lottie.host/8d76dafa-f505-41c8-b04a-73090fad027f/5rYix65fEu.json',
          ),
        );
      },
    );
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addData() async {
    try {
      CollectionReference cart = firestore.collection('cart');
      await cart.add({
        'category': data[index]['category'],
        'image': data[index]['image'],
        'model': data[index]['model'],
        'offer': data[index]['offer'],
        'price': data[index]['price']
      });
      print('Data added successfully');
    } catch (e) {
      print('Error adding data :   $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        actions: [
          Icon(
            Icons.favorite_border,
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
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data[index]['category'],
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data[index]['model'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Image.network(
                data[index]['image'],
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "UK 4",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "UK 4.5",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "UK 5",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "UK 5.5",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "UK 6",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 298,
                      ),
                      Text(
                        "Price",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 65,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(246, 246, 246, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black))),
                          onPressed: () {
                            showAutoDismissDialog(context);
                            addData();
                          },
                          child: Text("Add To Cart")),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        data[index]['price'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
