import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lord_school/mvvm/const/const.dart';
import 'package:provider/provider.dart';

class TimeTableNew extends StatelessWidget {
   TimeTableNew({Key? key, required this.Class}) : super(key: key);

  String Class;

  @override
  Widget build(BuildContext context) {


    BottomSheet bottomSheet =BottomSheet(
      enableDrag: false,
      onClosing: () {  }, backgroundColor: Mcolor,
      builder: (BuildContext context) {
        return  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              const Flexible(
                flex: 2,
                child: SizedBox(
                  height: 20,
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.grey,
                          width: 1
                      )
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TabBar(
                    indicator:BoxDecoration(
                        color: Color(0xFF6789CA),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      TabAppBar(text: 'MON',),
                      TabAppBar(text: 'Tue',),
                      TabAppBar(text: 'Wed',),
                      TabAppBar(text: 'Thu',),
                      TabAppBar(text: 'Fri',),


                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 23,
                child: TabBarView(children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: StreamBuilder(
                      stream: teacherAssignment.doc("TimeTable").collection(Class).snapshots(),
                      builder: (_,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (!snapshot.hasData && snapshot.connectionState==ConnectionState.waiting) {
                          return  rolling;
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {

                                DocumentSnapshot ds = snapshot.data!.docs[index];

                                return SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                    child: Card(
                                      borderOnForeground: true,
                                      elevation: 2,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(ds["subject"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Text(ds["time"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(ds["subjectTeacherName"], textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                                Text("Period ${ds["Period"]}", textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }

                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("School").doc("AdminDoc").collection("AdminCollection").doc("TeacherDoc").collection("TimeTable").doc("Tue").collection("TimeTableLive")
                          .snapshots(),
                      builder: (_,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.hasData && snapshot.data == null) {
                          return const Center(
                            child: Text("Getting Error"),
                          );
                        } else {
                          return ListView.builder(

                            //  physics: new NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              if(snapshot.data==null){
                                return const Text("");
                              }
                              DocumentSnapshot ds = snapshot.data!.docs[index];

                              if (snapshot.data == null) {
                                return const Text("");
                              } else {

                                return SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                    child: Card(
                                      borderOnForeground: true,
                                      elevation: 2,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(ds["subject"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Text(ds["time"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Divider(
                                              thickness: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(ds["subjectTeacherName"], textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                                Text("Period ${ds["Period"]}", textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                              ],
                                            ),

                                          ],
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
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("School").doc("AdminDoc").collection("AdminCollection").doc("TeacherDoc").collection("TimeTable").doc("Mon").collection("TimeTableLive")
                          .snapshots(),
                      builder: (_,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.hasData && snapshot.data == null) {
                          return const Center(
                            child: Text("Getting Error"),
                          );
                        } else {
                          return ListView.builder(

                            //  physics: new NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              if(snapshot.data==null){
                                return const Text("");
                              }
                              DocumentSnapshot ds = snapshot.data!.docs[index];

                              if (snapshot.data == null) {
                                return const Text("");
                              } else {

                                return SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                    child: Card(
                                      borderOnForeground: true,
                                      elevation: 2,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(ds["subject"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Text(ds["time"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Divider(
                                              thickness: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(ds["subjectTeacherName"], textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                                Text("Period ${ds["Period"]}", textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                              ],
                                            ),

                                          ],
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
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("School").doc("AdminDoc").collection("AdminCollection").doc("TeacherDoc").collection("TimeTable").doc("Mon").collection("TimeTableLive")
                          .snapshots(),
                      builder: (_,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.hasData && snapshot.data == null) {
                          return const Center(
                            child: Text("Getting Error"),
                          );
                        } else {
                          return ListView.builder(

                            //  physics: new NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              if(snapshot.data==null){
                                return const Text("");
                              }
                              DocumentSnapshot ds = snapshot.data!.docs[index];

                              if (snapshot.data == null) {
                                return const Text("");
                              } else {

                                return SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                    child: Card(
                                      borderOnForeground: true,
                                      elevation: 2,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(ds["subject"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Text(ds["time"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Divider(
                                              thickness: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(ds["subjectTeacherName"], textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                                Text("Period ${ds["Period"]}", textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                              ],
                                            ),

                                          ],
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
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("School").doc("AdminDoc").collection("AdminCollection").doc("TeacherDoc").collection("TimeTable").doc("Mon").collection("TimeTableLive")
                          .snapshots(),
                      builder: (_,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.hasData && snapshot.data == null) {
                          return const Center(
                            child: Text("Getting Error"),
                          );
                        } else {
                          return ListView.builder(

                            //  physics: new NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              if(snapshot.data==null){
                                return const Text("");
                              }
                              DocumentSnapshot ds = snapshot.data!.docs[index];

                              if (snapshot.data == null) {
                                return const Text("");
                              } else {

                                return SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                    child: Card(
                                      borderOnForeground: true,
                                      elevation: 2,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(ds["subject"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Text(ds["time"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Divider(
                                              thickness: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(ds["subjectTeacherName"], textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                                Text("Period ${ds["Period"]}", textAlign: TextAlign.start,style: const TextStyle(
                                                    wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                                ),),
                                              ],
                                            ),

                                          ],
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


                ]),
              ),
            ],
          ),


        );
      },

    );





    AppBar appBar = AppBar(
      backgroundColor: Mcolor,
      toolbarHeight: 70,
      title: const Text("Timetable", style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400
      ),),
    );







    return  DefaultTabController(
      length: 5,
      child:  Scaffold(
        bottomSheet:bottomSheet,
        // floatingActionButton: FloatingActionButton(onPressed: () async {
        //   await teacherAssignment.doc("TimeTable").collection(Class).add({
        //     "subject":"Math"
        //   });
        // },child: Icon(Icons.send),),
        appBar: appBar,
      ),

    );

  }
}

class TabAppBar extends StatelessWidget {
  TabAppBar({
    Key? key, required this.text,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 28,
        width: 150,

        child: Center(child: Text(text, style: const TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 16,
            fontStyle: FontStyle.italic
        ),)));
  }
}
