import 'package:flutter/material.dart';

import '../data/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.taskList});

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];

          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
