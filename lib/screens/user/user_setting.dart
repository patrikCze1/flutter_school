import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../widgets/user_form.dart';

class UserSetting extends StatelessWidget {
  final int _userId;

  UserSetting(this._userId);

  @override
  Widget build(BuildContext context) {
    final user = User.fetchById(_userId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Account setting'),
      ),
      body: Column(
        //name
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/' + user.photo,
            fit: BoxFit.cover,
          ),
          UserForm(user: user,),
        ],
      ),
    );
  }
}
