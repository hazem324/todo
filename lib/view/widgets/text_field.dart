import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final widget;
  String title;
  String hintText;

  MyTextField(
      {super.key,
      required this.title,
      required this.hintText,
     
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                title,
                style: latoTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 5, right: 8, bottom: 8),
          height: 50,
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                    
                    readOnly: widget == null? false : true,
                      autofocus: false,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: hintText,
                           hintStyle: const TextStyle(color: Colors.grey),
                           suffixIcon: widget,
                      )),
                          /*widget == null ? Container(): Container(child: widget,)*/
           ) ],
          ),
        )
      ]),
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
