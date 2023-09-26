import 'package:flutter/material.dart';

class BottomButtonElevation extends StatelessWidget {
  final String titel;
  final int index;
  final VoidCallback onPressed;
    final Color? backColor;
  final Color? borderColor;
  final Color? textColor;
 

  BottomButtonElevation({required this.titel, required this.onPressed, this.backColor,this.textColor, this.borderColor, required this.index });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor:backColor ?? Colors.white,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height / 53.6),
          side:
              BorderSide(width: size.width / 330.833, color:borderColor ?? Colors.deepPurple),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
            left: size.width / 33.08,
            right: size.width / 33.08,
            top: size.height / 67,
            bottom: size.height / 67),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size.height / 53.6)),
        ),
        child: 
            Center(
              child: Text(
                titel,
                style:  TextStyle(fontSize: 18, color: textColor ?? Colors.deepPurple),
              ),
            ),
         
      ),
    );
  }
}
