import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data_model.dart';
import 'package:todoapp/models/tasks.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";
    return SingleChildScrollView(
      child: Container(
        height: 1000.0,
        color: Color(0xff757575),
        child: Container(
          height: 1000.0,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
              ),
              TextField(
                controller: controller,
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                  print(newTaskTitle);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () {
                  print(newTaskTitle + controller.text);
                  Provider.of<TaskDataModel>(context, listen: false)
                      .addToTaskList(Task(name: controller.text));
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
