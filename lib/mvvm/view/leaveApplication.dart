import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lord_school/mvvm/const/const.dart';
import 'package:provider/provider.dart';


class LeaveApplication extends StatelessWidget {
  const LeaveApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    //  bool arrow = true;

    TextEditingController _writeDetails = TextEditingController();
    TextEditingController _title = TextEditingController();
    TextEditingController _classTeacher = TextEditingController();

    BottomSheet bottomSheet =BottomSheet(
      enableDrag: false,
      onClosing: () {  }, backgroundColor: Mcolor,
      builder: (BuildContext context) {
        return  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              const Gap(30),
              Row(
                children: const [
                  Text("Class Teacher", style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
              TextFormField(enabled: true,
                controller: _classTeacher,
                decoration: const InputDecoration(
                hintText: 'Martins Tope',

                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: false,),
              const Gap(30),
              Row(
                children: const [
                  Text("Application Title", style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
              TextFormField(enabled: true,
                controller: _title,
                decoration: const InputDecoration(
                hintText: 'Reason Title',

                ),
                keyboardType: TextInputType.text,
                obscureText: false,),
              const Gap(30),
              Row(
                children: const [
                  Text("Description", style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
              TextFormField(
                enabled: true,
                controller: _writeDetails,
                decoration: const InputDecoration(

                hintText: 'Write your reasons in details',
                ),
                keyboardType: TextInputType.text,
                obscureText: false,),

              const Gap(30),

              InkWell(
                  onTap: () async {
                   await leaveApplicationAdmin.add({
                     "ClassTeacher":_classTeacher.text.trim(),
                     "title":_title.text.trim(),
                     "Description":_writeDetails.text.trim()
                   });
                  },
                  child: BtnLogin(text: 'SEND REQUEST', )),


            ],
          ),


        );
      },

    );









    AppBar appBar = AppBar(
      backgroundColor: Mcolor,
      toolbarHeight: 70,
      title: const Text("Leave Application", style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400
      ),),
    );






    return  DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Container(
          color: Mcolor,
        ),
        backgroundColor: Mcolor,
        bottomSheet: bottomSheet,
        appBar:appBar,
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

        child: Center(child: Text(text, style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 16,
            fontStyle: FontStyle.italic
        ),)));
  }
}
