
import 'dart:convert';

UserModelSplitup welcomeFromJson(String str) => UserModelSplitup.fromJson(json.decode(str));

String welcomeToJson(UserModelSplitup data) => json.encode(data.toJson());

class UserModelSplitup {
  UserModelSplitup({
    required this.userid,
    required this.username,
    required this.url,
    required this.taskname,
    required this.empid,


  });

  String userid;
  String username;
  String url;
  String taskname;
  String empid;



  factory UserModelSplitup.fromJson(Map<String, dynamic> userdata) =>
      UserModelSplitup(
    userid: userdata["userid"],
    username: userdata["username"],
    url: userdata["url"],
    taskname: userdata["taskname"],
    empid:userdata["empid"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "username": username,
    "url": url,
    "taskname": taskname,
    "empid":empid,

  };
}
