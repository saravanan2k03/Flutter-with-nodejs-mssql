import 'package:flutter/material.dart';

const String userid = 'userid';
const String name = 'name';
const String emailid = 'emailid';
const String department = 'dep';
const String profileurl = 'profileurl';
const String empiduser = 'profileurl';

class UserModelSplitup1 {
  int memid, empid;
  String membername, email, dep, url;

  UserModelSplitup1({
    required this.memid,
    required this.empid,
    required this.membername,
    required this.email,
    required this.dep,
    required this.url,
  });

  factory UserModelSplitup1.fromJson(Map<String, dynamic> map) =>
      UserModelSplitup1(
        memid: int.parse(map[userid]),
        empid: int.parse(map[empiduser]),
        membername: map[name],
        email: map[emailid],
        dep: map[department],
        url: map[profileurl],
      );
}
