// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserDetails> userDetailsFromJson(String str) => List<UserDetails>.from(json.decode(str).map((x) => UserDetails.fromJson(x)));

String userDetailsToJson(List<UserDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetails {
  UserDetails({
    required this.userid,
    required this.empid,
    required this.name,
    required this.emailid,
    required this.dep,
    required this.profileurl,
  });

  final int userid;
  final int empid;
  final String name;
  final String emailid;
  final String dep;
  final String profileurl;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    userid: json["userid"],
    empid: json["empid"],
    name: json["name"],
    emailid: json["emailid"],
    dep: json["dep"],
    profileurl: json["profileurl"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "empid": empid,
    "name": name,
    "emailid": emailid,
    "dep": dep,
    "profileurl": profileurl,
  };
}

