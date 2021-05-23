import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_item.dart';

class FinishedTasksScreen extends StatelessWidget {
  final List<Task> tasks;
  FinishedTasksScreen(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finished tasks'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.home_filled),
          )
        ],
      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: tasks.length,
          itemBuilder: (_, index) => TaskItem(
            id: tasks[index].id,
            title: tasks[index].title,
            createdAt: tasks[index].createdAt,
            isFinished: tasks[index].isFinished,
          ),
        ),
      ),
    );
  }
}
