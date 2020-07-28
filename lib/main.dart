import 'package:flutter/material.dart';
import 'package:todoapp/models/task_data_model.dart';
import 'package:todoapp/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskDataModel>(
      create: (context) => TaskDataModel(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
