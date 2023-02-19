import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lord_school/mvvm/model/studentClass.dart';
import 'package:lord_school/mvvm/view/myHomePage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../const/const.dart';

class StudentsDashboard extends StatelessWidget {
  StudentsDashboard({Key? key}) : super(key: key);

  var auth = FirebaseAuth.instance;

  static Future<StudentDetails> Details()async{
    final snaphot = await firebaseToAdd.withConverter(fromFirestore: (snapshot, options) {
      if(!snapshot.exists) return null;
      return StudentDetails.fromJson(snapshot.data()!);
    }, toFirestore: (value, options) => value!.toJson(),).get();
    return snaphot.data()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<StudentDetails>(
              future: Details(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  var student = snapshot.data;
                  return Text(student!.academic);
                }else{
                  return Text("Something Went Wrong");

                }
              }),
            AppBar(
              backgroundColor: Mcolor,
              toolbarHeight: 150,
              elevation: 0,
              actions: [
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:
                            MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            "Hi }",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400),
                          ),
                          const Gap(9),
                          Row(
                            children: [
                              Text(
                                "Class  ",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "|  Dept  ",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.28,
                ),
                InkWell(
                  // onTap: () => Get.to(const Profile()),
                  child: CircleAvatar(
                    maxRadius: 30,
                    // backgroundImage: NetworkImage(img),
                  ),
                ),
                Gap(10),
              ],
              leading: Row(
                children: [],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 164.88,
                        height: 201.28,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Color(0xFF2C66D6), width: 1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFCF3E2),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Center(
                                  child: Image.asset(
                                "assets/img_7.png",
                                scale: 2,
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                //  Get.to(ATTENDANCEHOLIDAY());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "100",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "%",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "Attendance",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6184C7)),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //   Get.to(FeesDue());
                        },
                        child: Container(
                          width: 164.88,
                          height: 201.28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color(0xFF2C66D6), width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFD8FF),
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Center(
                                    child: Image.asset(
                                  "assets/img_8.png",
                                  scale: 2,
                                )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "N",
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "180,750",
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const Text(
                                "Fees Due",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6184C7)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  listOfItem(
                    firstText: 'Play Quiz',
                    firstImg: 'assets/img_11.png',
                    secondText: 'Assignment',
                    secondImg: 'assets/img_12.png',
                    FirstonTap: () {
                      // Get.to(PlayQuiz());
                    },
                    SecondonTap: () {
                      //    Get.to(const Assignment());
                    },
                  ),
                  const Gap(16),
                  listOfItem(
                    firstText: 'School Holiday',
                    firstImg: 'assets/img_9.png',
                    secondText: 'Time Table',
                    secondImg: 'assets/img_10.png',
                    FirstonTap: () {
                      // Get.to(ATTENDANCEHOLIDAY());
                    },
                    SecondonTap: () {
                      //  Get.to(TimeTableNew());
                    },
                  ),
                  const Gap(16),
                  listOfItem(
                    firstText: 'Result',
                    firstImg: 'assets/img_13.png',
                    secondText: 'Events',
                    secondImg: 'assets/img_21.png',
                    FirstonTap: () {
                      // Get.to(Result());
                    },
                    SecondonTap: () {
                      // Get.to(EventsPrograms());
                    },
                  ),
                  const Gap(16),
                  listOfItem(
                    firstText: 'Ask Doubt',
                    firstImg: 'assets/img_17.png',
                    secondText: 'School Gallery',
                    secondImg: 'assets/img_18.png',
                    FirstonTap: () {
                      //   Get.to(AskDoubt());
                    },
                    SecondonTap: () {
                      //  Get.to(SchoolGallery());
                    },
                  ),
                  const Gap(16),
                  listOfItem(
                    firstText: 'Leave Application',
                    firstImg: 'assets/img_19.png',
                    secondText: 'Change Password',
                    secondImg: 'assets/img_20.png',
                    FirstonTap: () {
                      // Get.to(LeaveApplication());
                    },
                    SecondonTap: () {
                      FirebaseAuth.instance.signOut();
                      //  Get.to(HiStudent());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut().then((value) {
            Get.off(MyHomePage());
          });
        },
        child: const Icon(Icons.logout),
      ),
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
            child: Image.network(
              img,
              fit: BoxFit.cover,
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

class listOfItem extends StatelessWidget {
  listOfItem({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.firstImg,
    required this.secondImg,
    required this.FirstonTap,
    required this.SecondonTap,
  }) : super(key: key);

  String firstText;
  String secondText;
  String secondImg;
  String firstImg;
  Function()? FirstonTap;
  Function()? SecondonTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: FirstonTap,
            child: ContainerForSchoolHoliday(
              text: firstText,
              img: firstImg,
            )),
        InkWell(
            onTap: SecondonTap,
            child: ContainerForSchoolHoliday(
              text: secondText,
              img: secondImg,
            )),
      ],
    );
  }
}

class ContainerForSchoolHoliday extends StatelessWidget {
  ContainerForSchoolHoliday({
    Key? key,
    required this.text,
    required this.img,
  }) : super(key: key);

  String text;
  String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164.88,
      height: 131.53,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                scale: 2,
              ),
            ],
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6184C7)),
          ),
        ],
      ),
    );
  }
}
