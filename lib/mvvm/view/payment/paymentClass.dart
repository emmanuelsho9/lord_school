
// To parse this JSON data, do
//
//     final studentDetails = studentDetailsFromJson(jsonString);

import 'dart:convert';

class PaymentClass {
  PaymentClass({
    required this.schoolFee,
    required this.nameofPrincpal,
    required this.nameofVisePrincpal,
    required this.nameofVisePrincpalTwo,

  });

  String schoolFee;
  String nameofPrincpal;
  String nameofVisePrincpal;
  String nameofVisePrincpalTwo;


  factory PaymentClass.fromJson(Map<String, dynamic> json) => PaymentClass(
    schoolFee: json["schoolFee"],
    nameofPrincpal: json["nameofPrincpal"],
    nameofVisePrincpal: json["nameofVisePrincpal"],
    nameofVisePrincpalTwo: json["nameofVisePrincpalTwo"],

  );

  Map<String, dynamic> toJson() => {
    "schoolFee": schoolFee,
    "nameofPrincpal": nameofPrincpal,
    "nameofVisePrincpal": nameofVisePrincpal,
    "nameofVisePrincpalTwo": nameofVisePrincpalTwo,

  };
}
