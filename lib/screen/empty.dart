// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class empty extends StatefulWidget {
  const empty({super.key});

  @override
  State<empty> createState() => _emptyState();
}

class _emptyState extends State<empty> {
  TextEditingController tittle = TextEditingController();
  TextEditingController descrption = TextEditingController();

  var strFileName = "saro";

  setdata() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://103.207.1.89:7777/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'tittle': tittle.text,
            'description': descrption.text,
          },
        ),
      );
      if (res.statusCode == 200) {
        if (jsonDecode(res.body).toString() != '0') {
          setState(() {});
        } else {
          print('error: ${jsonDecode(res.body).toString()}');
        }
      } else {
        print('A unknown error occured. code:${res.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    connectionFTP();
    super.initState();
  }

  FTPConnect? ftpConnect;
  File? file;

  saro() async {
    FTPConnect ftpConnect = FTPConnect('ftp.mzcet.in',
        user: 'graduation@mzcet.in', pass: 'DEGREE@11');
    File fileToUpload = File('../../summa.txt');
    await ftpConnect.connect();
    bool res =
        await ftpConnect.uploadFileWithRetry(fileToUpload, pRetryCount: 2);
    await ftpConnect.disconnect();
    print(res);
  }

  vanchi() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }
  }

  chuchu() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File filed = File(result.files.single.path!);

      print("working chuchu");
      print(filed);
      FTPConnect ftpConnect = FTPConnect('ftp.mzcet.in',
          user: 'graduation@mzcet.in', pass: 'DEGREE@11');
      try {
        File fileToUpload = File("../../module_table_top.png");
        await ftpConnect.connect();
        await ftpConnect.uploadFile(fileToUpload);
        await ftpConnect.disconnect();
      } catch (e) {
        print("error");
        print(e);
      }
    } else {
      // User canceled the picker
    }
  }

  down() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    FTPConnect ftpConnect = FTPConnect('ftp.mzcet.in',
        user: 'graduation@mzcet.in', pass: 'DEGREE@11');
    try {
      String fileName = 'gallery-3.jpg';
      await ftpConnect.connect();
      await ftpConnect.downloadFile(fileName, File('gallery-3.jpg'));
      await ftpConnect.disconnect();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fileMock(String strFileName) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    file = File('$appDocPath/$strFileName');
    print('appDocPath : $appDocPath');
    print('file : $file');
  }

  //connect FTP
  connectionFTP() async {
    setState(() {
      ftpConnect = FTPConnect('ftp.mzcet.in',
          user: 'graduation@mzcet.in', pass: 'DEGREE@11');
    });
  }

//download file
  Future<void> downloadFileFTP() async {
    try {
      bool bRes = await ftpConnect!.connect();
      _fileMock('saro.jpg');
      await ftpConnect!
          .downloadFileWithRetry('/gallery-3.jpg', file!, pRetryCount: 1);
      print('path2 : ${file!.path}');
      await ftpConnect!.disconnect();

      print('file Name : ${file!}');
    } catch (e) {
      print('Error : ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: TextFormField(
                    controller: tittle,
                    decoration: InputDecoration(
                      hintText: 'Task Title',
                      hintStyle:
                          GoogleFonts.poppins(fontSize: 15, color: Colors.blue),
                      labelText: "Title",
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.blue,
                          fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 44, 110, 209),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Center(
                    child: TextFormField(
                      controller: descrption,
                      decoration: InputDecoration(
                        hintText: 'Task Title',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.blue),
                        labelText: "Title",
                        labelStyle: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.blue,
                            fontStyle: FontStyle.italic),
                        // ignore: prefer_const_constructors
                        border: OutlineInputBorder(
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 44, 110, 209),
                          ),
                          // ignore: prefer_const_constructors
                          borderRadius: BorderRadius.all(
                            // ignore: prefer_const_constructors
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  chuchu();
                },
                // ignore: prefer_const_constructors
                child: Text("Insert"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
