import '../models/task.dart';

class TaskController {
  static List<Task> fetchAll() {
    return Task.fetchAll();
  }

  Future<Task> updateTask(Task task) async {
    List<Task> tasks = Task.fetchAll();

    for (var t in tasks) {
      if(t.id == task.id) {
        t.title = task.title;
        t.text = task.text;
        t.checkPointId = task.checkPointId;
        t.completed = task.completed;
      }
    }
  }

  void save(Task task) {
    List<Task> tasks = Task.fetchAll();
    tasks.add(task);
  }

  void markAsCompleted(int taskId) {
    List<Task> tasks = Task.fetchAll();

    for (var t in tasks) {
      if(t.id == taskId) {
        t.completed = !t.completed;
      }
    }
  }

  void delete(int taskId) {
    //delete
  }
}