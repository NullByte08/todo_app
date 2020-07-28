import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;

  final Function checkBoxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longPressCallback,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkBoxCallback,
        ));
  }
}

/*
// NOTE: Every time the value of the checkboxState variable changes inside the onChanged callback, a new TaskCheckBox widget is created from the scratch, its not that its state is changing.
class TastCheckBox extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;

  TastCheckBox({this.checkboxState, this.toggleCheckboxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
*/
