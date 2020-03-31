import 'package:flutter/material.dart';
import '../../models/check_point.dart';
import '../../main.dart';

class CreateCheckPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkPoints = CheckPoint.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('New check point'),
      ),
      body: Text('body'),
      floatingActionButton: FloatingActionButton(onPressed: _saveCheckPoint(),),
    );
  }

  _saveCheckPoint() {

  }
}