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
        primarySwatch: Colors.purple,
        accentColor: Colors.grey,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Pattaya',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
              ),
            ),
      ),
      home: MyHomePage(title: 'My To-Do App'),
      routes: {
        FinishedTasksScreen.routeName: (ctx) => FinishedTasksScreen([]),
      },
    );
  }
}
