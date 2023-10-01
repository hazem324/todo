import 'package:flutter/material.dart';
import 'package:todo/data_base/data_base.dart';
import 'package:todo/view/screen.dart/add_task_page.dart';
import 'package:todo/view/screen.dart/home_page.dart';
import 'package:todo/pages_name.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await DataBaseTask.initialDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: homePage,
      routes: {
        homePage: (context) => HomePage(),
        addTaskPage: (context) => AddTaskPage(),
       
      },
    );
  }
}
