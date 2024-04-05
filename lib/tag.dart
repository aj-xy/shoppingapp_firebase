import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
   Tag({super.key,required this.tag});
  String tag;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10),color: Colors.white),child: Padding(
        padding: const EdgeInsets.all(9),
        child: Text(widget.tag,style: TextStyle(color: Colors.black),),
      ),
    );
  }
}