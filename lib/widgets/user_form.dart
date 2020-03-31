import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user.dart';
import '../controllers/user_controller.dart';

class UserForm extends StatefulWidget {
  final User user;

  UserForm({this.user});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: widget.user.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Fill name';
                  }
                  return null;
                },
                
                onSaved: (value) => setState(() => widget.user.name = value),
              ),
            ),
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                initialValue: widget.user.age.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Fill age';
                  }
                  return null;
                },
                onSaved: (value) =>
                    setState(() => widget.user.age = int.parse(value)),
              ),
            ),
            CustomField(
              TextFormField(
                decoration: InputDecoration(labelText: 'Sex'),
                initialValue: widget.user.sex,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Fill sex';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => widget.user.sex = value),
              ),
            ),
            RaisedButton(
              onPressed: _submitForm,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                ),
                padding: new EdgeInsets.all(15),
                child: Text('Update', style: TextStyle()),
              ),
            )
          ],
        ));
  }

  _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Saving Data')));

      var userController = new UserController();
      print('updating user');
      userController.updateUser(widget.user);
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
