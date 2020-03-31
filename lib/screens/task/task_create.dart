import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../models/game.dart';

class TaskCreate extends StatelessWidget {
  final int _gameId;
  TaskCreate(this._gameId);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New task'),
      ),
      body: Text('create task'),
    );
  }

}