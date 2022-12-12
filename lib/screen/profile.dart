// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff313642),
      appBar: AppBar(
        actions: [
          const Icon(
            Icons.more_vert_sharp,
            color: Color.fromARGB(255, 255, 255, 255),
          )
        ],
        backgroundColor: Color(0xff313642),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        elevation: 0,
      ),
      body: Column(children: [
        SizedBox(height: 30),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xff3E4553),
                  child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                          'https://www.goodmorningimageshddownload.com/wp-content/uploads/2020/04/Cartoon-Images-Wallpaper-5.jpg')),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
            child: Text(
          "Saravanan",
          style: GoogleFonts.poppins(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        )),
        Container(
            child: Text(
          "Anonymous Hacker",
          style: GoogleFonts.poppins(
              fontSize: 10,
              color: Color.fromARGB(255, 187, 186, 186),
              fontWeight: FontWeight.w400),
        )),
        SizedBox(
          height: 40,
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
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  // ignore: prefer_const_constructors
                  child: Icon(
                    Icons.crisis_alert_outlined,
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
                            "Complete Task",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 192, 190, 190)),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "2.2k",
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
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Icon(
                    Icons.join_inner_outlined,
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
                            "Pending Task",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 192, 190, 190)),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "2.2k",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        )
      ]),
    );
  }
}
