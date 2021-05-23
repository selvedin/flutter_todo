import 'package:flutter/material.dart';
import '../models/task.dart';

class Tasks with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  List<Task> get finished {
    return [...tasks.where((el) => el.isFinished)];
  }

  void addTask(
      String title, DateTime date, bool isFinished, TaskPriority priority) {
    _tasks.add(Task(
        DateTime.now().toIso8601String(), title, date, isFinished, priority));
    notifyListeners();
  }

  void removeTask(String id) {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void setTaskDone(String id) {
    var ind = _tasks.indexWhere((element) => element.id == id);
    if (ind >= 0) {
      var task = _tasks.firstWhere((element) => element.id == id);
      var newTask =
          Task(task.id, task.title, task.createdAt, true, task.priority);
      _tasks[ind] = newTask;
      notifyListeners();
    }
  }
}
