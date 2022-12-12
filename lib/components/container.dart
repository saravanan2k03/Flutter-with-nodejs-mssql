import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoist/screen/Task_details.dart';

class cont extends StatefulWidget {
  const cont({super.key});

  @override
  State<cont> createState() => _contState();
}

class _contState extends State<cont> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: MediaQuery.of(context).size.height * .28,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xff3E4553),
                borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mern stack project",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(163, 103, 118, 150),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(100, 50))),
                          child: Text(
                            "6d",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
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
                                color: Color.fromARGB(255, 186, 189, 198),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/60.jpg"),
                            radius: 100,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/women/91.jpg"),
                            radius: 100,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ), //
                        Container(
                          width: 40,
                          height: 40,
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/women/64.jpg"),
                            radius: 100,
                          ),
                        ), // //CircleAvatar
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.alarm,
                              size: 22, color: const Color(0xffFF7360)),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "2.30PM - 6.00PM",
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 186, 189, 198),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
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
        ),
      ],
    );
  }
}
