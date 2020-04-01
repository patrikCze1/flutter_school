import '../controllers/game_controller.dart';
import 'package:flutter/material.dart';
import '../models/game.dart';

class UpdateGame extends StatefulWidget {
  Game _game;
  UpdateGame(this._game);

  @override
  _UpdateGametate createState() => _UpdateGametate();
}

class _UpdateGametate extends State<UpdateGame> {
  final _formKey = GlobalKey<FormState>();
  //Game _game = widget._game;

  @override
  Widget build(BuildContext context) {
    Game game = new Game(null, null, null, null, null, null, null, null);

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: widget._game.name,
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
                initialValue: widget._game.position,
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
                initialValue: widget._game.photo,
                onSaved: (value) => setState(() => game.photo = value),
              ),
            ),
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                //initialValue: widget._game.date,
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
                child: 
                //Icon(Icons.add),
                
                Text('Create'),
              ),
            )
          ],
        ));
  }

  _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); //will save form
      var gameController = new GameController();
      print('updating game');
      //gameController.updateGame(game);

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
