import 'package:flutter/material.dart';
import '../screens/finished_tasks_screen.dart';

class MyPopup extends StatelessWidget {
  const MyPopup();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (selectedValue) {
          if (selectedValue == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) {
                return FinishedTasksScreen();
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
