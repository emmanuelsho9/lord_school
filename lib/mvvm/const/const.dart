
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

var Crouning =  CircularProgressIndicator(backgroundColor: Mcolor,color: Colors.white,);


var rolling = Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Crouning
    ],
  ),
);


var firebaseToAdd = FirebaseFirestore.instance
    .collection("School")
    .doc("AdminDoc")
    .collection("AdminCollection")
    .doc("TeacherDoc")
    .collection("Students")
    .doc("details")
    .collection("Class") .doc(auth.currentUser?.uid)
    .collection("StudentProfile").doc(auth.currentUser?.uid);
String userName="";


getUserData() async {
  DocumentSnapshot userSnapshot = await firebaseToAdd.get();
  userName = userSnapshot.get('DateofAdmissiion');
  print(userName);
}


var firebaseAdmin = FirebaseFirestore.instance.collection("Amin").doc("School").collection("JSS1").doc();



var teacherAssignment = FirebaseFirestore.instance
    .collection("School")
    .doc("AdminDoc")
    .collection("AdminCollection")
    .doc("TeacherDoc")
    .collection("Students")
    .doc("details")
    .collection("Class");



var eventFirebase = FirebaseFirestore.instance.collection("School").doc("AdminDoc").collection("AdminCollection").doc("EventNow").collection("Event");
var galleryAdmin = FirebaseFirestore.instance.collection("School").doc("AdminDoc").collection("AdminCollection").doc("GalleryNow").collection("Gallery");
var leaveApplicationAdmin = FirebaseFirestore.instance.collection("School").doc("AdminDoc").collection("AdminCollection").doc("Leave").collection("Leave");
var askAboutApplicationAdmin = FirebaseFirestore.instance.collection("School").doc("AdminDoc").collection("AdminCollection").doc("AskAbout").collection("AskAbout");
var schoolHolidayApplicationAdmin = FirebaseFirestore.instance.collection("School").doc("AdminDoc").collection("AdminCollection").doc("holiday").collection("holiday");
var paymentOption = FirebaseFirestore.instance.collection("School").doc("schoolFee").collection("option");
var paymentSchoolFee = FirebaseFirestore.instance.collection("School").doc("schoolFee").collection("option").doc("SchholFee");