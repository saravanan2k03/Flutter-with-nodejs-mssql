// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_final_fields, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Details extends StatefulWidget {
  String sendtaskid = "";

  Details(this.sendtaskid, {super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String date = "";
  String tittle = "";
  String deadlinetime = "";
  String category = "";
  String description = "";
  List<dynamic> parsedList = [];
  List<dynamic> userdetails = [];
  List<dynamic> commentdata = [];

  StreamController _streamController = StreamController();
  StreamController _commentController = StreamController();
  TextEditingController commenttext = TextEditingController();
  var todayDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  var todaytime = DateFormat('hh:mm a').format(DateTime.now());
  late Timer _timer;
  bool checkmark = true;
  bool prioritycheck = false;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) => datas());
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) => data());
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) => comment());

    // print(parsedList.length);
    // print(userdetails.length);
    print("working kaipula");
    print(widget.sendtaskid);

    // print(parsedList[0]['complete_by_date']);
    super.initState();
  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }

  datas() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.87:5001/taskusers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'usertaskid': widget.sendtaskid,
          },
        ),
      );
      if (res.statusCode == 200) {
        if (mounted) {
          setState(() {
            parsedList = json.decode(res.body);
            _streamController.add(parsedList);

            // print(parsedList);
          });
        }
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  check() {
    var commentdat = DateTime.now();
    // print("commentdat:$commentdat");
    var todayDate = DateFormat("dd-MM-yyyy").format(commentdat);
    var todaytime = DateFormat('hh:mm a').format(commentdat);
    // print("todayDate:$todayDate");
    // print("todaytime:$todaytime");
  }

  setdata() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.87:5001/commentadd'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'comment': commenttext.text,
            'emp_id': "7925",
            'task_id': widget.sendtaskid,
            'commentdate': todayDate,
            'commenttime': todaytime
          },
        ),
      );
      if (res.statusCode == 200) {
        if (jsonDecode(res.body).toString() != '0') {
        } else {
          print('error: ${jsonDecode(res.body).toString()}');
        }
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  comment() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.87:5001/taskcomment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'usertaskcomment': widget.sendtaskid,
          },
        ),
      );
      if (res.statusCode == 200) {
        if (mounted) {
          setState(() {
            commentdata = json.decode(res.body);
            _commentController.add(commentdata);
            // print("welcome to the great karikalan magic show");
            // print(commentdata);
          });
        }
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  priority() {
    var currentUser = "7925";
    var storUser = "7925";
    if (currentUser == storUser) {
      setState(() {
        prioritycheck = true;
      });
    }
  }

  data() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.87:5001/taskdata'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'usertaskdata': widget.sendtaskid,
          },
        ),
      );
      if (res.statusCode == 200) {
        if (mounted) {
          setState(() {
            userdetails = json.decode(res.body);
            // print(userdetails);
            // print(userdetails[0]['complete_by_date']);
            // print(userdetails[0]['task_tittle']);
            // print(userdetails[0]['completed_time']);
            setState(() {
              date = userdetails[0]['complete_by_date'];
              tittle = userdetails[0]['task_tittle'];
              deadlinetime = userdetails[0]['completed_time'];
              category = userdetails[0]['tag_text'];
              description = userdetails[0]['description'];
              // print("data:$date");
              // print("tittle:$tittle");
              // print("time:$deadlinetime");
              // print("tag_text:$category");
              // print("not working");
              // print("welcome to the great karikalan magic show");

              // print("description:$description");
            });
          });
        }
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff313642),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "Task Details",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          // the method which is called
          // when button is pressed
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHkfW4BpXd96aaS9RgOOvPS77qMW6duSbw1I-DU5x8Jv7fQ2nesErRqO9&s"),
              backgroundColor: Color.fromARGB(255, 80, 126, 255),
              radius: 17,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "$tittle",
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              "For $category",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffFF7360),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 05, top: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.40,
                    // color: Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircularPercentIndicator(
                            radius: 40,
                            lineWidth: 10,
                            percent: 0.4,
                            progressColor: Color(0xffFF7360),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              '40%',
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Color(0xff3E4553),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: Color.fromARGB(255, 2, 120, 255),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "Deadline Date",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 192, 190, 190)),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$date",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Color(0xff3E4553),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 8),
                        child: Icon(
                          Icons.calendar_month_outlined,
                          color: Color.fromARGB(255, 255, 42, 42),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Deadline Time",
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 192, 190, 190)),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "$deadlinetime",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Container(
                    child: Text("Attachments",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF7360))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, top: 10),
                  child: Container(
                    child: Text("See all",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.86,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          height: 65,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    width: MediaQuery.of(context).size.width *
                                        0.86,
                                    decoration: BoxDecoration(
                                        color: Color(0xff3E4553),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 05),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.20,
                                            child: FittedBox(
                                              child: Icon(
                                                Icons.picture_as_pdf_rounded,
                                                color: Color.fromARGB(
                                                    255, 255, 42, 42),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.60,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text("Saravanan.pdf",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text("Team Member",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFF7360))),
                )
              ],
            ),
            StreamBuilder(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: parsedList.length,
                    padding: EdgeInsets.only(right: 16, left: 16),
                    itemBuilder: (context, index) {
                      List userview = parsedList;
                      var profile = userview[index]['profileurl'];
                      var username = userview[index]['name'];
                      var process = userview[index]['process'];
                      print("process" + process);
                      if (process == 'process') {
                        checkmark = false;
                      } else {
                        checkmark = true;
                      }
                      // print(userview[index]['profileurl']);
                      if (userview[index]['profileurl'] == null) {
                        setState(() {
                          userview[index]['profileurl'] =
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHkfW4BpXd96aaS9RgOOvPS77qMW6duSbw1I-DU5x8Jv7fQ2nesErRqO9&s";
                        });
                      }
                      ;
                      return Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              color: Color(0xff3E4553),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 05),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  child: FittedBox(
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          profile.toString().trim()),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.40,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text("$username",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: checkmark
                                        ? Icon(
                                            Icons.check,
                                            color: Color.fromARGB(
                                                255, 255, 42, 42),
                                          )
                                        : Icon(
                                            Icons.close,
                                            color: Color.fromARGB(
                                                255, 255, 42, 42),
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text("Description",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFF7360))),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 20),
              child: Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(description.toString().trim(),
                      style: GoogleFonts.adamina(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Color(0xff3E4553),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF7360),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Reassign",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                ),
                // completebtn
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF7360),
                      ),
                      onPressed: () {
                        check();
                      },
                      child: Text(
                        "Completed",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            StreamBuilder(
                stream: _commentController.stream,
                builder: (context, snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: commentdata.length,
                    padding: EdgeInsets.only(right: 16, left: 16),
                    itemBuilder: (context, index) {
                      List taskcomment = commentdata;
                      return Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              color: Color(0xff3E4553),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 05),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.23,
                                      child: FittedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                taskcomment[index]['profileurl']
                                                    .toString()
                                                    .trim()),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          taskcomment[index]['comment']
                                              .toString()
                                              .trim(),
                                          style: GoogleFonts.varelaRound(
                                              fontSize: 14,
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 03),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffFF7360),
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: Text(taskcomment[index]['date']
                                              .toString() +
                                          "/" +
                                          taskcomment[index]['time']
                                              .toString()),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 8.0),
                        Icon(Icons.insert_emoticon,
                            size: 30.0, color: Theme.of(context).hintColor),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            controller: commenttext,
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () async {
                        //     // final result =
                        //     //     await FilePicker.platform.pickFiles();
                        //     // if (result == null) return;

                        //     // final file = result.files.first;
                        //     // openFile(file);
                        //   },
                        //   child: Icon(Icons.attach_file,
                        //       size: 30.0, color: Theme.of(context).hintColor),
                        // ),
                        SizedBox(width: 8.0),
                        InkWell(
                            onTap: () {
                              setdata();
                              print(commenttext.text);
                              commenttext.clear();
                            },
                            child: Icon(Icons.send,
                                size: 30.0, color: Color(0xffFF7360))),
                        SizedBox(width: 8.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}



// void openFile(PlatformFile file) {}
