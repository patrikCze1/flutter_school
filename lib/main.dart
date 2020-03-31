import 'package:flutter/material.dart';
import './screens/games.dart';
import './screens/game/game_detail.dart';
import './screens/user/user_detail.dart';
import './screens/game/create_game.dart';
import './screens/game/game_setting.dart';
import './screens/user/user_setting.dart';
import './screens/check_point/check_points.dart';
import './screens/task/task_create.dart';
import './screens/task/task_detail.dart';
import './screens/task/task_detail.dart';
import 'package:camera/camera.dart'; //ios dont have camera

const gamesRoute = '/';
const gameDetailRoute = '/game_detail';
const gameCreateRoute = '/game_create';
const gameSettingRoute = '/game_setting';
const userDetailRoute = '/user_detail';
const userSettingRoute = '/user_setting';
const checkPointsRoute = '/check_points';
const createCheckPointRoute = '/check_point_create';
const createTaskRoute = '/task_create';
const taskDetailRoute = '/task_detail';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: _routes(),
      theme: ThemeData(
        primaryColor: Colors.purple[700],
        appBarTheme: AppBarTheme(),
        textTheme: TextTheme(),
      ),
      home: Games(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;

      switch (settings.name) {
        case gamesRoute:
          screen = Games();
          break;

        case gameDetailRoute:
          screen = GameDetail(arguments['id']);
          break;

        case userDetailRoute:
          screen = UserDetail(arguments['id']);
          break;

        case userSettingRoute:
          screen = UserSetting(arguments['id']);
          break;

        case gameCreateRoute:
          screen = CreateGame();
          break;

        case gameSettingRoute:
          screen = GameSetting(arguments['id']);
          break;

        case createTaskRoute:
          screen = TaskCreate(arguments['id']);
          break;

        case taskDetailRoute:
          screen = TaskDetail(arguments['id']);
          break;

        default:
          return null;
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
//todo - hry podle klice