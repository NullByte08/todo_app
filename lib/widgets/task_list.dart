import 'package:flutter/material.dart';
import 'package:todoapp/widgets/task_tile.dart';
import 'package:todoapp/models/tasks.dart';

class TaskList extends StatefulWidget {
  TaskList({this.tasks});
  final List<Task> tasks;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = widget.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkBoxCallback: (bool checkboxState) {
            // NOTE: Every time the value of the checkboxState variable changes inside the onChanged callback, a new TaskTile widget is created from the scratch, its not that its state is changing.
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
