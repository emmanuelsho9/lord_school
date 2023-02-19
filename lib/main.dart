import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'mvvm/model/studentClass.dart';
import 'mvvm/view/StudentsDashboard.dart';
import 'mvvm/view/myHomePage.dart';
import 'mvvm/view/onBoardingScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  var auth = FirebaseAuth.instance;
  var isLogin = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lord School',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (checkUserState() == true ? StudentsDashboard() : new OnboardingScreen()),

    );
  }
   bool checkUserState() {
     return (auth.currentUser != null);
   }
}


