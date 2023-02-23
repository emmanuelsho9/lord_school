import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lord_school/mvvm/viewModel/download.dart';
import 'package:provider/provider.dart';

import '../../test/test.dart';
import '../const/const.dart';
import '../model/resultTable.dart';


class Result extends StatelessWidget {
   Result({Key? key, required this.lastName, required this.firstName, required this.img}) : super(key: key);
  String firstName;
  String lastName;
  String img;

  @override
  Widget build(BuildContext context) {
    BottomSheet bottomSheet = BottomSheet(
      enableDrag: false,
      onClosing: () {},
      backgroundColor :const Color(0xFF2b06bf),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.67,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "You are Excellent,",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "$firstName, $lastName",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
              Flexible(
                child: MyTable(),
              ),
              // Flexible(
              //   child: InkWell(
              //       onTap: () async {
              //        await download().doDownloadFile();
              //       },
              //       child: BtnLogin(text: 'logi',)),
              // ),
            ],
          ),
        );
      },
    );

    AppBar appBar = AppBar(
      backgroundColor: Color(0xFF2b06bf),
      elevation: 0,
      title: const Text(
        "Events & Programs",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.258,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF2b06bf),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(img),
                radius: 60,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: bottomSheet,
    );
  }
}
