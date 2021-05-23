import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/finished_tasks_screen.dart';

class TaskItem extends StatelessWidget {
  final String id;
  final String title;
  final DateTime createdAt;
  final bool isFinished;
  Function setTaskDone;

  TaskItem(
      {this.id, this.title, this.createdAt, this.isFinished, this.setTaskDone});
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
          isFinished
              ? Icon(Icons.check)
              : IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () => setTaskDone(id),
                  color: Colors.green,
                ),
        ],
      ),
    );
  }
}
