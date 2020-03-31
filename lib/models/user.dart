class User {
  final int id;
  String name;
  String sex;
  int age;
  String photo;

  User(this.id, this.name, this.age, this.sex, this.photo);

  static List<User> fetchAll() {
    return [
      User(1,'Honza', 22, 'male', 'male.png'),
      User(2,'Petr', 22, 'male', 'male.png'),
      User(3,'Eva', 22, 'male', 'female.png'),
      User(4,'Jarmila', 22, 'male', 'female.png'),
      User(5,'Franta', 22, 'male', 'male.png'),
      User(6,'Mirek', 22, 'male', 'male.png'),
    ];
  }

  static User fetchById(int userId) {
    List<User> users = User.fetchAll();

    for (var user in users) {
      if(user.id == userId) {
        return user;
      }
    }
  }

  void update(User user) {
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