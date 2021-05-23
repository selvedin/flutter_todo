import 'package:flutter/material.dart';

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
  List<Task> _tasks = [];
  var myString = '';
  String _errorText;

  @override
  void initState() {
    for (int i = 0; i < 100; i++) {
      _tasks.add(Task('Task number ${i + 1}',
          DateTime.now().add(Duration(seconds: i + 1))));
    }
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _addTaskToList() {
    if (_inputController.text.isNotEmpty) {
      _tasks.add(Task(_inputController.text, DateTime.now()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
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
              Container(
                child: Column(
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
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
