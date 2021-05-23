import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tasks.dart';

import '../widgets/task_item.dart';
import '../models/task.dart';

class FinishedTasksScreen extends StatelessWidget {
  static const routeName = "/finished-tasks";

  @override
  Widget build(BuildContext context) {
    final finished = Provider.of<Tasks>(context).finished;

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
        child: finished.length > 0
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: finished.length,
                itemBuilder: (_, index) => TaskItem(
                  id: finished[index].id,
                  title: finished[index].title,
                  createdAt: finished[index].createdAt,
                  isFinished: finished[index].isFinished,
                  priority: finished[index].priority.toString().split('.')[1],
                ),
              )
            : Container(
                child: Column(
                  children: [
                    Text('No finished tasks',
                        style: Theme.of(context).textTheme.headline6),
                    Image.network(
                        'https://icons.iconarchive.com/icons/cornmanthe3rd/squareplex/512/Utilities-tasks-icon.png'),
                  ],
                ),
              ),
      ),
    );
  }
}
