import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todoist/mainpage.dart';
import 'package:todoist/screen/Signin.dart';
import 'package:todoist/screen/Signup.dart';
import 'package:todoist/screen/TaskList.dart';
import 'package:todoist/screen/Todoist.dart';
import 'package:todoist/screen/profile.dart';
import 'package:todoist/screen/todays_task.dart';

import '../screen/Task_details.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  @override
  int _page = 0;
  final screen = [
    mainpage(),
    TaskListScreen(),
    CreateTaskScreen(),
    // Details(),
    today_task(),
    profile(),
  ];
  final items = <Widget>[
    // ignore: prefer_const_constructors
    Icon(
      Icons.home,
      size: 30,
    ),
    // ignore: prefer_const_constructors
    Icon(
      Icons.text_snippet_rounded,
      size: 30,
    ),
    // ignore: prefer_const_constructors
    Icon(
      Icons.add_box_rounded,
      size: 30,
    ),
    // ignore: prefer_const_constructors
    Icon(
      Icons.align_vertical_bottom_sharp,
      size: 30,
    ),
    // ignore: prefer_const_constructors
    Icon(
      Icons.person,
      size: 30,
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_page],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 12, 1, 1)),
        ),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          items: items,
          buttonBackgroundColor: Color(0xffFF7360),
          backgroundColor: Color(0xff3E4553),
          height: 55,
          index: 0,
          onTap: (index) {
            setState(
              () {
                _page = index;
              },
            );
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
