import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:todoist/constants/constants.dart';
// import 'package:todoist/screen/TaskSplitupScreen.dart';
import '../components/Widgets/AddWidget.dart';
import '../components/Widgets/SnackbarCus.dart';
import 'TaskSplitupScreen.dart';
import 'UserListScreen.dart';
import '../components/Widgets/TaskSplitupUserData.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final CurrentUser = 8482;
  final AssignedTask = 7937;
  final TextEditingController _taskname = TextEditingController();
  final TextEditingController _descriptions = TextEditingController();
  DateTime dates = DateTime.now();
  // late UserModelSplitup data;
  bool _isselected = true;
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);
  var assign_date;

  // TimeOfDay _timeOfDays = const TimeOfDay(hour: 8, minute: 35);
  var initial = '--select-category--';
  var items = [
    '--select-category--',
    'Workshop',
    'Assignment',
    'culturals',
    'Industrial Visit',
    'Web Development',
    'Mobile Development',
    'Desktop Development',
    'Symposium',
    'Programming',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _taskname.dispose();
    _descriptions.dispose();
    selectedList.clear();
    memberlist.clear();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isTouchableOpacity = false;
    final dateTimeNow = DateTime.now();
    final to12hours = DateFormat(' h:mm a').format(dateTimeNow);
    print(to12hours); // flutter: 22/Jul/21 5:14 PM
    String det = 'ongoing';

    Future InsertData() async {

        if (_taskname.text.isEmpty ||
            initial == '--select-category--' ||
            _descriptions.text.isEmpty) {
          ShowSnackbar("Please Fill the Details", context);
        } else {
          try {
            for (var i = 0; i < li.length; i++) {

              http.Response res = await http.post(
                Uri.parse('http://103.207.1.87:5001/create-task'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(
                  <String, String>{
                    'tittle': _taskname.text,
                    'description': _descriptions.text,
                    'datecurrent': dates.toString().substring(0, 10),
                    'datecomplete': assign_date.toString(),
                    'currenttime': to12hours,
                    'completetime': _timeOfDay.format(context).toString(),
                    'tagid': initial.hashCode.toString(),
                    'status': det,
                    'currentuser': CurrentUser.toString(),
                    'assignedtask':selectedList[i].empid,
                    'assignedtaskdescription':selectedList[i].taskname,
                    'category':initial,


                    // 'assignedtask':li[i].empid.toString()
                    // 'assignedtask': li
                    //     .asMap()
                    //     .keys
                    //     .toList()
                    //     .map((e) => li[e].empid)
                    //     .toString()
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

            }

          } catch (e) {
            print(e);
          }
          _taskname.clear();
          _descriptions.clear();
          initial = '--select-category--';
          selectedList.clear();

          ShowSnackbar(
              "Hi ${CurrentUser} Your TaskCreated SuccessFully !!!", context);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>const CreateTaskScreen()),
        );



    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            color: Color(0xffDDDDDD),
                            size: 30,
                          )),
                      const Text(
                        "Todays Task",
                        style: TextStyle(
                            color: Color(0xffDDDDDD),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/women/10.jpg"),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Create",
                      style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                    Text("New Task",
                        style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1))
                  ],
                ),
                const SizedBox(
                  height: 25,
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
                        offset:
                            const Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      controller: _taskname,
                      style: const TextStyle(
                          color: Color.fromARGB(203, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      cursorColor: const Color.fromARGB(203, 0, 0, 0),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.add_task,
                            color: Color(0xffFF7360),
                          ),
                          hintText: "Task Name",
                          hintStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(159, 0, 0, 0)),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Category",
                    style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1)),
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
                        offset:
                            const Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                            onTap: ()=>{
                            showDialog(
                            useSafeArea: true,
                            // barrierDismissible: false,
                            context: context,
                            builder: (context) {
                            return Dialog(
                            backgroundColor:
                            const Color.fromARGB(
                            255, 238, 235, 235),
                            alignment: Alignment.center,
                            insetPadding:
                            const EdgeInsets.all(
                            10),
                              child: SizedBox(
                                height: 400,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric
                                    (vertical:5,horizontal:20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                          child: const Text("Add Category",style:
                                          TextStyle(fontSize: 18,fontWeight:
                                          FontWeight.bold))),
                                      SizedBox(
                                        height: 15,
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
                                              offset:
                                              const Offset(0, 2), // changes position of shadow
                                              //first paramerter of offset is left-right
                                              //second parameter is top to down
                                            ),
                                            //you can set more BoxShadow() here
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: TextFormField(
                                            controller: _taskname,
                                            style: const TextStyle(
                                                color: Color.fromARGB(203, 0, 0, 0),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                            cursorColor: const Color.fromARGB(203, 0, 0, 0),
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.task_alt_outlined,
                                                  color: Color(0xffFF7360),
                                                ),
                                                hintText: "Add Category",
                                                hintStyle: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(159, 0, 0, 0)),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height:20
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 20),
                                        child: GestureDetector(
                                          onTap: () => {},
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: const Color(0xffFF7360)),
                                            child: const Text("Add Category",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                      ),





                                    ]
                                  ),
                                ),
                              ),
                            );
                            }
                            )
                            },
                            child: const Icon(

                              Icons.category_outlined,
                              color: Color(0xffFF7360),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth / 1.30,
                          child: DropdownButton(
                              value: initial,
                              underline: Container(),
                              isExpanded: true,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8.0),
                                    child: Text(
                                      items,
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              159, 0, 0, 0),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  initial = newValue!;
                                  // initial.indexOf(newValue);
                                  print(initial.hashCode);
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Co Workers",
                    style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(selectedList.length.toString())

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  height: 50,
                                  child: ListView.builder(
                                      itemCount: selectedList.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onLongPress: () => {deleteUser()},
                                          onTap: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TaskSplitupScreen(
                                                        name:
                                                            selectedList[index]
                                                                .username,
                                                        url: selectedList[index]
                                                            .url,
                                                        index: index,
                                                        Taskname:
                                                            selectedList[index]
                                                                .taskname,
                                                        empid:selectedList[index].empid,
                                                      )),
                                            )
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  selectedList[index].url),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserListScreen()),
                              )
                            },
                        icon: const Icon(
                          Icons.add_outlined,
                          size: 30,
                          color: Color(0xffFF7360),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 215, 213, 213)
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
                        children: [
                          const Icon(
                            Icons.date_range_outlined,
                            color: Color(0xffFF7360),
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Date",
                                    style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1)),
                                Text(dates.toString().substring(0, 10),
                                    style: const TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {date()},
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 215, 213, 213)
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
                          children: [
                            const Icon(
                              Icons.date_range_outlined,
                              color: Color(0xffFF7360),
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Date",
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1)),
                                  Text(
                                      _isselected
                                          ? dates.toString().substring(0, 10)
                                          : assign_date.toString(),
                                      style: const TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 215, 213, 213)
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
                        children: [
                          const Icon(
                            Icons.date_range_outlined,
                            color: Color(0xffFF7360),
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Task Start",
                                    style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1)),
                                Text(to12hours,
                                    style: const TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (_timeOfDay == null) return;
                          setState(() {
                            _timeOfDay = value!;
                          });
                        }),
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 215, 213, 213)
                                  .withOpacity(0.3), //color of shadow
                              spreadRadius: 0, //spread radius
                              blurRadius: 12, // blur radius
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                            //you can set more BoxShadow() here
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.date_range_outlined,
                              color: Color(0xffFF7360),
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Task end",
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1)),
                                  Text(_timeOfDay.format(context).toString(),
                                      style: const TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Description",
                    style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1)),
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
                        offset:
                            const Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, right: 5, bottom: 5),
                    child: TextFormField(
                      controller: _descriptions,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      style: const TextStyle(
                          color: Color.fromARGB(203, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      cursorColor: const Color.fromARGB(203, 0, 0, 0),
                      decoration: const InputDecoration(
                          hintText: "Write Some thing ....",
                          hintStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(159, 0, 0, 0)),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () => {InsertData()},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffFF7360)),
                      child: const Text("Create Task",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  void date() async {
    DateTime date = DateTime(1900);
    FocusScope.of(context).requestFocus(new FocusNode());

    date = (await showDatePicker(
        context: context,
        initialDate: DateTime(dates.year),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        currentDate: DateTime(dates.day),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDatePickerMode: DatePickerMode.day))!;
    assign_date = date.toString().substring(0, 10);

    if (assign_date == null) {
      setState(() {
        _isselected = true;
      });
    } else if (assign_date != null) {
      setState((() {
        _isselected = false;
      }));
    }
  }

  Widget UserItem(String name, String url, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(25),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(url),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                    color: Colors.black38,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  void deleteUser() {
    setState(() {
      selectedList.removeAt(0);
      print(selectedList.length);
    });
  }
}
