import 'package:flutter/foundation.dart';
import 'package:todoapp/models/tasks.dart';

class TaskDataModel extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];

  void addToTaskList(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  Task getTaskUsingIndex(int index) {
    return _tasks[index];
  }

  int getTasksCount() {
    return _tasks.length;
  }

  void toggleTaskDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
