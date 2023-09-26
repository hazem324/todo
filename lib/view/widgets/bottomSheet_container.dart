import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/view/widgets/bottomsheet_button.dart';
import 'package:todo/view/widgets/elevation_button.dart';

class BottomSheetContainer extends StatelessWidget {
  final Function()? completTask;
  final Function()? deletTask;
  late int index;
   BottomSheetContainer(
      {required this.completTask, required this.deletTask,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ButtonElevationWidget(
                    borderColor: Colors.purple,
                    backColor: Colors.purple,
                    textColor: Colors.white,
                    titel: ' Task Completed',
                    onPressed: completTask!(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BottomButtonElevation(
  backColor: Colors.red,
  textColor: Colors.white,
  borderColor: Colors.white,
  titel: 'Delet Task',
  onPressed: 
    deletTask!(), index:  index,
  
),

                ),
                Positioned(
                  bottom: 5,
                  child: ButtonElevationWidget(
                    backColor: Colors.white,
                    textColor: Colors.purple,
                    borderColor: Colors.white,
                    titel: ' Cancel ',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )));
  }
}
