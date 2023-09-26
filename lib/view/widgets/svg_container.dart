import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container (child: 
     SvgPicture.asset(
            "assets/svgIcon/Add notes-bro.svg",
            
          ), );
  }

}