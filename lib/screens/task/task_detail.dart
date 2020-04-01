import 'package:flutter/material.dart';
import '../../models/game.dart';
import '../../models/task.dart';
import '../../models/check_point.dart';
import '../../main.dart';
import '../../controllers/task_controller.dart';
import '../../widgets/map.dart';

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
      body: MapWidget(),
      /*
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/pub.jpg',
              fit: BoxFit.cover,
            ),
            taskDetail(task),
          ]),*/
      floatingActionButton: FloatingActionButton(
        onPressed:
            task.completed ? () => _delete(context) : () => _complete(context),
        child: Icon(task.completed ? Icons.delete : Icons.check_circle),
        backgroundColor: task.completed ? Colors.red : Colors.green[600],
      ),
    );
  }

  Container taskDetail(Task task) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
        Center(
          child: Text(
            task.title,
            style: TextStyle(fontSize: 26.0),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          child: Text(task.text),

        ),
        
        
      ]),
    );
  }

  void _complete(BuildContext context) {
    TaskController tc = new TaskController();
    tc.markAsCompleted(_taskId);
    print('complete');

    Navigator.pop(context);
  }

  void _delete(BuildContext context) {
    TaskController tc = new TaskController();
    tc.delete(_taskId);
    print('delete');

    Navigator.pop(context);
  }
}
