import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/widgets/text_field.dart';

class AddTaskPage extends StatefulWidget {
  @override
  AddTaskPageState createState() => AddTaskPageState();
}

class AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();

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
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.deepPurple,
                  ),
                )),
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
}
