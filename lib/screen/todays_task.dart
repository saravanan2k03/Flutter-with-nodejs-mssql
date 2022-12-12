import 'dart:math';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class today_task extends StatefulWidget {
  const today_task({Key? key}) : super(key: key);

  @override
  _today_taskState createState() => _today_taskState();
}

class _today_taskState extends State<today_task> {
  DatePickerController _controller = DatePickerController();

  DateTime pickedDate = DateTime.now();

  @override
  void initState() {
    custom_calendar(pickedDate);
    select_month(pickedDate);
    // TODO: implement initState
    super.initState();
  }

  String Selected_dateline = "";
  List day_date = [];
  List days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List ans = [];
  var selected_month;
  select_month(DateTime date) {
    setState(() {
      ans = [];
      selected_month = month[date.month - 1];
      ans.add(selected_month);
      ans.add(date.toString().substring(0, 4));
    });
  }

  custom_calendar(DateTime date) {
    setState(() {
      day_date = [];

      day_date.add([
        date.subtract(Duration(days: 15)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 15)).weekday - 1],
        date.subtract(Duration(days: 15))
      ]);
      day_date.add([
        date.subtract(Duration(days: 14)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 14)).weekday - 1],
        date.subtract(Duration(days: 14))
      ]);
      day_date.add([
        date.subtract(Duration(days: 13)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 13)).weekday - 1],
        date.subtract(Duration(days: 13))
      ]);
      day_date.add([
        date.subtract(Duration(days: 12)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 12)).weekday - 1],
        date.subtract(Duration(days: 12))
      ]);
      day_date.add([
        date.subtract(Duration(days: 11)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 11)).weekday - 1],
        date.subtract(Duration(days: 11))
      ]);
      day_date.add([
        date.subtract(Duration(days: 10)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 10)).weekday - 1],
        date.subtract(Duration(days: 10))
      ]);
      day_date.add([
        date.subtract(Duration(days: 9)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 9)).weekday - 1],
        date.subtract(Duration(days: 9))
      ]);
      day_date.add([
        date.subtract(Duration(days: 8)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 8)).weekday - 1],
        date.subtract(Duration(days: 8))
      ]);
      day_date.add([
        date.subtract(Duration(days: 7)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 7)).weekday - 1],
        date.subtract(Duration(days: 7))
      ]);
      day_date.add([
        date.subtract(Duration(days: 6)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 6)).weekday - 1],
        date.subtract(Duration(days: 6))
      ]);
      day_date.add([
        date.subtract(Duration(days: 5)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 5)).weekday - 1],
        date.subtract(Duration(days: 5))
      ]);
      day_date.add([
        date.subtract(Duration(days: 4)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 4)).weekday - 1],
        date.subtract(Duration(days: 4))
      ]);
      day_date.add([
        date.subtract(Duration(days: 3)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 3)).weekday - 1],
        date.subtract(Duration(days: 3))
      ]);
      day_date.add([
        date.subtract(Duration(days: 2)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 2)).weekday - 1],
        date.subtract(Duration(days: 2))
      ]);
      day_date.add([
        date.subtract(Duration(days: 1)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 1)).weekday - 1],
        date.subtract(Duration(days: 1))
      ]);
      day_date.add([
        date.subtract(Duration(days: 0)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 0)).weekday - 1],
        date.subtract(Duration(days: 0))
      ]);
      day_date.add([
        date.add(Duration(days: 1)).toString().substring(8, 10),
        days[date.add(Duration(days: 1)).weekday - 1],
        date.add(Duration(days: 1))
      ]);
      day_date.add([
        date.add(Duration(days: 2)).toString().substring(8, 10),
        days[date.add(Duration(days: 2)).weekday - 1],
        date.add(Duration(days: 2))
      ]);
      day_date.add([
        date.add(Duration(days: 3)).toString().substring(8, 10),
        days[date.add(Duration(days: 3)).weekday - 1],
        date.add(Duration(days: 3))
      ]);
      day_date.add([
        date.add(Duration(days: 4)).toString().substring(8, 10),
        days[date.add(Duration(days: 4)).weekday - 1],
        date.add(Duration(days: 4))
      ]);
      day_date.add([
        date.add(Duration(days: 5)).toString().substring(8, 10),
        days[date.add(Duration(days: 5)).weekday - 1],
        date.add(Duration(days: 5))
      ]);
      day_date.add([
        date.add(Duration(days: 6)).toString().substring(8, 10),
        days[date.add(Duration(days: 6)).weekday - 1],
        date.add(Duration(days: 6))
      ]);
      day_date.add([
        date.add(Duration(days: 7)).toString().substring(8, 10),
        days[date.add(Duration(days: 7)).weekday - 1],
        date.add(Duration(days: 7))
      ]);
      day_date.add([
        date.add(Duration(days: 8)).toString().substring(8, 10),
        days[date.add(Duration(days: 8)).weekday - 1],
        date.add(Duration(days: 8))
      ]);
      day_date.add([
        date.add(Duration(days: 9)).toString().substring(8, 10),
        days[date.add(Duration(days: 9)).weekday - 1],
        date.add(Duration(days: 9))
      ]);
      day_date.add([
        date.add(Duration(days: 10)).toString().substring(8, 10),
        days[date.add(Duration(days: 10)).weekday - 1],
        date.add(Duration(days: 10))
      ]);
      day_date.add([
        date.add(Duration(days: 11)).toString().substring(8, 10),
        days[date.add(Duration(days: 11)).weekday - 1],
        date.add(Duration(days: 11))
      ]);
      day_date.add([
        date.add(Duration(days: 12)).toString().substring(8, 10),
        days[date.add(Duration(days: 12)).weekday - 1],
        date.add(Duration(days: 12))
      ]);
      day_date.add([
        date.add(Duration(days: 13)).toString().substring(8, 10),
        days[date.add(Duration(days: 13)).weekday - 1],
        date.add(Duration(days: 13))
      ]);
      day_date.add([
        date.add(Duration(days: 14)).toString().substring(8, 10),
        days[date.add(Duration(days: 14)).weekday - 1],
        date.add(Duration(days: 14))
      ]);
      day_date.add([
        date.add(Duration(days: 15)).toString().substring(8, 10),
        days[date.add(Duration(days: 15)).weekday - 1],
        date.add(Duration(days: 15))
      ]);

      /*result.add([
        date.subtract(Duration(days: 2)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 2)).weekday - 1]
      ]);
      result.add([
        date.subtract(Duration(days: 1)).toString().substring(8, 10),
        days[date.subtract(Duration(days: 1)).weekday - 1]
      ]);
      result.add([
        date.add(Duration(days: 0)).toString().substring(8, 10),
        days[date.add(Duration(days: 0)).weekday - 1]
      ]);
      result.add([
        date.add(Duration(days: 1)).toString().substring(8, 10),
        days[date.add(Duration(days: 1)).weekday - 1]
      ]);
      result.add([
        date.add(Duration(days: 2)).toString().substring(8, 10),
        days[date.add(Duration(days: 2)).weekday - 1]
      ]);
      result.add([
        date.add(Duration(days: 3)).toString().substring(8, 10),
        days[date.add(Duration(days: 3)).weekday - 1]
      ]);*/
      //print(day_date);
    });
  }

  scroll_picker(String day, String date, DateTime dateTime) {
    late bool isTrue;

    dateTime.toString().substring(0, 10) ==
            pickedDate.toString().substring(0, 10)
        ? isTrue = false
        : isTrue = true;

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            pickedDate = dateTime;
            scrollController.animateTo(1030,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
            select_month(pickedDate);
            print("sens $selected_month");
            print(isTrue);
            isTrue = false;
            custom_calendar(pickedDate);
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: isTrue ? Colors.grey.shade300 : Colors.lightGreen,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isTrue ? Colors.black : Colors.white,
                  ),
                ),
                Text(
                  day,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isTrue ? Colors.black : Colors.white,
                      fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  tile(String time, String img, String content) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey.shade700),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(img),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        content,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                color: Colors.lightGreen,
              )),
          Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(img),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        content,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                color: Colors.lightGreen,
              )),
        ],
      ),
    );
  }

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1030, // or whatever offset you wish
    keepScrollOffset: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 40,
                  right: MediaQuery.of(context).size.width / 05.5),
              child: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 30,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 50),
                child: Text(
                  "Todays Task",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 0,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 50,
                  left: MediaQuery.of(context).size.width / 05.5),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1047051/pexels-photo-1047051.jpeg?auto=compress&cs=tinysrgb&w=600"),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 15, right: MediaQuery.of(context).size.width / 30, left: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ans[0],
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.black87,
                                letterSpacing: 0,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ans[1],
                          style: GoogleFonts.abel(
                            textStyle: TextStyle(
                                color: Colors.black87,
                                letterSpacing: 0,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 6.5),
                      child: Row(
                        children: [
                          Text("10"),
                          SizedBox(
                            width: 03,
                          ),
                          Text("task"),
                          SizedBox(
                            width: 03,
                          ),
                          Text("today"),
                        ],
                      ),
                    ),
                  ],
                ),
                //Text(result.toString()),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 40,
                            color: Color(0Xff92c263),
                            spreadRadius: 0)
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 27,
                      child: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      backgroundColor: Color(0Xff92c263),
                    ),
                  ),
                  onTap: () async {
                    var pickedDate_ = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));
                    if (pickedDate_ != null) {
                      setState(() {
                        scrollController.animateTo(900,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease);
                        pickedDate = pickedDate_;
                      });
                      custom_calendar(pickedDate_);
                      select_month(pickedDate_);
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 85,
              //color: Colors.orange,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  itemCount: day_date.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: scroll_picker(day_date[index][0],
                            day_date[index][1], day_date[index][2]));
                  }),
            ),
            Divider(
              color: Colors.black87,
            ),
            Expanded(
              child: SingleChildScrollView(
                //scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    tile(
                        "9:00",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHkfW4BpXd96aaS9RgOOvPS77qMW6duSbw1I-DU5x8Jv7fQ2nesErRqO9&s",
                        "Workshop"),
                    tile(
                        "11:00",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5e-12p_eO9bO_ElzWNd00Av04n9RkafQ7SQ&usqp=CAU",
                        "Assignment"),
                    tile(
                        "13:30",
                        "https://hollywoodlife.com/wp-content/uploads/2013/05/tom-hardy-bio-photo1.jpg?w=620",
                        "Cycle Test"),
                    tile(
                        "15:45",
                        "https://www.mrdustbin.com/en/wp-content/uploads/2021/05/johnny-depp.jpg",
                        "Culturals"),
                    tile(
                        "17:15",
                        "https://i.pinimg.com/originals/dd/4c/bb/dd4cbb7af5b14e2a4e3ddab930b12ada.jpg",
                        "Symposium"),
                    tile(
                        "18:50",
                        "https://c4.wallpaperflare.com/wallpaper/601/305/165/brad-pitt-actor-man-smile-celebrity-hollywood-wallpaper-preview.jpg",
                        "Industrial Visit"),
                    tile(
                        "19:50",
                        "https://www.mrdustbin.com/en/wp-content/uploads/2021/05/dwayne-johnson.jpg",
                        "Industrial Visit"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /* day_line() {
    return Container(
      height: 50,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                Selected_dateline = index.toString();
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [],
              ),
            ),
          );
        },
        itemCount: result.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }*/
}
