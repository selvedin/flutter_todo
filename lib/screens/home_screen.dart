import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/app_drawer.dart';

import '../widgets/tasks_list.dart';
import '../widgets/my_popup.dart';
import '../widgets/task_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> _tasks = [];

  void _addTaskToList(String title, DateTime createdAt) {
    if (title.isNotEmpty) {
      setState(() {
        _tasks.add(Task(
          DateTime.now().toIso8601String(),
          title,
          createdAt,
          false,
        ));
      });
    }
  }

  void setTaskDone(String id) {
    var existingIndex = _tasks.indexWhere((task) => task.id == id);
    var existingTask = _tasks.firstWhere((task) => task.id == id);
    if (existingIndex >= 0) {
      var newTask = Task(
          existingTask.id, existingTask.title, existingTask.createdAt, true);
      setState(() {
        _tasks[existingIndex] = newTask;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          MyPopup(tasks: _tasks),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: TaskCard(
                addTaskToList: _addTaskToList,
              ),
            ),
            Container(
              height: 300,
              child: TasksList(
                tasks: _tasks,
                setTasksDone: setTaskDone,
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
