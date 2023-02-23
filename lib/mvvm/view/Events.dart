import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lord_school/mvvm/const/const.dart';
import 'package:provider/provider.dart';

import 'EventDetails.dart';

class EventsPrograms extends StatelessWidget {
  const EventsPrograms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  bool arrow = true;

    BottomSheet bottomSheet = BottomSheet(
      enableDrag: false,
      onClosing: () {},
      backgroundColor: Mcolor,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: StreamBuilder(
              stream: eventFirebase.snapshots(),
              builder: (_,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData && snapshot.data == null) {
                  return const Center(
                    child: Text("Getting Error"),
                  );
                } else {
                  return ListView.builder(
                    //  physics: new NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      if (snapshot.data == null) {
                        return const Text("");
                      }
                      DocumentSnapshot ds = snapshot.data!.docs[index];

                      if (snapshot.data == null) {
                        return const Text("");
                      } else {
                        return SingleChildScrollView(
                          child: InkWell(
                            onTap: () {
                              Get.to(EventDetails(text: ds["details"], img: ds["img"],));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              child: Card(
                                borderOnForeground: true,
                                elevation: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ds["title"],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            wordSpacing: 0.4,
                                            height: 1.5,
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          ds["img"] == null
                                              ? Icon(Icons.image)
                                              : Container(
                                                  width: 75,
                                                  height: 75,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                  child: Image.network(
                                                    ds["img"],
                                                    fit: BoxFit.cover,
                                                    height: 75,
                                                    width: 75,
                                                  )),
                                          const Gap(10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.timelapse,
                                                      color: Color(0xFF6789CA),
                                                      size: 15),
                                                  Text(
                                                    ds["time"],
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                        wordSpacing: 0.4,
                                                        height: 1.5,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF6789CA)),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.6,
                                                    child: Text(
                                                      ds["details"],
                                                      textAlign: TextAlign.start,
                                                      maxLines: 3,

                                                      style: const TextStyle(
                                                          wordSpacing: 0.4,
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                 const Icon(Icons.more_horiz)
                                                ],
                                                
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );

    AppBar appBar = AppBar(
      backgroundColor: Mcolor,
      toolbarHeight: 70,
      title: const Text(
        "Events & Programs",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );

    return Scaffold(
      body: Container(
        color: Mcolor,
      ),
      backgroundColor: Mcolor,
      bottomSheet: bottomSheet,
      appBar: appBar,
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      // await eventFirebase.add({
      //   "title":"Hi"
      // });
      //
      // },child: Icon(Icons.send),),
    );
  }
}
