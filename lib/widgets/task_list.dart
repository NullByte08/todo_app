import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data_model.dart';
import 'package:todoapp/widgets/task_tile.dart';
import 'package:todoapp/models/tasks.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task =
            Provider.of<TaskDataModel>(context).getTaskUsingIndex(index);
        return TaskTile(
          taskTitle:
              Provider.of<TaskDataModel>(context).getTaskUsingIndex(index).name,
          isChecked: Provider.of<TaskDataModel>(context)
              .getTaskUsingIndex(index)
              .isDone,
          checkBoxCallback: (bool checkboxState) {
            /*// NOTE: Every time the value of the checkboxState variable changes inside the onChanged callback, a new TaskTile widget is created from the scratch, its not that its state is changing.
            setState(() {
              tasks[index].toggleDone();
            });*/
            Provider.of<TaskDataModel>(context, listen: false)
                .toggleTaskDone(index);
          },
          longPressCallback: () {
            Provider.of<TaskDataModel>(context, listen: false).deleteTask(task);
          },
        );
      },
      itemCount: Provider.of<TaskDataModel>(context).getTasksCount(),
    );
  }
}
