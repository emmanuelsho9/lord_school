import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lord_school/mvvm/const/const.dart';



class Assignment extends StatelessWidget {
   Assignment({Key? key, required this.Class}) : super(key: key);
  String Class;

  @override
  Widget build(BuildContext context) {
print(Class);
    var appBar =AppBar(
      backgroundColor: Mcolor,
      title: Text("Attendance"),
      elevation: 0,

    );

    return  Scaffold(
      backgroundColor: Mcolor,
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //  await teacherAssignment.doc("Assignment").collection(Class).add({
      //    "subject":"Math"
      //  });
      // },child: Icon(Icons.send),),
      body:
      Container(
        child: Column(
          children: [
            appBar,

            Flexible(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: StreamBuilder(
                  stream: teacherAssignment.doc("Assignment").collection(Class).snapshots(),
                  builder: (_,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      snapshot) {
                    if (!snapshot.hasData && snapshot.connectionState==ConnectionState.waiting) {
                      return rolling;
                    } else {
                      return ListView.builder(

                        //  physics: new NeverScrollableScrollPhysics(),
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
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFE6EFFF),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Text(ds["subject"], textAlign: TextAlign.start,style: const TextStyle(
                                              wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                          ),),
                                        ),
                                        const   Gap(10),
                                        Text(ds["topic"], textAlign: TextAlign.start,style: const TextStyle(
                                            wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                        ),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Assign Date", textAlign: TextAlign.start,style: TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Text(ds["AssignDate"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const  Text("Last Submission Date", textAlign: TextAlign.start,style: TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                            Text(ds["LastSubmissionDate"], textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.black
                                            ),),
                                          ],
                                        ),
                                        const Gap(10),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height*0.05,
                                          decoration: BoxDecoration(
                                              color: Mcolor,
                                              borderRadius: const BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Center(
                                            child: Text("${ds["Whattodo"]}".toUpperCase(), textAlign: TextAlign.start,style: const TextStyle(
                                                wordSpacing: 0.4,height: 1.5, fontSize: 14, color: Colors.white
                                            ),),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                        },
                      );
                    }
                  },
                ),
              ),
            ),        ],
        ),
      ),
    );
  }
}