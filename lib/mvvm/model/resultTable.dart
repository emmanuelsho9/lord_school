import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lord_school/mvvm/const/const.dart';

class MyTable extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> subjectsRef =
  FirebaseFirestore.instance.collection('subjects').doc("check").collection("test");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: subjectsRef.snapshots(),
          builder: (_,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: rolling,
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: rolling,
              );
            }

            List<Map<String, dynamic>> data =
            snapshot.data!.docs.map((doc) => doc.data()).toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text('Subject'),
                          tooltip: 'Subject',
                        ),
                        DataColumn(
                          label: Text('Score'),
                          tooltip: 'Score Percentage',
                        ),
                        DataColumn(

                          label: Text('Grade'),
                          tooltip: 'Grade in Flutter and Dart',
                        ),
                      ],
                      rows: data.map((subjectData) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(subjectData['subject'])),
                            DataCell(Text('${subjectData['score']}')),
                            DataCell(Text(subjectData['grade'])),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
