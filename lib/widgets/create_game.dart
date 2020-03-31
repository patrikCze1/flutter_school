import 'package:first_app/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import '../models/game.dart';

class CreateGameForm extends StatefulWidget {
  @override
  _CreateGameFormState createState() => _CreateGameFormState();
}

class _CreateGameFormState extends State<CreateGameForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Game game = new Game(null, null, null, null, null);

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill name';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => game.name = value),
              ),
            ),
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Position'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill position';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => game.position = value),
              ),
            ),
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Profile photo'),
                onSaved: (value) => setState(() => game.photo = value),
              ),
            ),
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill date';
                  }
                  return null;
                },
                //onSaved: (value) => setState(() => game.photo = value),
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
      var gameController = new GameController();
      print('creating game');
      //gameController.createGame(game);

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
