import 'package:flutter/material.dart';
import '../models/task.dart';
import '../screens/finished_tasks_screen.dart';

class MyPopup extends StatelessWidget {
  const MyPopup({
    Key key,
    @required List<Task> tasks,
  })  : _tasks = tasks,
        super(key: key);

  final List<Task> _tasks;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (selectedValue) {
          if (selectedValue == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) {
                return FinishedTasksScreen(
                    _tasks.where((task) => task.isFinished).toList());
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
            ]);
  }
}
