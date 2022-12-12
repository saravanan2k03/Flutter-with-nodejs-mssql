// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, prefer_final_fields, use_function_type_syntax_for_parameters, avoid_print, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, camel_case_types

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:todoist/screen/Task_details.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  List<dynamic> parsedList = [];
  List<dynamic> saro = [];
  List<dynamic> profiledatateam = [];
  List<dynamic> profiletaskidsumma = [];
  List<dynamic> profile = [];

  StreamController _streamController = StreamController();
  StreamController _streamControl = StreamController();
  String sendtaskid = "";
  String dates = "";

  late Timer _timer;
  getdata() async {
    try {
      final http.Response response = await http.post(
        Uri.parse('http://103.207.1.87:5001/show'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'userpanda': "7925",
          },
        ),
      );
      if (response.statusCode == 200) {
        parsedList = json.decode(response.body);
        _streamController.add(parsedList);
      }

      // print(parsedList.length);
      // print(parsedList);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) => getdata());
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) => data());
    _timer =
        Timer.periodic(const Duration(seconds: 1), (timer) => getteammember());

    // print(parsedList.length);
    Timer.periodic(const Duration(seconds: 1), (timer) => getteam());

    super.initState();
  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }

  data() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.87:5001/category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'user': "7925",
          },
        ),
      );
      if (res.statusCode == 200) {
        setState(() {
          saro = json.decode(res.body);
          _streamControl.add(saro);
          // print(saro);
          // print("working");
        });
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  getteam() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.87:5001/taskteammember'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'user': "7925",
          },
        ),
      );
      if (res.statusCode == 200) {
        setState(() {
          profiletaskidsumma.clear();
          profiledatateam = json.decode(res.body);
          // _streamControl.add( saro);
          profiledatateam.forEach((element) {
            profiletaskidsumma.add(element['task_id']);
          });

          print("profiletaskidsumma:$profiletaskidsumma");
          // print("working");
        });
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  getteammember() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.87:5001/taskteammemberdetails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, List>{
            "user": profiletaskidsumma,
          },
        ),
      );
      if (res.statusCode == 200) {
        setState(() {
          profile = json.decode(res.body);
          print("summa:$profile");
          print(profile.length);
        });
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

//  date stream
  check(String data) {
    var assigndate = data;

    var year = assigndate[6] + assigndate[7] + assigndate[8] + assigndate[9];
    var month = assigndate[3] + assigndate[4];
    var senddate = assigndate[0] + assigndate[1];

    // print("month: " + month);
    // print("year: $year");
    // print("date:$senddate");
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

    final mydate =
        DateTime(int.parse(year), int.parse(month), int.parse(senddate));
    final date2 = DateTime.now();
    final difference = daysBetween(date2, mydate);
    // print("final");
    var summa = "d";
    String values = difference.toString();
    // print(values + summa);
    dates = values + summa;
    if (values.contains("-")) {
      dates = "0d";
    }
  }

  String heading = "";
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi saravanan",
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.red),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Color.fromARGB(255, 36, 114, 230),
        //   ),
        //   // the method which is called
        //   // when button is pressed
        //   onPressed: () {},
        // ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(right: 10),
            // ignore: prefer_const_constructors
            child: CircleAvatar(
              // ignore: prefer_const_constructors
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdHkfW4BpXd96aaS9RgOOvPS77qMW6duSbw1I-DU5x8Jv7fQ2nesErRqO9&s"),
              backgroundColor: Color.fromARGB(255, 80, 126, 255),
              radius: 17,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "10 task pending",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 30,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 15, left: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(Icons.search_sharp),
                            ),
                            hintText: 'Searched task',
                            hintStyle: GoogleFonts.poppins(fontSize: 12),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onChanged: (value) {
                            // do something
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Container(
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Categories",
                        style: GoogleFonts.poppins(
                            fontSize: 17, color: Colors.red),
                      ), //
                    ),
                  ),
                ],
              ),
              //category
              StreamBuilder(
                  stream: _streamControl.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }

                    return Container(
                      height: 200,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: saro.length,
                          itemBuilder: (context, index) {
                            List cat = saro;
                            // print(cat);
                            return Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .24,
                                    width:
                                        MediaQuery.of(context).size.width * .44,
                                    // ignore: prefer_const_constructors
                                    decoration: BoxDecoration(
                                      // ignore: prefer_const_constructors

                                      color: Color(0xff3E4553),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              SingleChildScrollView(
                                                child: Text(
                                                  cat[index]['tag_text'],
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.poppins(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Container(
                                                child: Text(
                                                  "10 Task",
                                                  style: GoogleFonts.poppins(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 37.06),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                  topLeft: Radius.circular(15),
                                                ),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.10,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.20,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  child: Image.network(
                                                    "https://img.freepik.com/free-vector/personal-files-concept-illustration_114360-4013.jpg?w=740&t=st=1667372239~exp=1667372839~hmac=e001d5549d036a6b558af29ae88d8ef4a07ef329212ff61f0b9a7436ee655c58",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .70,
                      child: Text(
                        "Ongoing Task",
                        style: GoogleFonts.poppins(
                            fontSize: 17, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              //sendtaskid
              Container(
                child: StreamBuilder(
                    stream: _streamController.stream,
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: parsedList.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          List li = parsedList;
                          // check date
                          check(
                              li[index]["complete_by_date"].toString().trim());
                          // print("working sa");
                          // print("dates:$dates");
                          return InkWell(
                            onTap: () {
                              li[index]['task_id'];
                              print(li[index]['task_id']);
                              setState(() {
                                sendtaskid = li[index]['task_id'];
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(sendtaskid),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .28,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Color(0xff3E4553),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                li[index]['task_tittle'],

                                                //li[index]["task_tittle"],
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                // ignore: prefer_const_constructors
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        163, 103, 118, 150),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                100, 50))),
                                                child: Text(
                                                  dates,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Center(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Team members",
                                                  style: GoogleFonts.poppins(
                                                      color: Color.fromARGB(
                                                          255, 186, 189, 198),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                    height: 50,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            ScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            profile[index]
                                                                .length,
                                                        itemBuilder:
                                                            (context, indexs) {
                                                          // print("saro" +
                                                          //     profile[indexs]
                                                          //         .toString());
                                                          // print("sens : " +
                                                          //     profile[indexs][0]
                                                          //             [
                                                          //             'profileurl']
                                                          //         .toString());
                                                          // List userview =
                                                          //     profile;
                                                          // var img = userview[
                                                          //             index]
                                                          //         ['profileurl']
                                                          //     .toString();
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 05),
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(profile[index][indexs]
                                                                            [
                                                                            'profileurl']
                                                                        .toString()),
                                                                radius: 100,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              )
                                              // //CircleAvatar
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Center(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.calendar_month,
                                                    size: 22,
                                                    color: const Color(
                                                        0xffFF7360)),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    li[index]
                                                            ['complete_by_date']
                                                        .toString()
                                                        .trim(),
                                                    style: GoogleFonts.poppins(
                                                        color: Color.fromARGB(
                                                            255, 186, 189, 198),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
