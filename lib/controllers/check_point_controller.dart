import '../models/check_point.dart';

class CheckPointController {

  static CheckPoint fetchById(int checkPointId) {
    
    List<CheckPoint> checkPoints = CheckPoint.fetchAll();

    for (var checkPoint in checkPoints) {
      if(checkPoint.id == checkPointId) {
        return checkPoint;
      }
    }
  }

  Future<Null> addCheckPoint(CheckPoint checkPoint) async {
    print('addCheckPoint');
    //todo
  }
}