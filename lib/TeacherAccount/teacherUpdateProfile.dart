import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lord_school/mvvm/model/studentClass.dart';
import 'package:lord_school/mvvm/view/StudentsDashboard.dart';
import 'package:uuid/uuid.dart';

import '../mvvm/const/const.dart';

class TeacherCreateProfile extends StatefulWidget {
  TeacherCreateProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<TeacherCreateProfile> createState() => _TeacherCreateProfileState();
}

class _TeacherCreateProfileState extends State<TeacherCreateProfile> {
  File? selectedImg;

  var uuid = const Uuid();

  var arguments = Get.arguments;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _parentEmailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _MotherFullNameController =
  TextEditingController();
  final TextEditingController _FatherFullNameController =
  TextEditingController();
  final TextEditingController _accountEmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  String ini = "ddd";
  DateTime _academicDate = DateTime.now();
  DateTime _dateOfBirthDate = DateTime.now();
  bool isLoading = false;
  var dp = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mcolor,
        elevation: 0,
      ),
      backgroundColor: Mcolor,
      body: Container(
        height: size.height * 0.2,
        padding: const EdgeInsets.only(left: 16, right: 16),
        color: Mcolor,
      ),
      bottomSheet: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.only(
                        left: 11, right: 11, top: 11, bottom: 11),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xFF5278C1), width: 1)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: selectedImg != null
                              ? FileImage(selectedImg!)
                              : null,
                          child: selectedImg != null
                              ? null
                              : const Text(
                            "Passport",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${arguments[1]}, ${arguments[2]}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Teacher`s Class:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${arguments[0]}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Department: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Text(
                                  arguments[0]=="JSS1"||arguments[0]=="JSS3"||arguments[0]=="JSS2"?dp="Null": dp="${arguments[4]}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(10),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  final pickedImg = await ImagePicker()
                                      .pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 85);

                                  if (pickedImg == null) return;
                                  final imgTemp = File(pickedImg.path);
                                  setState(() {
                                    selectedImg = imgTemp;
                                  });
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Teacher No",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                TextFormField(
                                  //  controller: _lastNameController,
                                  initialValue: uuid.v1(),
                                  enabled: false,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                      hintText: "Enter your Last Name"),
                                ),
                              ],
                            ),
                          ),
                          const Gap(35),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Academic Year",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                      suffix: Icon(Icons.calendar_view_day),
                                      hintText: "Enter your Last Name"),
                                  initialValue: "${_academicDate.year}",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      const Gap(20),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Account Email",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                TextFormField(
                                  controller: _accountEmailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Check";
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration:
                                  const InputDecoration(hintText: "Email"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Home Address",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                TextFormField(
                                  controller: _addressController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Address";
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                      hintText: "Address"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                TextFormField(
                                  controller: _PasswordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Password";
                                    }
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: const InputDecoration(
                                      hintText: "Password"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      InkWell(
                        onTap: createAccoun,
                        child: isLoading == false
                            ? BtnLogin(
                          text: "Create Account",
                        )
                            : CircularProgressIndicator(
                            backgroundColor: Mcolor, color: Colors.white),
                      ),
                      const Gap(20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  createAccoun() async {
    _formKey.currentState?.validate();
    var auth = FirebaseAuth.instance;
    if (_parentEmailController.text.isEmpty &&
        _MotherFullNameController.text.isEmpty &&
        _FatherFullNameController.text.isEmpty &&
        _accountEmailController.text.isEmpty &&
        arguments[0] == null &&
        arguments[1] &&
        arguments[2] &&
        arguments[3]) {
      //Get.snackbar("Check the Form", "Form Not Completely Fi");

    } else {
      try {
        isLoading = true;
        setState(() {});
        Reference ref = FirebaseStorage.instance.ref();
        Reference reDImg = ref.child("image");
        Reference refUploadImg =
        reDImg.child(_accountEmailController.text.trim());
        await refUploadImg.putFile(selectedImg!);
        var imUrl = await refUploadImg.getDownloadURL();
        await auth
            .createUserWithEmailAndPassword(
            email: _accountEmailController.text.trim(),
            password: _PasswordController.text.trim())
            .then((value) {
          var student = StudentDetails(
              admissionNo: uuid.v1(),
              academic: _academicDate.year.toString(),
              dateofAdmissiion:
              "${_academicDate.day}-${_academicDate.month}-${_academicDate.year}",
              parentEmail: _parentEmailController.text.trim(),
              motherFullName: _MotherFullNameController.text.trim(),
              fatherFullName: _FatherFullNameController.text.trim(),
              accountEmail: _accountEmailController.text.trim(),
              studentDetailsClass: "${arguments[0]}",
              term: "${arguments[3]}",
              firstName: "${arguments[1]}",
              lastName: "${arguments[2]}",
              passPort: imUrl.toString().trim(),
              StudentdateOfBirth:
              "${_dateOfBirthDate.day}-${_dateOfBirthDate.month}-${_dateOfBirthDate.year}",
              Address: _addressController.text.trim(),
              attendaceCount: 0, schoolLent: 0, dp: dp);

          firebaseToAdd.set(student.toJson()).then((value) {
            Get.off(StudentsDashboard());
          });
        });
        isLoading = false;
        setState(() {});
      } catch (e) {
        isLoading = false;
        setState(() {});
        Get.snackbar("$e".replaceAll("firebase_auth", "Auth"),
            "Error fron $e".replaceAll("firebase_auth", "Auth"));
        print(e);
      }
    }
  }
}
