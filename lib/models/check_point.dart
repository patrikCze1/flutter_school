import './task.dart';

class CheckPoint {
  final int id;
  final String name;
  final String position;

  CheckPoint(this.id, this.name, this.position);

  static List<CheckPoint> fetchAll() {
    return [
        CheckPoint(1,'Hospoda A', 'ulice 1'),
        CheckPoint(2,'Hospoda V', 'ulice 2'),
        CheckPoint(3,'Hospoda B', 'ulice 3'),
        CheckPoint(4,'Hospoda C', 'ulice 4'),
        CheckPoint(5,'Hospoda D', 'ulice 5'),
        CheckPoint(6,'Hospoda E', 'ulice 6'),
    ];
  }

  static CheckPoint fetchById(int checkPointId) {
    List<CheckPoint> checkPoints = CheckPoint.fetchAll();

    for (var checkPoint in checkPoints) {
      if(checkPoint.id == checkPointId) {
        return checkPoint;
      }
    }
  }

  void addCheckPoint(CheckPoint checkPoint) {
    //todo
  }
}