import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class PickerDate extends StatelessWidget {
  final TextStyle dateTextStyle;
  final TextStyle dayTextStyle;
  final TextStyle monthTextStyle;
  final void Function(DateTime) selectDate;
  PickerDate(
      {required this.dateTextStyle,
      required this.dayTextStyle,
      required this.monthTextStyle,
      required this.selectDate});
  @override
  Widget build(BuildContext context) {
    return DatePicker(DateTime.now(),
        initialSelectedDate: DateTime.now(),
        height: 100,
        width: 75,
        selectionColor: Colors.deepPurple,
        selectedTextColor: Colors.white,
        daysCount: 200,
        dateTextStyle: dayTextStyle,
        dayTextStyle: dayTextStyle,
        monthTextStyle: monthTextStyle, onDateChange: (date) {
      selectDate(date);
    });
  }
}
