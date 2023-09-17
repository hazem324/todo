import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/widgets/elevation_button.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEE, d MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.people),
        elevation: 5,
      ),
      body: SafeArea(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                formattedDate,
                style: GoogleFonts.pacifico(
                    textStyle:
                        const TextStyle(fontSize: 23, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 10, bottom: 8),
              child: ButtonElevationWidget(titel: "Add Task", onPressed: () {}),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 8),
              child: Text(
                "Today",
                style: latoTextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 8),
          child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 75,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.deepPurple,
            selectedTextColor: Colors.white,
            daysCount: 200,
            dateTextStyle: latoTextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
            dayTextStyle: latoTextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
            monthTextStyle: latoTextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
            onDateChange: (date) {
              selectedDate = date;
              print("the selected date is $selectedDate");
            },
          ),
        ),
      ])),
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
}
