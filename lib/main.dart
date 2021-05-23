import 'package:flutter/material.dart';
import './screens/finished_tasks_screen.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My To-Do App'),
      routes: {
        FinishedTasksScreen.routeName: (ctx) => FinishedTasksScreen([]),
      },
    );
  }
}
