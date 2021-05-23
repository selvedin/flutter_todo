import 'package:flutter/material.dart';

class FinishedTasksScreen extends StatelessWidget {
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
      body: Center(
        child: Text('This is the place for finished tasks'),
      ),
    );
  }
}
