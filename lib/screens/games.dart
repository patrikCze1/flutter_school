import 'package:flutter/material.dart';
import '../models/game.dart';
import '../main.dart';

class Games extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final games = Game.fetchAll();

    return Scaffold(
      //floatingActionButton
      appBar: AppBar(
        title: Text('All games'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => _showUserProfile(context, 1),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {

          return _row(context, games[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onCreateTap(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _row(BuildContext context, Game game) {
    final String date = game.date.day.toString() + '/' + game.date.month.toString() + '/' + game.date.year.toString() + ' ' + game.date.hour.toString() + ':' + game.date.minute.toString();
    return Card(child:
    ListTile(
      leading: Icon(Icons.local_drink),
      title: Text(game.name),
      subtitle: Text(date),//'5 people'
      trailing: Icon(Icons.check_circle_outline, color: Colors.blueAccent,),//podle toho jestli tam jsem
      onTap: () => _onGameTap(context, game.id), //action
    )
    );
  }

  _onGameTap(BuildContext context, int gameId) {
    Navigator.pushNamed(context, gameDetailRoute, arguments: {'id': gameId});
  }

  _onCreateTap(BuildContext context) {
    Navigator.pushNamed(context, gameCreateRoute);
  }

  _showUserProfile(BuildContext context, int userId) {
    Navigator.pushNamed(context, userDetailRoute, arguments: {'id': userId});
  }
}
