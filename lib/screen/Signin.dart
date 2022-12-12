// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoist/components/bottomnavigation.dart';

import 'Signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  check() {
    var date = "09-11-2022";
    var currentdate = "01-11-2022";
    var kudu = date[0] + date[1];
    var poda = currentdate[0] + currentdate[1];
    print(kudu);
    print(poda);
    var dig = int.parse(kudu) - int.parse(poda);
    print("working");
    print(dig);
  }

  bool ishideText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenWidth / 12,
                bottom: screenWidth / 150,
                left: screenWidth / 200,
                right: screenWidth / 200,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Welcome Back !",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 12,
                        color: const Color.fromARGB(221, 32, 37, 54)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Please sign in your account",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(121, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 215, 213, 213)
                                  .withOpacity(0.3), //color of shadow
                              spreadRadius: 0, //spread radius
                              blurRadius: 12, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          style: const TextStyle(
                              color: Color.fromARGB(203, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          cursorColor: Color.fromARGB(203, 0, 0, 0),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xffFF7360),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(159, 0, 0, 0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 215, 213, 213)
                                  .withOpacity(0.3), //color of shadow
                              spreadRadius: 0, //spread radius
                              blurRadius: 12, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          obscureText: ishideText,
                          style: const TextStyle(
                              color: Color.fromARGB(203, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          cursorColor: Color.fromARGB(203, 0, 0, 0),
                          decoration: InputDecoration(
                              // ignore: prefer_const_constructors
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xffFF7360),
                              ),
                              suffixIcon: InkWell(
                                onTap: passwordvisivle,
                                child: Icon(
                                  ishideText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xffFF7360),
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(159, 0, 0, 0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => {},
                          child: const Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(121, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bottomnavbar()),
                        )
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 215, 213, 213)
                                    .withOpacity(1), //color of shadow
                                spreadRadius: 0, //spread radius
                                blurRadius: 12, // blur radius
                                offset:
                                    Offset(0, 2), // changes position of shadow
                                //first paramerter of offset is left-right
                                //second parameter is top to down
                              ),
                              //you can set more BoxShadow() here
                            ],
                            color: const Color(0xffFF7360)),
                        child: const Center(
                          child: const Text(
                            "Sign in",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 2,
                    height: 30,
                    color: Color.fromARGB(73, 112, 109, 109),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(
                      // top: deviceHeight(context) / 50,
                      bottom: screenHeight / 9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account ? ",
                          style: TextStyle(
                              color: Color.fromARGB(121, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            check();
                          },
                          // onTap: () => {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const SignUpScreen()),
                          //   )
                          // },
                          child: const Text(
                            "Create a account",
                            style: TextStyle(
                                color: Color(0xffB1D199),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  void passwordvisivle() {
    setState(() {
      ishideText = !ishideText;
    });
  }
}
