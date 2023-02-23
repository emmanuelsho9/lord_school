import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lord_school/TeacherAccount/teacherHome.dart';
import 'package:lord_school/TeacherAccount/teacherUpdateProfile.dart';

import '../mvvm/const/const.dart';
import '../mvvm/view/createProfile.dart';


class TeacherSignUp extends StatelessWidget {
  TeacherSignUp({Key? key}) : super(key: key);

  bool IsVisible = true;
  String? cla;
  String? department;
  String? termcla;
  List<String> term = ["1st", "2nd", "3Rd"];
  List<String> level = ["JSS1", "JSS2", "JSS3", "SSS1", "SSS2", "SSS3"];
  List<String> departmentList = ["Science", "Commercial", "Art"];

  var _formK = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mcolor,
        elevation: 0,
      ),
      backgroundColor: Mcolor,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              height: size.height * 0.35,
              padding: const EdgeInsets.only(left: 16, right: 16),
              color: Mcolor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hi Teacher",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                        Text(
                          "Create Account as a Teacher",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              height: size.height * 0.65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Form(
                  key: _formK,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your First Name";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: "Enter your First Name"),
                      ),
                      const Gap(20),
                      const Text(
                        "Last Name",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Last Name";
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            hintText: "Enter your Last Name"),
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Select Class",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              StatefulBuilder(
                                builder: (context, setState) => DropdownButton(
                                  hint: const Text("Select Class"),
                                  value: cla,
                                  items: level.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      cla = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Select Department",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              StatefulBuilder(
                                builder: (context, setState) => DropdownButton(
                                  hint:  Text("Select Department"),
                                  value: department,
                                  items: departmentList.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if(cla=="JSS1"||cla=="JSS2"||cla=="JSS3"){
                                      value = "Non";
                                      setState((){});
                                    }else{

                                      setState(() {
                                        department = value;
                                      });}
                                  },
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Select Term",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              StatefulBuilder(
                                builder: (context, setState) => DropdownButton(
                                  hint: Text("Select Term"),
                                  value: termcla,
                                  items: term.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      termcla = value;
                                    });
                                  },
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                      const Gap(20),
                      InkWell(
                        onTap: () {
                          _formK.currentState?.validate();
                          _formK.currentState?.save();

                          if (_firstNameController.text.isEmpty ||
                              _lastNameController.text.isEmpty) {
                            print("object");
                          } else {
                            Get.to(TeacherCreateProfile(), arguments: [
                              cla!,
                              _firstNameController.text.trim(),
                              _lastNameController.text.trim(),
                              termcla!,
                              department
                            ]);
                          }
                        },
                        child: BtnLogin(
                          text: 'Next',
                        ),
                      ),
                      const Gap(10),
                      InkWell(
                        onTap: () {
                         Get.off(TeacherHome());
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Already Have an Account?  ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
