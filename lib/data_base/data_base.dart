import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task_model.dart';

class DataBaseTask {
  static Database? _bd;
  static final int version = 2;
  static final String tableName = "taskTable";

  static Future<void> initialDB() async {
    if (_bd != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "/task.db";
      print("Database path is             : $_path");

      _bd = await openDatabase(
        _path,
        version: version,
        onCreate: (db, version) {
          print("create a db =================");
          return db.execute('''  
CREATE TABLE "$tableName" (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title STRING,
  notes TEXT,
  isCompleted INTEGER,
  date STRING,
  startTime STRING,
  endTime STRING,
  remind INTEGER,
  color INTEGER,
  repeat STRING
  
)
''');
        },
      );
    } catch (e) {
      print("data base initial problem $e");
    }
  }
  static Future<int> insertdb(TaskModel? taskModel) async {
    print("INSERT METHOD HAS CALLED ");
    return await _bd?.insert(tableName, taskModel!.toJson()) ?? 1;
  }
  
  static Future<List<Map<String, dynamic>>> query() async {
    print("the query method has called            =");
    return _bd!.query(tableName);
  }
}
