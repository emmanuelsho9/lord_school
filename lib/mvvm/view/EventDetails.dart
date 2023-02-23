import 'package:flutter/material.dart';
import 'package:lord_school/mvvm/const/const.dart';

class EventDetails extends StatelessWidget {
   EventDetails({Key? key, required this.text, required this.img}) : super(key: key);
  String img;
  String text;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          AppBar(backgroundColor: Mcolor,),
          Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height*0.4,
              width: double.infinity,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: ClipRRect(
                      child: Image.network(img)))),
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.45,
              child: SingleChildScrollView(child: Text(text,textAlign: TextAlign.start,style: TextStyle(fontSize: 20,letterSpacing: 1),))),
        ],
      ),
    );
  }
}
