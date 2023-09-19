import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/data/list_data.dart';
import 'package:todo/widgets/dropdown_widget.dart';
import 'package:todo/widgets/text_field.dart';

class AddTaskPage extends StatefulWidget {
  @override
  AddTaskPageState createState() => AddTaskPageState();
}

class AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 5)))
      .toString();
  int selectedRemind = 5;
  String selectedRepeat = "Nope";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, bottom: 7),
                  child: Text(
                    "Add Task",
                    style: latoTextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              title: 'Title',
              hintText: 'Add Title',
              myController: titleController,
            ),
            MyTextField(
              title: 'Note',
              hintText: 'Add Note',
              myController: noteController,
            ),
            MyTextField(
                title: 'Date',
                hintText:
                    DateFormat('MM-dd-yyyy').format(selectedDate).toString(),
                widget: IconButton(
                  onPressed: () {
                    takeDateFromUser();
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.deepPurple,
                  ),
                )),
            Row(
              children: [
                // start time
                Expanded(
                  child: MyTextField(
                    title: "Start Time",
                    hintText: startTime,
                    widget: IconButton(
                      onPressed: () {
                        getTimeFromUser(isStartTime: true);
                      },
                      icon: const Icon(
                        Icons.watch_later,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),

                // end time
                Expanded(
                  child: MyTextField(
                    title: "End Time",
                    hintText: endTime,
                    widget: IconButton(
                      onPressed: () {
                        getTimeFromUser(isStartTime: false);
                      },
                      icon: const Icon(
                        Icons.watch_later,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MyTextField(
                title: "Remind ",
                hintText: " $selectedRemind minutes early",
                widget:
                WidgetDropdownButton(
 
  onChanged: (String? newValue) {
    setState(() {
      selectedRemind = int.parse(newValue!);
    });
  },
  selectedValue: selectedRemind.toString(),
  items: MyData.reminList.map((e) {
    return DropdownMenuItem<String>(
      value: e.toString(),
      child: Text(e.toString()),
    );
  }).toList(),
),       
                ),
            MyTextField(
                title: "Repeat ",
                hintText: selectedRepeat,
                widget:WidgetDropdownButton(
                  onChanged: (String? value) {
                     setState(() {
                      selectedRepeat = value!;

                    }); }, items:MyData.repeatedList.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                      value: e.toString(),
                      child: Text(e.toString()),
                    );
                  }).toList(), selectedValue: selectedRepeat,)
                ),
          ]),
        ),
      )),
    );
  }

  TextStyle latoTextStyle({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  Future<void> takeDateFromUser() async {
    DateTime currentDate = DateTime.now();
    DateTime twoYearsFromNow = currentDate.add(Duration(days: 730));

    DateTime? pickedDateFirst = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: currentDate,
      lastDate: twoYearsFromNow,
    );
    if (pickedDateFirst != null && pickedDateFirst != selectedDate) {
      setState(() {
        selectedDate = pickedDateFirst;
      });

      print("first date is $selectedDate");
    }
  }

  getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("canceld time");
    } else if (isStartTime == true) {
      setState(() {
        startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(startTime.split(":")[0]),
          minute: int.parse(startTime.split(":")[1].split(" ")[0])),
      initialEntryMode: TimePickerEntryMode.input,
    );
  }
}
