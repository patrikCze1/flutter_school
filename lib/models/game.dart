import './check_point.dart';
import './user.dart';
import './task.dart';

class Game {
  final int id;
  String name;
  String position;
  List<Task> tasks;
  String photo;
  DateTime date;
  List<int> users;
  String key;
  
  Game(this.id, this.name, this.position, this.tasks, this.photo, this.date, this.users, this.key);

  static List<Game> fetchAll() {
    return [
      Game(1,'Game 1', 'hradec', [
        Task(1,'pivo', 'vypij 3 piva', 2, false),
        Task(2,'pivo', 'vypij 2 piva', 3, true),
      ], 'pub.jpg', new DateTime.now(), [1,2,3,4], 'MojeHra1'),
      Game(2,'Game 2', 'praha', [
        Task(3,'pivo', 'vypij 3 piva', 3, true),
        Task(4,'pivo', 'vypij 3 piva', 1, false),
        Task(5,'panak', 'vypij 2 panaky', 1, false),
      ], 'pub.jpg', new DateTime.now(), [1,2], 'MojeHra2'),
      Game(3,'Game 3', 'pardubice', [
        Task(6,'pivo', 'vypij 3 piva', 5, false),
      ], 'pub.jpg', new DateTime.now(), [1,2,3], 'MojeHra3'),
    ];
  }

  static Game fetchById(int gameId) {
    List<Game> games = Game.fetchAll();

    for (var game in games) {
      if(game.id == gameId) {
        return game;
      }
    }
  }

  void addGame(Game game) {
    List<Game> games = Game.fetchAll();
    games.add(game);
  }
}