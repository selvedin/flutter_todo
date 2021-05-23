import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/task.dart';
import './widgets/task_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My To-Do App'),
    );
  }
}

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
      _tasks.add(Task('Task number ${i + 1}',
          DateTime.now().add(Duration(minutes: i + 1))));
    }
  }

  void _addTaskToList() {
    if (_inputController.text.isNotEmpty) {
      _tasks.add(Task(_inputController.text, _createdAt));
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
                        title: task.title,
                        createdAt: task.createdAt,
                        isFinished: task.isFinished))
                    .toList(),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
