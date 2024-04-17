import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Bag",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),SizedBox(width: 25,),
                  Icon(Icons.shopping_cart,size: 40,)
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 150,
                child: Row(
                  children: [
                    Image.network(
                        'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/d76b79fd-e11d-458d-8177-fa1746921e21/revolution-7-road-running-shoes-Dfvsch.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nike Revolution 7",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Womens Running Shoe",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Size 5",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Quantity",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("1",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(
                    width: 10,
                  ),
                  Transform.rotate(
                      angle: 270 * 3.1415 / 180,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                      )),
                  SizedBox(
                    width: 220,
                  ),
                  Text(
                    "Price",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Subtotal"),SizedBox(width: 100,)
                    ],
                  ), 
                  Row(
                    children: [
                      Text("Delivery"),SizedBox(width: 100,)
                    ],
                  ), 
                  Row(
                    children: [
                      Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),SizedBox(width: 100,)
                    ],
                  )],
              )
            ],
          ),
        ),
      )),
    );
  }
}
