import 'package:flutter/material.dart';
import '../../controllers/game_controller.dart';
import '../../widgets/update_game.dart';
import '../../models/game.dart';

class GameSetting extends StatelessWidget {
  final int _gameId;
  GameSetting(this._gameId);

  @override
  Widget build(BuildContext context) {
    final _game = Game.fetchById(_gameId);

    return Scaffold(
      appBar: AppBar(
        title: Text(_game.name),
      ),
      body: UpdateGame(_game),
      floatingActionButton: FloatingActionButton(
        onPressed: _deleteGame(_gameId),
        child: Icon(Icons.delete),
        backgroundColor: Colors.redAccent,
        ),
    );
  }

  _deleteGame(int gameId) {
    final GameController gc = new GameController();
    gc.deleteGame(gameId);
  }
}