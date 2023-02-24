
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lord_school/mvvm/view/AskDoubt.dart';
import 'package:lord_school/mvvm/view/StudentsDashboard.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';

import '../amountPage.dart';

class PaymentNow {
  paymentWithPaystack(
    BuildContext context,
    String secretKey,
    String customerEmail,
    String amount,
  ) {
    PayWithPayStack().now(
      context: context,
      paymentChannel:["mobile_money", "card"],
      secretKey: secretKey,
      customerEmail: customerEmail,
      reference: DateTime.now().millisecondsSinceEpoch.toString(),
      currency: "NGN",
      amount: amount,
      transactionCompleted: () {
        Get.to(StudentsDashboard());
      },
      transactionNotCompleted: () {
        Get.to(StudentsDashboard());

      },
    ).then((value) {
      Get.to(StudentsDashboard());

    });
  }
}
