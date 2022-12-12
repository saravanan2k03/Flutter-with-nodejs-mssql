import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/MemberModel.dart';
import '../Models/UserDetails.dart';

import '../constants/constants.dart';
import 'TaskSplitupScreen.dart';
import 'Todoist.dart';
import 'package:http/http.dart' as http;

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  bool isLoading = false;

  // List <UserDetails> users = l2;
  // List <UserDetails>  users5 = li;

  @override
  void initState() {
    super.initState();
    MemberDatas();
    li.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    MemberDatas();
    li.clear();
  }

  Future MemberDatas() async {
    isLoading = true;
    final http.Response response = await http
        .get(
          Uri.parse('http://103.207.1.87:5001/user-details'),
        )
        .catchError((onError) => {print(onError)});
    if (response.statusCode == 200) {
      // print(response.body);

      setState(() {
        li.addAll(userDetailsFromJson(response.body));
        // memberlist=(json.decode(response.body));
        li2 = li;
        isLoading = false;
      });
      print(response.body);
      print(memberlist.length);
      print(memberlist);

      isLoading = false;
    } else {
      print('A unknown error occured. code:${response.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateTaskScreen()),
                            )
                          },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.indigo,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 215, 213, 213)
                          .withOpacity(0.3), //color of shadow
                      spreadRadius: 0, //spread radius
                      blurRadius: 12, // blur radius
                      offset: const Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    onChanged: searchuser,
                    style: const TextStyle(
                        color: Color.fromARGB(203, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    cursorColor: const Color.fromARGB(203, 0, 0, 0),
                    decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateTaskScreen()),
                            )
                          },
                          child: const Icon(
                            Icons.search,
                            color: Color(0xffFF7360),
                          ),
                        ),
                        hintText: "Search...",
                        hintStyle: const TextStyle(
                            fontSize: 18.0,
                            color: Color.fromARGB(159, 0, 0, 0)),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xffFF7360),
                        ),
                      )
                    : ListView.builder(
                        itemCount: li.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TaskSplitupScreen(
                                            name: li[index].name.trim(),
                                            url: li[index].profileurl,
                                            index: index,
                                            Taskname: '',
                                            empid: li[index].empid.toString(),
                                          )),
                                )
                              },
                              child: Container(
                                padding: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 215, 213, 213)
                                          .withOpacity(0.3), //color of shadow
                                      spreadRadius: 0, //spread radius
                                      blurRadius: 12, // blur radius
                                      offset: const Offset(
                                          0, 2), // changes position of shadow
                                      //first paramerter of offset is left-right
                                      //second parameter is top to down
                                    ),
                                    //you can set more BoxShadow() here
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(li[index].profileurl),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        li[index].name,
                                        style: const TextStyle(
                                            color: Colors.black38,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      )),
    );
  }

  // UserItem(userlist[index].Name, userlist[index]
  //     .Profileurl, index)

  // Widget UserItem (String name,String url, int index){
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //
  //     child: GestureDetector(
  //       onTap: () => {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) =>  TaskSplitupScreen(name: name, url: url, index: index, Taskname: '',)),
  //         )
  //       },
  //       child: Container(
  //         padding: EdgeInsets.all(25),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           color: const Color.fromARGB(255, 255, 255, 255),
  //           boxShadow: [
  //             BoxShadow(
  //               color: const Color.fromARGB(255, 215, 213, 213)
  //                   .withOpacity(0.3), //color of shadow
  //               spreadRadius: 0, //spread radius
  //               blurRadius: 12, // blur radius
  //               offset:
  //               const Offset(0, 2), // changes position of shadow
  //               //first paramerter of offset is left-right
  //               //second parameter is top to down
  //             ),
  //             //you can set more BoxShadow() here
  //           ],
  //
  //
  //         ),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             CircleAvatar(
  //               backgroundImage: NetworkImage(url),
  //             ),
  //
  //
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(name,style: TextStyle(color: Colors.black38,fontSize: 17,
  //                   fontWeight: FontWeight.w600),),
  //             )
  //           ],
  //         ),
  //
  //       ),
  //     ),
  //   );
  // }

  void searchuser(String query) {
    final suggestion = li2.where((element) {
      final username = element.name.toLowerCase();
      final input = query.toLowerCase();

      return username.contains(input);
    }).toList();

    setState(() => li = suggestion);
  }
}
