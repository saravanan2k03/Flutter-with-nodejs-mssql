import 'package:flutter/material.dart';
// import 'package:todoist/Todoist.dart';
import 'package:todoist/mainpage.dart';
import 'package:todoist/screen/Splash.dart';
import 'package:todoist/screen/empty.dart';
import 'package:todoist/screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
