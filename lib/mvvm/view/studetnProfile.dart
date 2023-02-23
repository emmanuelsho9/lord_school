import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lord_school/mvvm/const/const.dart';
import 'package:lord_school/mvvm/view/myHomePage.dart';

import '../model/studentClass.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static Future<StudentDetails> DetailsProfile() async {
    final snaphot = await firebaseToAdd
        .withConverter(
          fromFirestore: (snapshot, options) {
            if (!snapshot.exists) return null;
            return StudentDetails.fromJson(snapshot.data()!);
          },
          toFirestore: (value, options) => value!.toJson(),
        )
        .get();
    return snaphot.data()!;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<StudentDetails>(
        future: DetailsProfile(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return  rolling;
          }else
          if (snapshot.hasData) {
            var student = snapshot.data;
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Mcolor,
                    title: const Text("My Profile"),
                    toolbarHeight: 100,
                    elevation: 0,
                  ),
                  const Gap(20),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            children: [
                              nameImgClass(
                                  img: student!.passPort,
                                  StudentFirstName: student.firstName,
                                  StudentLastName: student.lastName,
                                  Studentclass: student.studentDetailsClass,
                                  Studentterm: student.term),
                              const Gap(20),
                              admisionAcademic(
                                  student.admissionNo, student.academic),
                              const Gap(20),
                              dateOfBithDateOfAdmision(student.dateofAdmissiion,
                                  student.StudentdateOfBirth),
                              const Gap(20),
                              parentEmail(student.parentEmail, context),
                              const Gap(20),
                              motherName(student.motherFullName, context),
                              const Gap(20),
                              fatherName(student.fatherFullName, context),
                              const Gap(20),
                              address(student.Address, context),
                              const Gap(50),
                              InkWell(
                                  onTap: () async {
                                    var LogOut = await FirebaseAuth.instance
                                        .signOut()
                                        .then((value) => Get.off(MyHomePage()));
                                  },
                                  child: BtnLogin(
                                    text: 'SIGN OUT',
                                  )),
                              const Gap(20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return rolling;
          }
        },
      ),
    );
  }

  Row address(String Address, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Parmanent Add. ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            Text(
              Address,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * 0.89,
              height: 1.5,
              color: Colors.grey,
              child: const Text(""),
            )
          ],
        ),
      ],
    );
  }

  Row fatherName(String FatherName, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Father Name ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            Text(
              FatherName,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * 0.89,
              height: 1.5,
              color: Colors.grey,
              child: const Text(""),
            )
          ],
        ),
      ],
    );
  }

  Row motherName(String MotherName, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mother Name ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            Text(
              MotherName,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * 0.89,
              height: 1.5,
              color: Colors.grey,
              child: const Text(""),
            )
          ],
        ),
      ],
    );
  }

  Row parentEmail(String ParentEmail, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Parent Mail ID ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            Text(
              ParentEmail,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * 0.89,
              height: 1.5,
              color: Colors.grey,
              child: const Text(""),
            )
          ],
        ),
      ],
    );
  }

  Row dateOfBithDateOfAdmision(String DateofAdmission, String DateofBirth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Date of Admission ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            SizedBox(
              width: 150,
              child: Text(
                DateofAdmission,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const Gap(10),
            Container(
              width: 150,
              height: 1.5,
              color: Colors.grey,
              child: const Text(""),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Date of Birth ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            SizedBox(
              width: 150,
              child: Text(
                DateofBirth,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const Gap(10),
            Container(
              width: 150,
              height: 1.5,
              color: Colors.grey,
              child: const Text(""),
            )
          ],
        ),
      ],
    );
  }

  Row admisionAcademic(String AdmissionNo, String DateofAdmission) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Admission  No ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            SizedBox(
              width: 150,
              child: Text(
                AdmissionNo,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const Gap(10),
            Container(
              width: 150,
              height: 1.5,
              color: Colors.grey,
              child: const Text(""),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Academic Year ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
            const Gap(10),
            SizedBox(
              width: 150,
              child: Text(
                DateofAdmission,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const Gap(10),
            Container(
              width: 150,
              height: 1.5,
              color: Colors.grey,
              child: Text(""),
            )
          ],
        ),
      ],
    );
  }
}

class nameImgClass extends StatelessWidget {
  const nameImgClass({
    Key? key,
    required this.img,
    required this.StudentFirstName,
    required this.StudentLastName,
    required this.Studentclass,
    required this.Studentterm,
  }) : super(key: key);

  final String img;
  final String StudentFirstName;
  final String StudentLastName;
  final String Studentclass;
  final String Studentterm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(
            color: Color(0xFF2B06BF),
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.grey),
            child: CircleAvatar(
              backgroundImage: NetworkImage(img),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "$StudentFirstName ",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    StudentLastName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Class ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    Studentclass,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Term ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    Studentterm,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
