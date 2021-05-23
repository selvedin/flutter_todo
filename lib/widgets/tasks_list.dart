import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_item.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key key,
    @required List<Task> tasks,
    @required setTasksDone,
  })  : _tasks = tasks,
        _setTaskDone = setTasksDone,
        super(key: key);

  final List<Task> _tasks;
  final Function _setTaskDone;

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  Future<bool> confirmTaskDeleting() {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Deleting task'),
              content: Row(
                children: [
                  Text('Are You sure?'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.warning,
                      size: 20,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: Text('OK'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget._tasks
          .map((task) => Dismissible(
                key: ValueKey(task.id),
                background: Container(color: Theme.of(context).errorColor),
                direction: DismissDirection.endToStart,
                confirmDismiss: (_) {
                  return confirmTaskDeleting();
                },
                onDismissed: (_) {
                  setState(() {
                    widget._tasks.removeWhere((el) => el.id == task.id);
                  });
                },
                child: TaskItem(
                  id: task.id,
                  title: task.title,
                  createdAt: task.createdAt,
                  isFinished: task.isFinished,
                  setTaskDone: widget._setTaskDone,
                ),
              ))
          .toList(),
    );
  }
}
