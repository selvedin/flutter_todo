import 'package:flutter/material.dart';

class FinishedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finished tasks'),
      ),
      body: Center(
        child: Text('This is the place for finished tasks'),
      ),
    );
  }
}
