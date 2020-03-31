import 'package:flutter/material.dart';
import '../../models/game.dart';
import '../../models/task.dart';
import '../../models/check_point.dart';
import '../../main.dart';

class TaskDetail extends StatelessWidget {
  final int _taskId;

  TaskDetail(this._taskId);

  @override
  Widget build(BuildContext context) {
    final task = Task.fetchById(_taskId);

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Text(task.text),
    );
  }
}
