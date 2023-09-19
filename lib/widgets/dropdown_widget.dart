import 'package:flutter/material.dart';

class WidgetDropdownButton extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem<String>> items;
  final String? selectedValue;
   WidgetDropdownButton({super.key, 
    required this.onChanged,
    required this.items,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
     
      icon:const Icon(
         Icons.keyboard_arrow_down,
        size: 25,
       
      ),
       iconDisabledColor: Colors.deepPurple,
  iconEnabledColor: Colors.deepPurple,
      underline: Container(
        height: 0,
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}
