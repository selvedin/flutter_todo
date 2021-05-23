import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/tasks_list.dart';
import '../widgets/my_popup.dart';
import '../widgets/task_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Pattaya',
          ),
        ),
        actions: [
          MyPopup(),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: TaskCard(),
            ),
            Container(
              height: 300,
              child: TasksList(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
