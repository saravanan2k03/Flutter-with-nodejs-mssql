// ignore: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskLsitData extends StatefulWidget {
  final title, time;
  TaskLsitData({this.title, this.time});

  @override
  State<TaskLsitData> createState() => _TaskLsitData();
}

class _TaskLsitData extends State<TaskLsitData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(61, 23, 24, 25)
                    .withOpacity(0.3), //color of shadow
                spreadRadius: 0, //spread radius
                blurRadius: 12, // blur radius
                offset: Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
              //you can set more BoxShadow() here
            ],
            color: const Color(0xff3E4553),
            borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(163, 103, 118, 150),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(100, 50))),
                    child: Text(
                      "2d",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Team members",
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 186, 189, 198),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/10.jpg"),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/27.jpg"),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/27.jpg"),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/27.jpg"),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/27.jpg"),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/27.jpg"),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/27.jpg"),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ), //// //// ////
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/43.jpg"),
                        radius: 100,
                      ),
                    ), // //CircleAvatar
                  ],
                ),
              ),
            ),
            screenWidth <= 392
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 5,
                          percent: 0.5,
                          progressColor: const Color(0xffB1D199),
                          backgroundColor:
                              const Color.fromARGB(255, 186, 189, 198),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "50%",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: deviceHeight(context) / 50,
                          bottom: deviceHeight(context) / 150,
                          left: deviceHeight(context) / 200,
                          right: deviceHeight(context) / 200,
                        ),
                        child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(Icons.alarm,
                                  size: 22, color: Color(0xffFF7360)),
                              Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  widget.time,
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                          255, 186, 189, 198),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.alarm,
                                size: 22, color: Color(0xffFF7360)),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                widget.time,
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 186, 189, 198),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ]),
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: CircularPercentIndicator(
                          radius: 40,
                          lineWidth: 4,
                          percent: 0.5,
                          progressColor: const Color(0xffB1D199),
                          backgroundColor:
                              const Color.fromARGB(255, 186, 189, 198),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "50%",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        )),
      ),
    );
  }
}
