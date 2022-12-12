import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoist/screen/Signin.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  bool ishidetext = true;
  bool ishidetextconfirm = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var screenHeightbox = MediaQuery.of(context).size.height;
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff313642),
          title: const Text(
            "Todoist",
            style: TextStyle(
                color: Color(0xffFF7360),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: const Color(0xff313642),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: deviceHeight(context) / 200,
                right: deviceHeight(context) / 200,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Hi todoist create your account !",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 18,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff3E4553),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_pin,
                                color: Color(0xffFF7360),
                              ),
                              hintText: "Username",
                              hintStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff3E4553),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xffFF7360),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff3E4553),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          obscureText: ishidetext,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xffFF7360),
                              ),
                              suffixIcon: InkWell(
                                onTap: passwordvisible,
                                child: Icon(
                                  ishidetext
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xffFF7360),
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff3E4553),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          obscureText: ishidetextconfirm,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xffFF7360),
                              ),
                              suffixIcon: InkWell(
                                onTap: passwordvisibleconfirm,
                                child: Icon(
                                  ishidetextconfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xffFF7360),
                                ),
                              ),
                              hintText: "Confirm Password",
                              hintStyle: const TextStyle(
                                  fontSize: 18.0, color: Colors.white),
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
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffFF7360)),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => {},
                          child: const Text(
                            "Create a account",
                            style: TextStyle(
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
                    height: 30,
                    color: Color.fromARGB(80, 255, 255, 255),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(
                      // top: deviceHeight(context) / 50,
                      bottom: deviceHeight(context) / 9,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account ? ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                            )
                          },
                          child: const Text(
                            "Sign in",
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

  void passwordvisible() {
    setState(() {
      ishidetext = !ishidetext;
    });
  }

  void passwordvisibleconfirm() {
    setState(() {
      ishidetextconfirm = !ishidetextconfirm;
    });
  }
}
