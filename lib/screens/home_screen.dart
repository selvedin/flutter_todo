import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/task.dart';
import '../widgets/task_item.dart';
import '../screens/finished_tasks_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _inputController = TextEditingController();
  var _inputFocus = FocusNode();
  List<Task> _tasks = [];
  var myString = '';
  String _errorText;
  DateTime _createdAt = DateTime.now();

  @override
  void initState() {
    Future.delayed(Duration(microseconds: 50)).then((res) {
      FocusScope.of(context).requestFocus(_inputFocus);
    });
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputFocus.dispose();
    super.dispose();
  }

  void _generateTasks() {
    for (int i = 0; i < 30; i++) {
      _tasks.add(Task(DateTime.now().toIso8601String(), 'Task number ${i + 1}',
          DateTime.now().add(Duration(minutes: i + 1)), false));
    }
  }

  void _addTaskToList() {
    if (_inputController.text.isNotEmpty) {
      _tasks.add(Task(DateTime.now().toIso8601String(), _inputController.text,
          _createdAt, false));
      setState(() {
        _inputController.text = '';
        _errorText = null;
      });
    } else {
      setState(() {
        _errorText = "This field is required";
      });
    }
    _printTasks();
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

  void _printTasks() {
    _tasks.forEach((task) {
      print(task.title);
    });
  }

  void _getDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 30)))
        .then((value) {
      setState(() {
        _createdAt = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
              onSelected: (selectedValue) {
                if (selectedValue == 0) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return FinishedTasksScreen();
                    }),
                  );
                }
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Finished Tasks'),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text('Deleted Tasks'),
                      value: 1,
                    ),
                  ]),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        focusNode: _inputFocus,
                        controller: _inputController,
                        decoration: InputDecoration(
                          hintText: 'Write something ...',
                          labelText: 'Title',
                          errorText: _errorText,
                        ),
                        onChanged: (value) {
                          setState(() {}); // we need to trigger changing state
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateFormat('dd-MM-yyyy hh:mm a')
                              .format(_createdAt)),
                          IconButton(
                            icon: Icon(Icons.calendar_today_outlined),
                            onPressed: _getDate,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: _addTaskToList,
                            child: Text('Add to list'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: ListView(
                children: _tasks
                    .map((task) => TaskItem(
                          id: task.id,
                          title: task.title,
                          createdAt: task.createdAt,
                          isFinished: task.isFinished,
                          setTaskDone: setTaskDone,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
