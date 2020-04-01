import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../models/game.dart';
import '../../widgets/create_task.dart';

class TaskCreate extends StatelessWidget {
  final int _gameId;
  TaskCreate(this._gameId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New task'),
      ),
      body: CreateTaskForm(_gameId),
    );
  }

}