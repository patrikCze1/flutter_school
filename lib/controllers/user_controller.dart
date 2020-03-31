import '../models/user.dart';

class UserController {
  static List<User> fetchAll() {
    return User.fetchAll();
  }

  Future<User> updateUser(User user) async {
    List<User> users = User.fetchAll();

    for (var u in users) {
      if(u.id == user.id) {
        u.age = user.age;
        u.name = user.name;
        u.sex = user.sex;
      }
    }
  } 
}