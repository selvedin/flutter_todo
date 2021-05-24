import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    print(_tasks.length);
    return [..._tasks];
  }

  Future<List<Task>> loadTasks() async {
    List<Task> decodedTasks = [];
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("my_tasks")) {
      final allTasks = prefs.getStringList("my_tasks");
      decodedTasks = allTasks.map((e) => Task.fromMap(json.decode(e))).toList();
    }
    _tasks = [...decodedTasks];
    notifyListeners();
  }

  List<Task> get finished {
    return [...tasks.where((el) => el.isFinished)];
  }

  Future<void> addTask(String title, DateTime date, bool isFinished,
      TaskPriority priority) async {
    _tasks.add(Task(
        DateTime.now().toIso8601String(), title, date, isFinished, priority));
    List<String> decodedTasks =
        _tasks.map((e) => json.encode(e.toMap())).toList();
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("my_tasks", decodedTasks);
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
