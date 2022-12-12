import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoist/components/TaskListData.dart';
import 'package:todoist/objects/public.dart';

class completed_task extends StatefulWidget {
  @override
  State<completed_task> createState() => _completed_taskState();
}

class _completed_taskState extends State<completed_task> {
  List userList = [];
  late Timer time;

  StreamController streamcon = StreamController();

  @override
  void initState() {
    time = Timer.periodic(
        Duration(milliseconds: 500), (time) => sendEmpId('completed'));

    super.initState();
  }

  @override
  void dispose() {
    if (time.isActive) time.cancel();

    super.dispose();
  }

  Widget build(BuildContext context) { 
    if (userList.isEmpty) {
      return Scaffold(
          backgroundColor: const Color(0xff313642),
          body: Center(
              child: Text("No Tasks",
                  style: GoogleFonts.poppins(color: Colors.white))));
    }
    return Scaffold(
        backgroundColor: const Color(0xff313642),
        body: StreamBuilder(
            stream: streamcon.stream,
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: ((context, index) {
                    return TaskLsitData(
                        time: userList[index]['creation_time'] +
                            " - " +
                            userList[index]['completed_time'],
                        title: userList[index]['task_tittle']);
                  }));
            }));
  }

  sendEmpId(var status) async {
    var result = await http.post(
      Uri.parse('http://103.207.1.87:5001/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': '7925',
        'status': status,
      }),
    );
    if (result.statusCode == 200) {
      setState(() {
        userList = json.decode(result.body);
      });

      print(userList.toString());
      streamcon.add(userList);
    }

    // var res = json.decode(result.body);
  }
}
