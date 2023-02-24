import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lord_school/mvvm/view/payment/paymentscreen.dart';

import '../../Admin/adminClassModel.dart';
import '../const/const.dart';
import 'payment/paymentClass.dart';

class AmountPage extends StatefulWidget {
  AmountPage({ required this.email});
  String email;
  @override
  _AmountPageState createState() => _AmountPageState(emailPaymemt: email);
}

class _AmountPageState extends State<AmountPage> {
  var _additionalPricesRef = "";
  _AmountPageState({required this.emailPaymemt});
  String emailPaymemt;

  static Future<PaymentClass> Payment()async{
    final snaphot =await paymentSchoolFee.withConverter(fromFirestore: (snapshot, options) {
      if(!snapshot.exists) return null;
      return PaymentClass.fromJson(snapshot.data()!);
    }, toFirestore: (value, options) => value!.toJson(),).get();
    return snaphot.data()!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await paymentOption.add({
          "title":"school uniform",
          "value":2
        }).then((value) {
          var paymet = PaymentClass(schoolFee: "80000", nameofPrincpal: "nameofPrincpal", nameofVisePrincpal: "nameofVisePrincpal", nameofVisePrincpalTwo: "nameofVisePrincpalTwo");
          paymentSchoolFee.set(paymet.toJson());
        });


      },child: const Icon(Icons.send),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<PaymentClass>(
                future: Payment(),
                builder: (context, snapshot) {

                  if(snapshot.hasError||snapshot.connectionState==ConnectionState.waiting){
                    return rolling;
                  }else{
                    var payment = snapshot.data!;
                    _additionalPricesRef = payment.schoolFee;
                    return Center(
                      child: Text("N ${_additionalPricesRef}"),
                    );
                  }
                }
            ),
           const Gap(10),
            InkWell(
                onTap: () {
                  print(_additionalPricesRef);
                  PaymentNow().paymentWithPaystack(context, "sk_test_ff4d52a2da991f6696a96193d79020aacac6e4de", emailPaymemt, "${_additionalPricesRef}00");

                },
                child: BtnLogin(text: "Pay Now"))
          ],
        ),
      ),
    );
  }
}
