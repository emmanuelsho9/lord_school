
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

Color Mcolor = Color(0xFFA55467);



class BtnLogin extends StatelessWidget {
  BtnLogin({
    Key? key, required this.text
  }) : super(key: key,);

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54, decoration: BoxDecoration(
        color: Mcolor,
        borderRadius: const BorderRadius.all(Radius.circular(15))
    ),
      child:  Center(child: Text(text,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white))),
    );
  }
}
var auth = FirebaseAuth.instance;


var firebaseToAdd = FirebaseFirestore.instance
    .collection("School")
    .doc("AdminDoc")
    .collection("AdminCollection")
    .doc("TeacherDoc")
    .collection("Students")
    .doc("details")
    .collection("Path") .doc(auth.currentUser?.uid)
    .collection("StudentProfile").doc(auth.currentUser?.uid);



