import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lord_school/mvvm/view/StudentsDashboard.dart';

import '../const/const.dart';
import '../viewModel/Auth.dart';
import 'ScreenWidget/SignUp.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool IsVisible = true;

  final _keyForm = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Mcolor,
          elevation: 0,
        ),
        backgroundColor: Mcolor,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                height: size.height * 0.4,
                padding: const EdgeInsets.only(left: 16, right: 16),
                color: Mcolor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hi Student",
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                          Text(
                            "Sign in to continue",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                height: size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Form(
                        key: _keyForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Check your email well";
                                }
                                return null;
                              },
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  hintText: "Enter your Email"),
                            ),
                            const Gap(35),
                            const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            StatefulBuilder(
                              builder: (context, setState) => TextFormField(
                                obscureText: IsVisible,
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    hintText: "Enter your Password",
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          IsVisible == true
                                              ? IsVisible = false
                                              : IsVisible = true;
                                          setState(() {});
                                        },
                                        icon: Icon(IsVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                              ),
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            const Gap(35),
                            InkWell(
                                onTap: () async {
                                 try{
                                   IsVisible=false;
                                   setState(() {

                                   });
                                   await AuthLord().login(email: _emailController.text, password: _passwordController.text);
                                   IsVisible=true;
                                   setState(() {

                                   });
                                 }catch(e){
                                   IsVisible=true;
                                   setState(() {

                                   Get.snackbar("Error", "$e".replaceAll("firebase_auth/wrong-password", "Hi user"));
                                   });
                                   print(e);
                                 }
                                 },
                                child: IsVisible == false
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        backgroundColor: Mcolor,
                                        color: Colors.white,
                                      ))
                                    : BtnLogin(
                                        text: 'Sign In',
                                      )),
                            const Gap(10),
                            Container(
                              child: InkWell(
                                onTap: () => Get.off(SignUp()),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Dont Have an Account?  ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

}
