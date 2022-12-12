import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoist/components/TaskListData.dart';
import 'package:http/http.dart' as http;
import 'package:todoist/screen/completed_task.dart';
import 'package:todoist/screen/pending_task.dart';
import 'package:todoist/screen/submitted_task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreen();
}

class _TaskListScreen extends State<TaskListScreen> {
  @override
  List userList = [];
  // getUserDetails() async {
  //   try {
  //     final http.Response response = await http.post(
  //       Uri.parse('http://103.207.1.87:7777/tasks'),
  //     );
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         userList = json.decode(response.body);
  //         print(userList);
  //       });
  //     }
  //     //print(userList.length);
  //   } catch (e) {
  //     print("error ${e}");
  //   }
  //}

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xff313642),
              title: Text("My all task list",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.white)),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                )
              ],
            ),
            backgroundColor: const Color(0xff313642),
            body: Column(
              children: [
                TabBar(
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  labelColor: const Color(0xffFF7360),
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  indicatorColor: const Color(0xffFF7360),
                  tabs: const [
                    Tab(
                      text: "Submitted Task",
                      icon: Icon(Icons.run_circle, color: Colors.white),
                    ),
                    Tab(
                      text: "Pending Task",
                      icon: Icon(Icons.pending_actions, color: Colors.white),
                    ),
                    Tab(
                      text: "Completed",
                      icon: Icon(Icons.done, color: Colors.white),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        submitted_task(),
                        pending_task(),
                        completed_task()
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
