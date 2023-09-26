import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/pages_name.dart';
import 'package:todo/view/widgets/bottomsheet_button.dart';
import 'package:todo/view/widgets/date_picker.dart';
import 'package:todo/view/widgets/elevation_button.dart';
import 'package:todo/view/widgets/task_container.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TaskController taskController = Get.put(TaskController());

  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEE, d MMM').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    taskController.getTask();
  }

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
              child: ButtonElevationWidget(
                  titel: " + Add Task",
                  onPressed: ()async  {
                     print("Add Task button pressed");
                    await Navigator.pushNamed(context, addTaskPage);
                    taskController.getTask();
                  }),
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
          child: PickerDate(
            dateTextStyle: latoTextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
            dayTextStyle: latoTextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
            monthTextStyle: latoTextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
            selectDate: (date) {
              selectedDate = date;
              print("the selected date is $selectedDate");
            },
          ),
        ),
// show tasks list

        Expanded(
          child: Obx((() {
            return AnimationLimiter(
              child: ListView.builder(
                  itemCount: taskController.alltasksList.length,
                  itemBuilder: (context, index) {
                    print(
                        " items count is ========= ${taskController.alltasksList.length}");
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 400),
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: InkWell(
                              onTap: () {
                                _modalBottomSheetMenu( index,
                                  context,
                                  taskController.alltasksList[index],
                                );
                                
                                taskController.getTask();
                              },
                              child: TaskContainer(
                                taskModel: taskController.alltasksList[index],
                              )),
                        ),
                      ),
                    );
                  }),
            );
          })),
        )
      ])),
    );
  }

  void _modalBottomSheetMenu(
    int index,
    BuildContext context,
    TaskModel taskModel,
  ) {
    showModalBottomSheet(  
      context: context,
      builder: (builder) {
        return Container(
          height: 220,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: BottomButtonElevation(
                    borderColor: Colors.purple,
                    backColor: Colors.purple,
                    textColor: Colors.white,
                    titel: ' Task Completed',
                    onPressed:
                     () {
                      taskController.taskCompletUpDate(
                          taskController.alltasksList[index].id!);
                          taskController.getTask();
                      Navigator.pop(context);
                    }, index: index, 
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
                    index: index,
                    onPressed: () {
                      taskController.deletTask(
                        taskController.alltasksList[index],
                      );
                      taskController.getTask();
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Spacer(), // Add Spacer to take remaining space
                ButtonElevationWidget(
                  backColor: Colors.white,
                  textColor: Colors.purple,
                  borderColor: Colors.white,
                  titel: ' Cancel ',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
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
