import '../models/game.dart';
import '../models/task.dart';

class GameController {
  static List<Game> fetchAll() {
    return Game.fetchAll();
  }

  Future<Game> createGame(Game game) async {
    print('createGame');
    //todo
  } 

  Future<Null> deleteGame(int id) async {
    print('deleteGame');
    //todo
  }

  Future<Null> createTask(int gameId, Task task) async {
    print('add task');
    //todo
  }
}