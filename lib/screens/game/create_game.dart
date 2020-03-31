import 'package:flutter/material.dart';
import '../../models/game.dart';
import '../../widgets/create_game.dart';

class CreateGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New game'),
      ),
      body: CreateGameForm(),
    );
  }
}