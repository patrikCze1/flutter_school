import 'package:first_app/models/check_point.dart';
import './check_point.dart';
import '../controllers/check_point_controller.dart';

class Task {
  final int id;
  final String title;
  final String text;
  final int checkPointId;
  final bool completed;

  Task(this.id, this.title, this.text, this.checkPointId, this.completed);

  static List<Task> fetchAll() {
    return [
        Task(1,'pivo', 'vypij 3 piva',2, false),
        Task(2,'pivo', 'vypij 2 piva',3, false),
        Task(3,'pivo', 'vypij 3 piva',3, true),
        Task(4,'pivo', 'vypij 3 piva',1, true),
        Task(5,'panak', 'vypij 2 panaky',1, false),
        Task(6,'pivo', 'vypij 3 piva',5, false),
    ];
  }

  static Task fetchById(int taskId) {
    List<Task> tasks = Task.fetchAll();

    for (var task in tasks) {
      if(task.id == taskId) {
        return task;
      }
    }
  }

  void addTask(Task task) {
    List<Task> tasks = Task.fetchAll();
    tasks.add(task);
  }

  static CheckPoint getCheckPoint(int checkPointId) {
    return CheckPoint.fetchById(checkPointId);
  }
}