// To parse this JSON data, do
//
//     final studentDetails = studentDetailsFromJson(jsonString);

import 'dart:convert';

class StudentDetails {
  StudentDetails({
    required this.admissionNo,
    required this.academic,
    required this.dateofAdmissiion,
    required this.parentEmail,
    required this.motherFullName,
    required this.fatherFullName,
    required this.accountEmail,
    required this.studentDetailsClass,
    required this.term,
    required this.firstName,
    required this.lastName,
    required this.passPort,
  });

  String admissionNo;
  String academic;
  String dateofAdmissiion;
  String parentEmail;
  String motherFullName;
  String fatherFullName;
  String accountEmail;
  String studentDetailsClass;
  String term;
  String firstName;
  String lastName;
  String passPort;

  factory StudentDetails.fromJson(Map<String, dynamic> json) => StudentDetails(
    admissionNo: json["Admission No"],
    academic: json["Academic"],
    dateofAdmissiion: json["DateofAdmissiion"],
    parentEmail: json["ParentEmail"],
    motherFullName: json["MotherFullName"],
    fatherFullName: json["FatherFullName"],
    accountEmail: json["AccountEmail"],
    studentDetailsClass: json["Class"],
    term: json["Term"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    passPort: json["PassPort"],
  );

  Map<String, dynamic> toJson() => {
    "Admission No": admissionNo,
    "Academic": academic,
    "DateofAdmissiion": dateofAdmissiion,
    "ParentEmail": parentEmail,
    "MotherFullName": motherFullName,
    "FatherFullName": fatherFullName,
    "AccountEmail": accountEmail,
    "Class": studentDetailsClass,
    "Term": term,
    "FirstName": firstName,
    "LastName": lastName,
    "PassPort": passPort,
  };
}
