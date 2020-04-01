import 'package:first_app/controllers/task_controller.dart';

import '../controllers/game_controller.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class CreateTaskForm extends StatefulWidget {
  final int _gameId;

  CreateTaskForm(this._gameId);

  @override
  _CreateTaskFormState createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Task task = new Task(null, null, null, null, false);

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill title';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => task.title = value),
              ),
            ),
            CustomField(
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Text'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill text';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => task.text = value),
              ),
            ),
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Position'),
                onSaved: (value) => setState(() => task.checkPointId = int.parse(value)),
              ),
            ),
            
            RaisedButton(
              onPressed: _submitForm,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                ),
                padding: new EdgeInsets.all(15),
                child: Text('Create', style: TextStyle()),
              ),
            )
          ],
        ));
  }

  _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); //will save form
      TaskController tc = new TaskController();
      //tc.save(task);
      print('creating task');

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saving Data')));

      //Navigator.pop(context); //return back
    }
  }

  Widget CustomField(TextFormField filed) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: filed,
    );
  }
}
