import 'package:flutter/material.dart';
import '../screens/finished_tasks_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('TODO app'),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  child: Text("Finished Tasks"),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(FinishedTasksScreen.routeName);
                  },
                ),
                Icon(Icons.done_all),
              ],
            ),
          )
        ],
      ),
    );
  }
}
