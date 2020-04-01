import 'package:flutter/material.dart';
import '../../main.dart';
import '../../models/game.dart';
import '../../models/user.dart';
import '../../models/task.dart';
import '../../models/check_point.dart';
import '../../controllers/check_point_controller.dart';

class GameDetail extends StatelessWidget {
  final int _gameId;

  GameDetail(this._gameId);

  @override
  Widget build(BuildContext context) {
    final game = Game.fetchById(_gameId);

    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _onGameSettingsTap(context, _gameId),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: 
        <Widget>[
          Image.asset(
            'assets/images/' + game.photo,
            fit: BoxFit.cover,
          ),
          new Container(//users
              height: 130.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget> [
                  
                ]..addAll(_users(game))
                ),
              ),
        ]..addAll(_checkPoints(game.tasks, context)), //add list of sections to column
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addTask(context, game.id),
        label: Text('New task'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  List<Widget> _checkPoints(List<Task> tasks, BuildContext context) {
    return tasks
        .map((task) => Card(
              margin: const EdgeInsets.all(6.0),
              child: ListTile(
                title: Text(task.title),
                subtitle:
                    Text(CheckPoint.fetchById(task.checkPointId).position),
                trailing: task.completed
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green[600],
                      )
                    : Text(''),
                onTap: () => _onTaskTap(context, task.id),
              ),
            ))
        .toList();
  }

  CheckPoint _getCheckPoint(int checkPointId) {
    CheckPoint chp = CheckPoint.fetchById(checkPointId);
    return chp;
  }

  List <Widget> _users(Game game) {
    List<User> users = User.fetchAll();

    return users.map((user) => Card(
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/' + user.photo)) 
        ), 
        child: new Text(user.name + ', ' + user.age.toString(), style: TextStyle(color: Colors.black,)),
      ),
    )
    ).toList();
  }

  _onGameSettingsTap(BuildContext context, int gameId) {
    Navigator.pushNamed(context, gameSettingRoute, arguments: {'id': gameId});
  }

  _onTaskTap(BuildContext context, int taskId) {
    Navigator.pushNamed(context, '/task_detail', arguments: {'id': taskId});
  }

  _addTask(BuildContext context, int gameId) {
    Navigator.pushNamed(context, '/task_create', arguments: {'id': gameId});
  }
}
