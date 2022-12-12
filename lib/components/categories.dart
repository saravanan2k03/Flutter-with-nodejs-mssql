import 'package:flutter/material.dart';

class categ extends StatefulWidget {
  const categ({super.key});

  @override
  State<categ> createState() => _categState();
}

class _categState extends State<categ> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .24,
            width: MediaQuery.of(context).size.width * .44,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/5242340.jpg'),
              ),
              color: Color(0xff3E4553),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
