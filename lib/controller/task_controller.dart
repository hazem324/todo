import 'package:get/get.dart';
import 'package:todo/data_base/data_base.dart';
import 'package:todo/model/task_model.dart';

class TaskController extends GetxController {
  void onRead() {
    super.onReady();
  }

  Future<int> addTask( { TaskModel? taskModel}) async {
    return await DataBaseTask.insertdb(taskModel);
  }
}
