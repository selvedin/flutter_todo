import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_item.dart';

class FinishedTasksScreen extends StatelessWidget {
  static const routeName = "/finished-tasks";
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
        height: MediaQuery.of(context).size.height,
        child: tasks.length > 1
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: tasks.length,
                itemBuilder: (_, index) => TaskItem(
                  id: tasks[index].id,
                  title: tasks[index].title,
                  createdAt: tasks[index].createdAt,
                  isFinished: tasks[index].isFinished,
                ),
              )
            : Container(
                child: Column(
                  children: [
                    Text('No finished tasks'),
                    Image.network(
                        'https://icons.iconarchive.com/icons/cornmanthe3rd/squareplex/512/Utilities-tasks-icon.png'),
                  ],
                ),
              ),
      ),
    );
  }
}
