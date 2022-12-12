import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Signin.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages1 = [
      PageViewModel(
          title: 'WELCOME TO OUR APP',
          body: 'Ready to join',
          // footer: ElevatedButton(
          //   onPressed: () {},
          //   child: const Text('lets Go'),
          // ),
          image: Center(child: Image.asset('assets/image3.jpeg')),
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ))),
      PageViewModel(
        title: 'BE FREE',
        body: 'Make a bond with each other',
        // footer: ElevatedButton(
        //   onPressed: () {},
        //   child: const Text('Lets Go'),
        // ),
        image: Center(child: Image.asset('assets/image2.jpeg')),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      PageViewModel(
        title: 'PLEASE LOGIN',
        body: 'Stay connected',
        footer: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: const Text('Lets Go'),
        ),
        image: Center(child: Image.asset('assets/image1.jpeg')),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        )),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages1,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInScreen()));
  }
}
