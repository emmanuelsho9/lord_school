import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/const.dart';
import '../view/StudentsDashboard.dart';

class AuthLord {











  login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty && password.isEmpty) {
    } else {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) {
        Get.off(StudentsDashboard());
      });
    }
  }

  askAbout(
      {required String teacherSubject,
      required String Subject,
      required String title,
      required String desctiption}) async {
    await askAboutApplicationAdmin.add({
      "Teach Name": teacherSubject,
      "Select Subject": Subject,
      "title": title,
      "description": desctiption
    });
  }
}
