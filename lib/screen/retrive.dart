import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class retrive extends StatefulWidget {
  const retrive({super.key});

  @override
  State<retrive> createState() => _retriveState();
}

class _retriveState extends State<retrive> {
  StreamController _streamController = StreamController();
  late Timer _timer;
  getdata() async {
    try {
      final http.Response response = await http.post(
        Uri.parse('http://103.207.1.87:5001/show'),
      );
      if (response.statusCode == 200) {
        parsedList = json.decode(response.body);
        _streamController.add(parsedList);
      }

      print(parsedList.length);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) => getdata());
    print(parsedList.length);
    super.initState();
  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }

  List<dynamic> parsedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: parsedList.length,
              itemBuilder: (context, index) {
                List li = parsedList;

                return Column(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text(li[index]["task_tittle"]),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text(li[index]["description"]),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
