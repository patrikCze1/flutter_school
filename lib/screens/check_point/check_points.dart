import 'package:flutter/material.dart';
import '../../models/check_point.dart';
import '../../main.dart';

class CheckPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkPoints = CheckPoint.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select check point'),
        actions: <Widget>[
            IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _onNewCheckPointTap(context),
          )
          ],
      ),
      body: ListView(
        padding: new EdgeInsets.all(5.0),
        children: <Widget>[],
      ),
    );
  }

  _onNewCheckPointTap(BuildContext context) {
    Navigator.pushNamed(context, createCheckPointRoute);
  }
}