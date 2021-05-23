import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tasks.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class TaskCard extends StatefulWidget {
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  var _inputFocus = FocusNode();
  var _inputController = TextEditingController();
  DateTime _createdAt = DateTime.now();
  String _errorText;
  String _priority = "LOW";

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

  TaskPriority getPriority() {
    switch (_priority) {
      case "NORMAL":
        return TaskPriority.NORMAL;
      case "HIGH":
        return TaskPriority.HIGH;
      case "URGENT":
        return TaskPriority.URGENT;
      default:
        return TaskPriority.LOW;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  //_updateState(); // we need to trigger changing state
                },
              ),
              DropdownButton(
                  hint: Text('Priority'),
                  isExpanded: true,
                  value: _priority,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _priority = newValue;
                    });
                    print(newValue);
                  },
                  items: TaskPriority.values
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.toString().split(".")[1].toString(),
                      child: Text(
                        value.toString().split(".")[1].toString(),
                      ),
                    );
                  }).toList()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('dd-MM-yyyy hh:mm a').format(_createdAt)),
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
                    onPressed: () {
                      if (_inputController.text.isNotEmpty) {
                        Provider.of<Tasks>(context, listen: false).addTask(
                            _inputController.text,
                            _createdAt,
                            false,
                            getPriority());
                        setState(() {
                          _errorText = null;
                          _inputController.text = '';
                        });
                      } else {
                        setState(() {
                          _errorText = "Title is required";
                        });
                      }
                    },
                    child: Text('Add to list'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
