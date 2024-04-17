import 'package:flutter/material.dart';
import 'package:shoppingapp_firebase/product.dart';

class shoes extends StatelessWidget {
  List data;
  int index;
  shoes({required this.data, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Product(
              data: data,
              index: index,
            );
          },
        ));
      },
      child: SizedBox(
        height: 150,
        width: 150,
        child: Row(
          children: [
            Image.network(
              data[index]['image'],
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    data[index]['model'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(data[index]['category']),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(data[index]['price'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(data[index]['offer']),
                      SizedBox(
                        width: 72,
                      ),
                      Icon(Icons.arrow_circle_right_outlined)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
