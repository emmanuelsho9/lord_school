import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../const/const.dart';

class SchoolGallery extends StatelessWidget {
  const SchoolGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //  bool arrow = true;

    BottomSheet bottomSheet =BottomSheet(
      enableDrag: false,
      onClosing: () {  }, backgroundColor: Mcolor,
      builder: (BuildContext context) {

        return StreamBuilder(
          stream: galleryAdmin.snapshots(),
          builder: (_,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            final data = snapshot.data!.docs.map((doc) => doc.data()).toList();
            final imageUrl = data[0]['img']; // assuming you want to access the first document
            if(!snapshot.hasData&&snapshot.connectionState==ConnectionState.waiting){
              return rolling;
            }else{
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: StaggeredGridView.countBuilder(crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0)
                      ),
                      child:
                      ClipRRect(child: Image.network(imageUrl, fit:  BoxFit.cover,)));
                }, staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven?1:2);
                },),
            );
          }}
        );


      },

    );








    AppBar appBar = AppBar(
      backgroundColor: Mcolor,
      toolbarHeight: 70,
      title: const Text("School Gallery", style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400
      ),),
    );






    return  Scaffold(
      body: Container(
        color: Mcolor,
      ),
      backgroundColor: Mcolor,
      bottomSheet: bottomSheet,
      appBar:appBar,
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   await galleryAdmin.add({
      //     "img":"ddd"
      //   });
      // },
      // child: Icon(Icons.send),),
    );
  }
}
