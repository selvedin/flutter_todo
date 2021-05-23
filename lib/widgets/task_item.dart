import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final DateTime createdAt;
  final bool isFinished;

  TaskItem({this.title, this.createdAt, this.isFinished});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            title,
          ),
          Text(
            createdAt.toString(),
          ),
          Text(
            isFinished ? 'Yes' : 'No',
          ),
        ],
      ),
    );
  }
}
