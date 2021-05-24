import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/tasks_list.dart';
import '../widgets/my_popup.dart';
import '../widgets/task_card.dart';
import '../providers/tasks.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(Duration(microseconds: 50)).then((res) async {
      Provider.of<Tasks>(context, listen: false).loadTasks();
    });
    super.initState();
  }

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
          const MyPopup(),
        ],
      ),
      drawer: const AppDrawer(),
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
