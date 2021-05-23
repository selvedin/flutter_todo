import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tasks.dart';

import 'package:intl/intl.dart';

class TaskItem extends StatelessWidget {
  final String id;
  final String title;
  final DateTime createdAt;
  final bool isFinished;
  final String priority;

  TaskItem(
      {@required this.id,
      @required this.title,
      @required this.createdAt,
      @required this.isFinished,
      @required this.priority});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            // onTap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(builder: (_) {
            //       return FinishedTasksScreen();
            //     }),
            //   );
            // },
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            DateFormat('dd-MM-yyyy hh:mm a').format(createdAt),
          ),
          Text(priority),
          isFinished
              ? Icon(Icons.check)
              : IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    Provider.of<Tasks>(context, listen: false).setTaskDone(id);
                  },
                  color: Colors.green,
                ),
        ],
      ),
    );
  }
}
