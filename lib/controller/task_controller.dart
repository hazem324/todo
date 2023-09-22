import 'package:get/get.dart';
import 'package:todo/data_base/data_base.dart';
import 'package:todo/model/task_model.dart';

class TaskController extends GetxController {
  void onRead() {
    super.onReady();
  }
var  alltasksList = <TaskModel> [].obs;
  Future<int> addTask( { TaskModel? taskModel}) async {
    return await DataBaseTask.insertdb(taskModel);
  }


  // get all tasks from db 

  void getTask () async{
    List<Map<String , dynamic>> tasks = await DataBaseTask.query();
    alltasksList.assignAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
  }
  }
