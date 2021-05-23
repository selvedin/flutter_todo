import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final DateTime createdAt;
  final bool isFinished;

  TaskItem({this.title, this.createdAt, this.isFinished});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat.yMEd().format(createdAt),
          ),
          Icon(isFinished ? Icons.check : Icons.timer),
        ],
      ),
    );
  }
}
