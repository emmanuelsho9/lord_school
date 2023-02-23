// To parse this JSON data, do
//
//     final studentDetails = studentDetailsFromJson(jsonString);

import 'dart:convert';

class TeacherDetails {
  TeacherDetails({
    required this.admissionNo,
    required this.academic,
    required this.dp,
    required this.dateofAdmissiion,
    required this.parentEmail,
    required this.motherFullName,
    required this.fatherFullName,
    required this.accountEmail,
    required this.StudentdateOfBirth,
    required this.Address,
    required this.studentDetailsClass,
    required this.term,
    required  this.attendaceCount,
    required  this.schoolLent,
    required this.firstName,
    required this.lastName,
    required this.passPort,
  });

  String admissionNo;
  String academic;
  String dateofAdmissiion;
  String parentEmail;
  String dp;
  String motherFullName;
  String fatherFullName;
  String accountEmail;
  String StudentdateOfBirth;
  String Address;
  String studentDetailsClass;
  String term;
  int attendaceCount;
  int schoolLent;
  String firstName;
  String lastName;
  String passPort;

  factory TeacherDetails.fromJson(Map<String, dynamic> json) => TeacherDetails(
    admissionNo: json["Admission No"],
    schoolLent: json["schoolLent"],
    dp: json["dp"],
    academic: json["Academic"],
    attendaceCount: json["attendaceCount"],
    StudentdateOfBirth: json["StudentdateOfBirth"],
    dateofAdmissiion: json["DateofAdmissiion"],
    parentEmail: json["ParentEmail"],
    Address: json["Address"],
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
    "dp": dp,
    "attendaceCount": attendaceCount,
    "schoolLent": schoolLent,
    "DateofAdmissiion": dateofAdmissiion,
    "StudentdateOfBirth": StudentdateOfBirth,
    "ParentEmail": parentEmail,
    "Address": Address,
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
