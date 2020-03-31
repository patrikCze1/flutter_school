import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../main.dart';

class UserDetail extends StatelessWidget {
  final int _userId;

  UserDetail(this._userId);

  @override
  Widget build(BuildContext context) {
    final user = User.fetchById(_userId);

    return Scaffold(
      appBar: AppBar(
          title: Text('Profile'),
          actions: <Widget>[
            IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _onSettingTap(context, user.id),
          )
          ],
        ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/' + user.photo, fit: BoxFit.cover,),
            Center(child: Text(user.name),),
            Center(child: Text(user.sex),),
            Center(child: Text(user.age.toString()),),
          ],
          
        ),
    );
    }

    _onSettingTap(BuildContext context, int userId) {
    Navigator.pushNamed(context, userSettingRoute, arguments: {'id': userId});
  }
}