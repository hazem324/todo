import 'package:get/get.dart';
import 'package:todo/data_base/data_base.dart';
import 'package:todo/model/task_model.dart';

class TaskController extends GetxController {
  void onRead() {
    getTask();
    super.onReady();
  }

  var alltasksList = <TaskModel>[].obs;
  Future<int> addTask({TaskModel? taskModel}) async {
    return await DataBaseTask.insertdb(taskModel);
  }

  // get all tasks from db

  getTask() async {
    List<Map<String, dynamic>> tasks = await DataBaseTask.query();
    alltasksList
        .assignAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
  }

  deletTask(TaskModel taskModel) {
    var d = DataBaseTask.delete(taskModel);
    print(" delet method has called $d");
  }
}
