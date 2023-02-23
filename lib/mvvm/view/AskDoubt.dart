import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lord_school/mvvm/const/const.dart';
import 'package:provider/provider.dart';

import '../viewModel/Auth.dart';


class AskDoubt extends StatelessWidget {
  const AskDoubt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final helperProvider = Provider.of<HelperProvider>(context, listen: false);
    // final feeDueList = helperProvider.monClass;

  //  bool arrow = true;

    TextEditingController _teacherNameController = TextEditingController();
    TextEditingController _titleNameController = TextEditingController();
    TextEditingController _subjectNameController = TextEditingController();
    TextEditingController _discriptionNameController = TextEditingController();

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
          child: SingleChildScrollView(
            child: Column(
                  children: [
                    const Gap(30),
                    Row(
                      children: const [
                        Text("Teacher", style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    TextFormField(
                      controller: _teacherNameController,
                      decoration: const InputDecoration(
                      hintText: 'Mrs Dada Awuru',

                      icon: Icon(Icons.keyboard_arrow_down),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,),
                    const Gap(30),
                    Row(
                      children: const [
                        Text("Subject", style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    TextFormField(enabled: true,
                      controller:_subjectNameController,
                      decoration:const InputDecoration(
                      hintText: 'Math',
                      icon: Icon(Icons.keyboard_arrow_down),

                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,),
                    const Gap(30),
                    Row(
                      children: const [
                        Text("Title", style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    TextFormField(
                      controller:_titleNameController,
                      decoration: const InputDecoration(
                      hintText: 'Factoring a sum or difference of two cubes',
                      icon: Icon(Icons.keyboard_arrow_down),

                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,),
                    const Gap(30),
                    Row(
                      children: const [
                        Text("Doubt Description", style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    TextFormField(
        controller: _discriptionNameController,
                      enabled: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.keyboard_arrow_down),

                      hintText: '--',
                      ),

                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,),
                    const Gap(30),

                    InkWell(
                        onTap: () async {
                          if(_teacherNameController.text.isEmpty&&_discriptionNameController.text.isEmpty&&_titleNameController.text.isEmpty&&_subjectNameController.text.isEmpty){
                            Get.snackbar("Empty", "Enter all the form");
                          }else{

                         await AuthLord().askAbout(teacherSubject: _teacherNameController.text.trim(), Subject: _subjectNameController.text.trim(), title: _titleNameController.text.trim(), desctiption: _discriptionNameController.text.trim());
                          }
                        },
                        child: BtnLogin(text: 'SEND',)),


                  ],
                ),
          ),


        );
      },

    );









    AppBar appBar = AppBar(
      backgroundColor: Mcolor,
      toolbarHeight: 70,
      title: const Text("Ask Doubt", style: TextStyle(
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
