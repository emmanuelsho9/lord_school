import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lord_school/mvvm/const/const.dart';


import 'myHomePage.dart';

class OnboardingScreen extends StatelessWidget {
  static String boardingScreen = "OnboardingScreen" ;
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Mcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 81.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: [
                        Image.asset("assets/img_5.png", scale: 2,),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(onTap: () {
                Get.to(
                  MyHomePage(),
                );

              },child: Image.asset("assets/img_6.png", scale: 2,)),


            ],
          ),
        ),
      ),
    );
  }
}
