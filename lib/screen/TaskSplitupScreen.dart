import 'package:flutter/material.dart';
import '../components/Widgets/AddWidget.dart';
import '../components/Widgets/TaskSplitupUserData.dart';
import '../components/bottomnavigation.dart';
import 'Todoist.dart';
import 'UserListScreen.dart';
import "../constants/constants.dart";
class TaskSplitupScreen extends StatefulWidget {

  final String name;
  final String url;
  final int index;
  final String Taskname;
  final String empid;



  const TaskSplitupScreen({Key? key, required this.name, required this.url,
  required this.index, required this.Taskname, required this.empid,})
      : super(key: key);
  @override
  State<TaskSplitupScreen> createState() => _TaskSplitupScreenState();
}

class _TaskSplitupScreenState extends State<TaskSplitupScreen> {

 final TextEditingController _taskassign = TextEditingController();

 var data;

 // List<UserModelSplitup> selectedlist=[];
 void AddtoList (){


  // var data =  AddData().AddDataUser(name: widget.name, url: widget.url,
  //       taskname:_taskassign.text,
  //       index:widget.index);
  //
  //   print(data);
  //   print(selectedUser.length);

   UserModelSplitup user = UserModelSplitup(userid:widget.index.toString(),
       username: widget.name.trim(), url:widget
       .url, taskname:_taskassign.text, empid: widget.empid,);

     selectedList.add(user);
   //
   print(selectedList.length);
   print(selectedList[0].empid);

   // print(user.toJson().length);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>  const UserListScreen()),
    );



 }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(

                children: [
                  SizedBox(height: 20,),
                  CircleAvatar(
                    maxRadius: 100,
                    backgroundImage: NetworkImage(widget.url),
                  ),
                  SizedBox(height: 20,),

                  Center(
                    child: Text(widget.name,style: const TextStyle(color: Colors.black,fontSize:
                    25,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 20,),
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
                          offset:
                          const Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(

                      controller: _taskassign,
                        // onChanged: (value){
                        //   if(widget.Taskname == null){
                        //
                        //   }
                        //   setState((){
                        //     value=widget.Taskname;
                        //   });
                        // },
                        // initialValue: widget.Taskname,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        style: const TextStyle(
                            color: Color.fromARGB(203, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        cursorColor: const Color.fromARGB(203, 0, 0, 0),
                        decoration: const InputDecoration(

                            hintText: "Task Assign",
                            hintStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(159, 0, 0, 0)),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () => {AddtoList()},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFF7360)),
                        child: const Text("Assign Task",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

